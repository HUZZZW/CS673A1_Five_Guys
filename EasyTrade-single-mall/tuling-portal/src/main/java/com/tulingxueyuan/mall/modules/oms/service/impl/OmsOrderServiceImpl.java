package com.tulingxueyuan.mall.modules.oms.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.tulingxueyuan.mall.common.api.ResultCode;
import com.tulingxueyuan.mall.common.exception.ApiException;
import com.tulingxueyuan.mall.common.service.RedisService;
import com.tulingxueyuan.mall.dto.CartItemStockDTO;
import com.tulingxueyuan.mall.dto.ConfirmOrderDTO;
import com.tulingxueyuan.mall.dto.OrderDetailDTO;
import com.tulingxueyuan.mall.dto.OrderParamDTO;
import com.tulingxueyuan.mall.modules.oms.mapper.OmsCartItemMapper;
import com.tulingxueyuan.mall.modules.oms.model.OmsCartItem;
import com.tulingxueyuan.mall.modules.oms.model.OmsOrder;
import com.tulingxueyuan.mall.modules.oms.mapper.OmsOrderMapper;
import com.tulingxueyuan.mall.modules.oms.model.OmsOrderItem;
import com.tulingxueyuan.mall.modules.oms.service.OmsCartItemService;
import com.tulingxueyuan.mall.modules.oms.service.OmsOrderItemService;
import com.tulingxueyuan.mall.modules.oms.service.OmsOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tulingxueyuan.mall.modules.pms.model.PmsProduct;
import com.tulingxueyuan.mall.modules.pms.model.PmsSkuStock;
import com.tulingxueyuan.mall.modules.pms.service.PmsProductService;
import com.tulingxueyuan.mall.modules.pms.service.PmsSkuStockService;
import com.tulingxueyuan.mall.modules.ums.model.UmsMember;
import com.tulingxueyuan.mall.modules.ums.model.UmsMemberReceiveAddress;
import com.tulingxueyuan.mall.modules.ums.service.UmsMemberReceiveAddressService;
import com.tulingxueyuan.mall.modules.ums.service.UmsMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * Order Form Service Implementation Class
 * </p>
 *
 */
@Service
public class OmsOrderServiceImpl extends ServiceImpl<OmsOrderMapper, OmsOrder> implements OmsOrderService {

    @Autowired
    private OmsCartItemService cartItemService;
    @Autowired
    private PmsProductService productService;
    @Autowired
    private UmsMemberReceiveAddressService addressService;
    @Autowired
    private UmsMemberService memberService;
    @Autowired
    private OmsCartItemMapper cartItemMapper;
    @Autowired
    RedisService redisService;
    @Value("${redis.key.prefix.orderId}")
    private String REDIS_KEY_PREFIX_ORDER_ID;
    @Autowired
    OmsOrderItemService orderItemService;
    @Autowired
    PmsSkuStockService skuStockService;

    /**
     * Initialize the goods and harvest address information for confirming the order
     */
    @Override
    public ConfirmOrderDTO generateConfirmOrder(List<Long> ids) {
        if (CollectionUtil.isEmpty(ids)) {
            throw new ApiException(ResultCode.VALIDATE_FAILED);
        }
        ConfirmOrderDTO confirmOrderDTO = new ConfirmOrderDTO();

        List<OmsCartItem> cartItemList = cartItemService.listByIds(ids);
        confirmOrderDTO.setCartList(cartItemList);

        calcCartAmount(confirmOrderDTO);

        UmsMember currentMember = memberService.getCurrentMember();
        QueryWrapper<UmsMemberReceiveAddress> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(UmsMemberReceiveAddress::getMemberId, currentMember.getId());
        List<UmsMemberReceiveAddress> list = addressService.list(queryWrapper);
        confirmOrderDTO.setAddressList(list);

        return confirmOrderDTO;
    }


    @Override
    @Transactional
    public OmsOrder generateOrder(OrderParamDTO paramDTO) {
        UmsMember currentMember = memberService.getCurrentMember();
        QueryWrapper<OmsCartItem> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(OmsCartItem::getMemberId, currentMember.getId())
                .in(OmsCartItem::getId, paramDTO.getItemIds());
        List<CartItemStockDTO> cartItemStockByIds = cartItemMapper.getCartItemStockByIds(queryWrapper);
        String productName = hasStock(cartItemStockByIds);
        if (StrUtil.isNotEmpty(productName)) {
            throw new ApiException("您的手速过慢，" + productName + "已被别人买走。");
        }

        OmsOrder omsOrder = newOrder(paramDTO, currentMember, cartItemStockByIds);
        this.save(omsOrder);

        List<OmsOrderItem> list = newOrderItems(omsOrder, cartItemStockByIds);
        orderItemService.saveBatch(list);

        lockStock(cartItemStockByIds);

        removeCartItem(cartItemStockByIds);

        return omsOrder;
    }

    /**
     * Read the order details after the order is successfully placed
     * this.axios.get(`/order/orderDetail?orderId=${this.orderId}`)
     */
    @Override
    public OrderDetailDTO getOrderDetail(Long id) {
        return this.baseMapper.getOrderDetail(id);
    }

    /**
     *
     * Shopping cart after order is deleted
     */
    private void removeCartItem(List<CartItemStockDTO> cartItemStockByIds) {
        List<Long> ids = new ArrayList<>();
        for (CartItemStockDTO cartItem : cartItemStockByIds) {
            ids.add(cartItem.getId());
        }
        cartItemService.removeByIds(ids);
    }

    /**
     * Lock inventory Add the current purchase amount to sku lock_stock
     */
    private void lockStock(List<CartItemStockDTO> cartItemStockByIds) {
        for (CartItemStockDTO cart : cartItemStockByIds) {
            UpdateWrapper<PmsSkuStock> updateWrapper = new UpdateWrapper<>();
            updateWrapper.setSql("lock_stock=lock_stock+"+cart.getQuantity())
                    .lambda()
                    .eq(PmsSkuStock::getId,cart.getProductSkuId());
            skuStockService.update(updateWrapper);
        }
    }

    /**
     *   `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
     *   `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
     *   `product_id` bigint(20) DEFAULT NULL,
     *   `product_pic` varchar(500) DEFAULT NULL,
     *   `product_name` varchar(200) DEFAULT NULL,
     *   `product_brand` varchar(200) DEFAULT NULL,
     *   `product_sn` varchar(64) DEFAULT NULL,
     *   `product_price` decimal(10,2) DEFAULT NULL COMMENT '销售价格',
     *   `product_quantity` int(11) DEFAULT NULL COMMENT '购买数量',
     *   `product_sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku编号',
     *   `product_sku_code` varchar(50) DEFAULT NULL COMMENT '商品sku条码',
     *   `product_category_id` bigint(20) DEFAULT NULL COMMENT '商品分类id',
     *   `sp1` varchar(100) DEFAULT NULL COMMENT '商品的销售属性',
     *   `sp2` varchar(100) DEFAULT NULL,
     *   `sp3` varchar(100) DEFAULT NULL,
     *   `promotion_name` varchar(200) DEFAULT NULL COMMENT '商品促销名称',
     *   `promotion_amount` decimal(10,2) DEFAULT NULL COMMENT '商品促销分解金额',
     *   `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券优惠分解金额',
     *   `integration_amount` decimal(10,2) DEFAULT NULL COMMENT '积分优惠分解金额',
     *   `real_amount` decimal(10,2) DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
     *   `gift_integration` int(11) DEFAULT '0',
     *   `gift_growth` int(11) DEFAULT '0',
     *   `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
     */
    private List<OmsOrderItem> newOrderItems(OmsOrder omsOrder, List<CartItemStockDTO> cartItemStockByIds) {
        List<OmsOrderItem> list=new ArrayList<>();
        for (CartItemStockDTO cartItemStockById : cartItemStockByIds) {
            OmsOrderItem orderItem=new OmsOrderItem();
            orderItem.setOrderId(omsOrder.getId());
            orderItem.setOrderSn(omsOrder.getOrderSn());
            orderItem.setProductId(cartItemStockById.getProductId());
            orderItem.setProductPic(cartItemStockById.getProductPic());
            orderItem.setProductName(cartItemStockById.getProductName());
            orderItem.setProductBrand(cartItemStockById.getProductBrand());
            orderItem.setProductSn(cartItemStockById.getProductSn());
            orderItem.setProductPrice(cartItemStockById.getPrice());
            orderItem.setProductQuantity(cartItemStockById.getQuantity());
            orderItem.setProductSkuId(cartItemStockById.getProductSkuId());
            orderItem.setProductSkuCode(cartItemStockById.getProductSkuCode());
            orderItem.setProductCategoryId(cartItemStockById.getProductCategoryId());
            orderItem.setSp1(cartItemStockById.getSp1());
            orderItem.setSp2(cartItemStockById.getSp2());
            orderItem.setSp3(cartItemStockById.getSp3());
            list.add(orderItem);
        }
        return list;
    }

    /**
     *
     * Judging whether there is stock
     * @param cartItemStockByIds
     * @return
     */
    private String hasStock(List<CartItemStockDTO> cartItemStockByIds) {
        for (CartItemStockDTO cart : cartItemStockByIds) {

            if (cart.getStock() < cart.getQuantity()) {
                return cart.getProductName();
            }
        }
        return null;
    }


    private OmsOrder newOrder(OrderParamDTO paramDTO, UmsMember currentMember, List<CartItemStockDTO> cartItemStockByIds) {
        OmsOrder omsOrder = new OmsOrder();
        omsOrder.setCreateTime(new Date());
        omsOrder.setModifyTime(new Date());
        omsOrder.setMemberId(currentMember.getId());
        omsOrder.setMemberUsername(currentMember.getUsername());


        ConfirmOrderDTO confirmOrderDTO = new ConfirmOrderDTO();

        List<OmsCartItem> omsCartItemsList = new ArrayList<>();

        for (CartItemStockDTO cartItem : cartItemStockByIds) {
            omsCartItemsList.add(cartItem);
        }

        confirmOrderDTO.setCartList(omsCartItemsList);


        calcCartAmount(confirmOrderDTO);

        omsOrder.setTotalAmount(confirmOrderDTO.getPriceTotal());

        omsOrder.setPayAmount(confirmOrderDTO.getPayAmount());

        omsOrder.setFreightAmount(confirmOrderDTO.getFreightAmount());


        omsOrder.setSourceType(1);

        omsOrder.setStatus(0);
        omsOrder.setOrderType(0);
        omsOrder.setAutoConfirmDay(15);


        QueryWrapper<UmsMemberReceiveAddress> addressQueryWrapper = new QueryWrapper<>();
        addressQueryWrapper.lambda()
                .eq(UmsMemberReceiveAddress::getMemberId, currentMember.getId())
                .eq(UmsMemberReceiveAddress::getId, paramDTO.getMemberReceiveAddressId());
        UmsMemberReceiveAddress address = addressService.getOne(addressQueryWrapper);

        omsOrder.setReceiverName(address.getName());

        omsOrder.setReceiverPhone(address.getPhoneNumber());

        omsOrder.setReceiverPostCode(address.getPostCode());

        omsOrder.setReceiverProvince(address.getProvince());

        omsOrder.setReceiverCity(address.getCity());

        omsOrder.setReceiverRegion(address.getRegion());

        omsOrder.setReceiverDetailAddress(address.getDetailAddress());

        omsOrder.setConfirmStatus(0);

        omsOrder.setOrderSn(getOrderSn(omsOrder));
        return omsOrder;
    }

    /**
     *
     * Generate order number: Generation rules: 8-digit date + 2-digit platform number + 6-digit auto-increment id;
     */
    private String getOrderSn(OmsOrder omsOrder) {

        StringBuilder sb=new StringBuilder();


        String yyyyMMdd = new SimpleDateFormat("yyyyMMdd").format(new Date());
        sb.append(yyyyMMdd);


        String sourceTyp = String.format("%02d", omsOrder.getSourceType());
        sb.append(sourceTyp);


        String key= REDIS_KEY_PREFIX_ORDER_ID+ yyyyMMdd;
        Long incr = redisService.incr(key, 1);

        if(incr.toString().length()<=6) {
            sb.append(String.format("%06d", redisService.incr(key, 1)));
        }

        else {
            sb.append(incr);
        }
        return sb.toString();
    }

    /**
     * Calculate shopping cart (item quantity, total price, shipping cost)
     */
    public void calcCartAmount(ConfirmOrderDTO confirmOrderDTO) {

        Integer productTotal = 0;

        BigDecimal priceTotal = new BigDecimal(0);

        BigDecimal freightAmount = new BigDecimal(0);

        for (OmsCartItem omsCartItem : confirmOrderDTO.getCartList()) {

            productTotal+=omsCartItem.getQuantity();

            priceTotal = priceTotal.add(omsCartItem.getPrice().multiply(new BigDecimal(omsCartItem.getQuantity())));

            PmsProduct product = productService.getById(omsCartItem.getProductId());
            String serviceIds = product.getServiceIds();
            String[] split = serviceIds.split(",");
            if (split.length>0) {
                if (!ArrayUtil.containsAny(split, 3)) {
                    freightAmount = freightAmount.add(new BigDecimal(10));
                }
            }
        }
        confirmOrderDTO.setProductTotal(productTotal);
        confirmOrderDTO.setPriceTotal(priceTotal);
        confirmOrderDTO.setFreightAmount(freightAmount);
        confirmOrderDTO.setPayAmount(priceTotal.subtract(freightAmount));
    }
}

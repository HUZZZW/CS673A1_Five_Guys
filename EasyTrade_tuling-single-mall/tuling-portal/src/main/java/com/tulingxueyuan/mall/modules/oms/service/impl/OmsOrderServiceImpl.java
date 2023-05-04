package com.tulingxueyuan.mall.modules.oms.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.tulingxueyuan.mall.common.api.ResultCode;
import com.tulingxueyuan.mall.common.exception.ApiException;
import com.tulingxueyuan.mall.common.service.RedisService;
import com.tulingxueyuan.mall.dto.*;
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
 * 订单表 服务实现类
 * </p>
 *
 * @author XuShu
 * @since 2023-03-10
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
     * 初始化确认订单的商品和收获地址信息
     */
    @Override
    public ConfirmOrderDTO generateConfirmOrder(List<Long> ids) {
        if (CollectionUtil.isEmpty(ids)) {
            throw new ApiException(ResultCode.VALIDATE_FAILED);
        }
        ConfirmOrderDTO confirmOrderDTO = new ConfirmOrderDTO();

        // 1) 商品
        List<OmsCartItem> cartItemList = cartItemService.listByIds(ids);
        confirmOrderDTO.setCartList(cartItemList);

        // 2) 计算价格
        calcCartAmount(confirmOrderDTO);

        // 3) 收货地址
        UmsMember currentMember = memberService.getCurrentMember();
        QueryWrapper<UmsMemberReceiveAddress> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(UmsMemberReceiveAddress::getMemberId, currentMember.getId());
        List<UmsMemberReceiveAddress> list = addressService.list(queryWrapper);
        confirmOrderDTO.setAddressList(list);

        return confirmOrderDTO;
    }

    /**
     * 下单：
     * 1. 判断库存（如果没有库存直接提示）
     *      没有库存id 只有购物车id，根据购物车id查询所有购物车信息
     * 2. 保存订单主表 oms_order 信息   订单号
     * 3. 保存订单详情表 oms_order_item （购物车转移）
     * 4. 锁定库存（如果用户超过10分钟没有支付——恢复库存）
     * 5. 删除对应购物车
     * （先不考虑并发）
     */
    @Override
    @Transactional
    public OmsOrder generateOrder(OrderParamDTO paramDTO) {
        // 1. 判断库存（如果没有库存直接提示）
        UmsMember currentMember = memberService.getCurrentMember();
        QueryWrapper<OmsCartItem> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                // 防止用户篡改
                .eq(OmsCartItem::getMemberId, currentMember.getId())
                // 根据购物车id 查询真实库存
                .in(OmsCartItem::getId, paramDTO.getItemIds());
        // 购物车列表
        List<CartItemStockDTO> cartItemStockByIds = cartItemMapper.getCartItemStockByIds(queryWrapper);
        // 获取库存不足的名称，如果productName不为空，则超出库存
        String productName = hasStock(cartItemStockByIds);
        if (StrUtil.isNotEmpty(productName)) {
            throw new ApiException("您的手速过慢，" + productName + "已被别人买走。");
        }

        // 2. 保存订单主表 oms_order 信息   订单号
        OmsOrder omsOrder = newOrder(paramDTO, currentMember, cartItemStockByIds);
        this.save(omsOrder);

        // 3. 保存订单详情表 oms_order_item （购物车转移）
        List<OmsOrderItem> list = newOrderItems(omsOrder, cartItemStockByIds);
        orderItemService.saveBatch(list);

        // 4. 锁定库存
        lockStock(cartItemStockByIds);

        // 5. 删除对应购物车
        removeCartItem(cartItemStockByIds);

        return omsOrder;
    }

    /**
     * 读取下单成功后的订单详情
     * this.axios.get(`/order/orderDetail?orderId=${this.orderId}`)
     */
    @Override
    public OrderDetailDTO getOrderDetail(Long id) {
        return this.baseMapper.getOrderDetail(id);
    }

    @Override
    public IPage<OrderListDTO> getMyOrders(Integer pageSize, Integer pageNum) {
        Page page = new Page(pageNum, pageSize);
        return this.baseMapper.getMyOrders(page,memberService.getCurrentMember().getId());
    }

    /**
     * 删除订单后的购物车
     */
    private void removeCartItem(List<CartItemStockDTO> cartItemStockByIds) {
        // 1.购物车集合
        List<Long> ids = new ArrayList<>();
        for (CartItemStockDTO cartItem : cartItemStockByIds) {
            ids.add(cartItem.getId());
        }
        // 移除购物车信息
        cartItemService.removeByIds(ids);
    }

    /**
     * 锁定库存  把当前的购买数累加到sku lock_stock中
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
     *    生成订单详情
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
     * 判断是否有库存
     * @param cartItemStockByIds
     * @return
     */
    private String hasStock(List<CartItemStockDTO> cartItemStockByIds) {
        for (CartItemStockDTO cart : cartItemStockByIds) {
            // 如果当前购物车商品的贵客库存 < 实际购物数量 ==> 库存不足
            if (cart.getStock() < cart.getQuantity()) {
                return cart.getProductName();
            }
        }
        return null;
    }

    // 创建 OmsOrder
    private OmsOrder newOrder(OrderParamDTO paramDTO, UmsMember currentMember, List<CartItemStockDTO> cartItemStockByIds) {
        OmsOrder omsOrder = new OmsOrder();
        omsOrder.setCreateTime(new Date());
        omsOrder.setModifyTime(new Date());
        omsOrder.setMemberId(currentMember.getId());
        omsOrder.setMemberUsername(currentMember.getUsername());

        // 1 计算价格
        // 1.1 因为计算价格是根据购物车列表信息来计算的，需要传入ConfirmOrderDTO
        ConfirmOrderDTO confirmOrderDTO = new ConfirmOrderDTO();
        // 1.1.1 购物车集合
        List<OmsCartItem> omsCartItemsList = new ArrayList<>();
        // 1.1.2 循环将CartItemStockDTO 转换为OmsCartItem
        for (CartItemStockDTO cartItem : cartItemStockByIds) {
            omsCartItemsList.add(cartItem);
        }
        // 1.1.3
        confirmOrderDTO.setCartList(omsCartItemsList);

        // 1.2.1 传入购物车集合来计算价格
        calcCartAmount(confirmOrderDTO);
        // 1.2.1 商品总价
        omsOrder.setTotalAmount(confirmOrderDTO.getPriceTotal());
        // 1.2.2 应付总金额
        omsOrder.setPayAmount(confirmOrderDTO.getPayAmount());
        // 1.2.3 运费金额
        omsOrder.setFreightAmount(confirmOrderDTO.getFreightAmount());

        /*
        促销金额待升级，目前作默认处理
         */
        // 订单来源：0->PC订单；1->app订单
        omsOrder.setSourceType(1);
        // 订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单
        omsOrder.setStatus(0);
        omsOrder.setOrderType(0);   //订单类型：0->正常订单；1->秒杀订单
        omsOrder.setAutoConfirmDay(15);  // 自动确认收货时间

        // 地址
        QueryWrapper<UmsMemberReceiveAddress> addressQueryWrapper = new QueryWrapper<>();
        addressQueryWrapper.lambda()
                .eq(UmsMemberReceiveAddress::getMemberId, currentMember.getId())
                .eq(UmsMemberReceiveAddress::getId, paramDTO.getMemberReceiveAddressId());
        UmsMemberReceiveAddress address = addressService.getOne(addressQueryWrapper);
        //收货人姓名
        omsOrder.setReceiverName(address.getName());
        // receiver_phone` varchar(32) NOT NULL COMMENT '收货人电话',
        omsOrder.setReceiverPhone(address.getPhoneNumber());
        //`receiver_post_code` varchar(32) DEFAULT NULL COMMENT '收货人邮编',
        omsOrder.setReceiverPostCode(address.getPostCode());
        //receiver_province` varchar(32) DEFAULT NULL COMMENT '省份/直辖市',
        omsOrder.setReceiverProvince(address.getProvince());
        //城市,
        omsOrder.setReceiverCity(address.getCity());
        // '区'
        omsOrder.setReceiverRegion(address.getRegion());
        //'详细地址'
        omsOrder.setReceiverDetailAddress(address.getDetailAddress());
        // '确认收货状态：0->未确认；1->已确认'
        omsOrder.setConfirmStatus(0);
        // 生产订单编码
        omsOrder.setOrderSn(getOrderSn(omsOrder));
        return omsOrder;
    }

    /**
     * 生成订单编号：生成规则:8位日期+2位平台号码+6位以上自增id；
     */
    private String getOrderSn(OmsOrder omsOrder) {
        // 订单编号
        StringBuilder sb=new StringBuilder();

        //8位日期
        String yyyyMMdd = new SimpleDateFormat("yyyyMMdd").format(new Date());
        sb.append(yyyyMMdd);

        //2位平台号码  1.pc  2.app
        //String.format：参数说明
        // 0 代表前面补充零
        // 2 代表补充长度
        // d 代表正数
        String sourceTyp = String.format("%02d", omsOrder.getSourceType());
        sb.append(sourceTyp);

        // 6位以上自增id
        // redis incr  原子性
        // 适合并发的自增方式：
        String key= REDIS_KEY_PREFIX_ORDER_ID+ yyyyMMdd;
        Long incr = redisService.incr(key, 1);
        // 拿到当前的6位以上自增 如果小于6位，自动补全0
        if(incr.toString().length()<=6) {
            sb.append(String.format("%06d", redisService.incr(key, 1)));
        }
        // 如果是6位 不用补0
        else {
            sb.append(incr);
        }
        return sb.toString();
    }

    /**
     * 计算购物车（商品数量，总价，运费）
     */
    public void calcCartAmount(ConfirmOrderDTO confirmOrderDTO) {
        // 计算商品数量
        Integer productTotal = 0;
        // 总价
        BigDecimal priceTotal = new BigDecimal(0);
        // 运费
        BigDecimal freightAmount = new BigDecimal(0);

        for (OmsCartItem omsCartItem : confirmOrderDTO.getCartList()) {
            // 计算商品数量
            productTotal+=omsCartItem.getQuantity();
            // 总价
            priceTotal = priceTotal.add(omsCartItem.getPrice().multiply(new BigDecimal(omsCartItem.getQuantity())));
            // 运费
            PmsProduct product = productService.getById(omsCartItem.getProductId());
            String serviceIds = product.getServiceIds();
            String[] split = serviceIds.split(",");
            if (split.length>0) {
                // 判断是否包邮
                if (!ArrayUtil.containsAny(split, 3)) {
                    // 不包邮的默认加 10 元邮费
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

package com.tulingxueyuan.mall.modules.oms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.tulingxueyuan.mall.common.api.ResultCode;
import com.tulingxueyuan.mall.common.exception.Asserts;
import com.tulingxueyuan.mall.dto.AddCartDTO;
import com.tulingxueyuan.mall.dto.CartItemStockDTO;
import com.tulingxueyuan.mall.modules.oms.model.OmsCartItem;
import com.tulingxueyuan.mall.modules.oms.mapper.OmsCartItemMapper;
import com.tulingxueyuan.mall.modules.oms.service.OmsCartItemService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tulingxueyuan.mall.modules.pms.model.PmsProduct;
import com.tulingxueyuan.mall.modules.pms.model.PmsSkuStock;
import com.tulingxueyuan.mall.modules.pms.service.PmsProductService;
import com.tulingxueyuan.mall.modules.pms.service.PmsSkuStockService;
import com.tulingxueyuan.mall.modules.ums.model.UmsMember;
import com.tulingxueyuan.mall.modules.ums.service.UmsMemberService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 购物车表 服务实现类
 * </p>
 *
 * @author XuShu
 * @since 2023-03-06
 */
@Service
public class OmsCartItemServiceImpl extends ServiceImpl<OmsCartItemMapper, OmsCartItem> implements OmsCartItemService {

    @Autowired
    UmsMemberService memberService;
    @Autowired
    PmsSkuStockService skuStockService;
    @Autowired
    PmsProductService productService;
    @Autowired
    OmsCartItemMapper cartItemMapper;

    @Override
    public Boolean add(AddCartDTO addCartDTO) {
        OmsCartItem omsCartItem = new OmsCartItem();
        BeanUtils.copyProperties(addCartDTO, omsCartItem);
        // 添加会员关系
        UmsMember currentMember = memberService.getCurrentMember();
        omsCartItem.setMemberId(currentMember.getId());

        // 判断同一个 商品、sku、用户 下是否添加的重复的购物车
        OmsCartItem cartItem = getCartItem(omsCartItem.getProductId(), omsCartItem.getProductSkuId(), omsCartItem.getMemberId());

        if (cartItem == null) {
            // 新增一个商品到购物车

            // 查询SKU
            PmsSkuStock sku = skuStockService.getById(omsCartItem.getProductSkuId());
            if (sku == null) Asserts.fail(ResultCode.VALIDATE_FAILED);

            // 查询商品
            PmsProduct product = productService.getById(omsCartItem.getProductId());
            if (product == null) Asserts.fail(ResultCode.VALIDATE_FAILED);

            omsCartItem.setPrice(sku.getPrice());
            omsCartItem.setSp1(sku.getSp1());
            omsCartItem.setSp2(sku.getSp2());
            omsCartItem.setSp3(sku.getSp3());
            omsCartItem.setProductPic(sku.getPic());
            omsCartItem.setProductSkuCode(sku.getSkuCode());

            omsCartItem.setProductName(product.getName());
            omsCartItem.setProductBrand(product.getBrandName());
            omsCartItem.setProductSn(product.getProductSn());
            omsCartItem.setProductSubTitle(product.getSubTitle());
            omsCartItem.setProductCategoryId(product.getProductCategoryId());

            omsCartItem.setMemberNickname(currentMember.getNickname());

            omsCartItem.setCreateDate(new Date());
            omsCartItem.setModifyDate(new Date());

            baseMapper.insert(omsCartItem);
            System.out.println("OmsCartItemServiceImpl.add: insert");
            return true;
        } 
        else {
            // 修改商品数量
            cartItem.setQuantity(cartItem.getQuantity()+1);
            cartItem.setModifyDate(new Date());
            UpdateWrapper<OmsCartItem> updateWrapper = new UpdateWrapper<>();
            updateWrapper.lambda()
                    .set(OmsCartItem::getQuantity, cartItem.getQuantity())
                    .set(OmsCartItem::getModifyDate, cartItem.getModifyDate())
                    .eq(OmsCartItem::getId, cartItem.getId());
            return baseMapper.update(cartItem, updateWrapper)>0;
        }
    }

    /**
     * 初始化状态栏的购物车商品数量
     * @return
     */
    @Override
    public Integer getCartProductSum() {
        QueryWrapper<OmsCartItem> queryWrapper = new QueryWrapper<>();
        Long memberId = memberService.getCurrentMember().getId();
        queryWrapper
                .select("sum(quantity) as total")
                .lambda()
                .eq(OmsCartItem::getMemberId, memberId);
        List<Map<String, Object>> list = baseMapper.selectMaps(queryWrapper);
        if (list != null && list.size() == 1) {
            Map<String, Object> map = list.get(0);
            if (map.get("total") != null) {
                return Integer.parseInt(map.get("total").toString());
            }
        }
        return 0;
    }

    /**
     * 初始化购物车数据
     * @return
     */
    @Override
    public List<CartItemStockDTO> getCartList() {
        // 1 当前用户
        UmsMember currentMember = memberService.getCurrentMember();
//        QueryWrapper<OmsCartItem> queryWrapper = new QueryWrapper<>();
//        queryWrapper.lambda().eq(OmsCartItem::getMemberId, currentMember.getId());
//        return this.list(queryWrapper);

        List<CartItemStockDTO> list = cartItemMapper.getCartItemStock(currentMember.getId());
        return list;
    }

    /**
     * 更新商品的数量
     * this.axios.post('/cart/update/quantity',Qs.stringify({
     * id:item.id,
     * quantity:item.quantity
     * })
     */
    @Override
    public boolean updateQuantity(Long id, Integer quantity) {
        UpdateWrapper<OmsCartItem> updateWrapper = new UpdateWrapper<>();
        updateWrapper.lambda()
                .set(OmsCartItem::getQuantity, quantity)
                .eq(OmsCartItem::getId, id);
        return this.update(updateWrapper);
    }

    /**
     *  删除
     *  this.axios.post('/cart/delete',Qs.stringify({
     *      ids:item.id
     *  }),{headers: {'Content-Type': 'application/x-www-form-urlencoded'}})
     */
    @Override
    public boolean delete(Long ids) {
        return this.removeById(ids);
    }

    /**
     * 判断同一个商品、sku、用户下是否添加重复的购物车
     * @param productId
     * @param skuId
     * @param memberId
     * @return
     */
    public OmsCartItem getCartItem(Long productId, Long skuId, Long memberId) {
        QueryWrapper<OmsCartItem> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(OmsCartItem::getProductId, productId)
                .eq(OmsCartItem::getProductSkuId, skuId)
                .eq(OmsCartItem::getMemberId, memberId);

        return baseMapper.selectOne(queryWrapper);
    }
}

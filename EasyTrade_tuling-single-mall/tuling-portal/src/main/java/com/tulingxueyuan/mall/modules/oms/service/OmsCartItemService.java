package com.tulingxueyuan.mall.modules.oms.service;

import com.tulingxueyuan.mall.dto.AddCartDTO;
import com.tulingxueyuan.mall.dto.CartItemStockDTO;
import com.tulingxueyuan.mall.modules.oms.model.OmsCartItem;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 购物车表 服务类
 * </p>
 *
 * @author XuShu
 * @since 2023-03-06
 */
public interface OmsCartItemService extends IService<OmsCartItem> {

    Boolean add(AddCartDTO addCartDTO);

    /**
     * 初始化状态栏的购物车商品数量
     * @return
     */
    Integer getCartProductSum();

    /**
     * 初始化购物车数据
     * @return
     */
    List<CartItemStockDTO> getCartList();

    /**
     * 更新商品的数量
     * this.axios.post('/cart/update/quantity',Qs.stringify({
     * id:item.id,
     * quantity:item.quantity
     * })
     */
    boolean updateQuantity(Long id, Integer quantity);

    /**
     *  删除
     *  this.axios.post('/cart/delete',Qs.stringify({
     *      ids:item.id
     *  }),{headers: {'Content-Type': 'application/x-www-form-urlencoded'}})
     */
    boolean delete(Long ids);
}

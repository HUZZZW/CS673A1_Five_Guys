package com.tulingxueyuan.mall.modules.oms.service;

import com.tulingxueyuan.mall.dto.AddCartDTO;
import com.tulingxueyuan.mall.dto.CartItemStockDTO;
import com.tulingxueyuan.mall.modules.oms.model.OmsCartItem;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * Shopping cart table service class
 * </p>
 *
 */
public interface OmsCartItemService extends IService<OmsCartItem> {

    Boolean add(AddCartDTO addCartDTO);

    /**
     * Initialize the number of shopping cart items in the status bar
     * @return
     */
    Integer getCartProductSum();

    /**
     *
     * Initialize shopping cart data
     * @return
     */
    List<CartItemStockDTO> getCartList();

    /**
     *
     * Update the quantity of the item
     * this.axios.post('/cart/update/quantity',Qs.stringify({
     * id:item.id,
     * quantity:item.quantity
     * })
     */
    boolean updateQuantity(Long id, Integer quantity);

    /**
     *  delete
     *  this.axios.post('/cart/delete',Qs.stringify({
     *      ids:item.id
     *  }),{headers: {'Content-Type': 'application/x-www-form-urlencoded'}})
     */
    boolean delete(Long ids);
}

package com.tulingxueyuan.mall.controller;


import com.sun.org.apache.xpath.internal.operations.Bool;
import com.tulingxueyuan.mall.common.api.CommonResult;
import com.tulingxueyuan.mall.dto.AddCartDTO;
import com.tulingxueyuan.mall.dto.CartItemStockDTO;
import com.tulingxueyuan.mall.modules.oms.model.OmsCartItem;
import com.tulingxueyuan.mall.modules.oms.service.OmsCartItemService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Api(tags = "CartController", description = "购物车服务接口")
@RequestMapping("/cart")
public class CartController {

    @Autowired
    OmsCartItemService omsCartItemService;

    /**
     * .post("/cart/add", {
     *           productId: this.id,
     *           productSkuId: this.skuId,
     *           quantity: 1,
     *         })
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public CommonResult add(@RequestBody AddCartDTO addCartDTO) {
        Boolean result = omsCartItemService.add(addCartDTO);
        if (result) {
            System.out.println("CartController.add: success");
            System.out.println(result);
            return CommonResult.success(result);
        }
        else {
            return CommonResult.failed();
        }
    }

    /**
     * this.axios.get('/cart/products/sum')
     */
    @RequestMapping(value = "/products/sum", method = RequestMethod.GET)
    public CommonResult getCartProductSum() {
        Integer count = omsCartItemService.getCartProductSum();
        return CommonResult.success(count);
    }

    /**
     * this.axios.get('/cart/list')
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult getCartList() {
        List<CartItemStockDTO> cartItemList = omsCartItemService.getCartList();
        return CommonResult.success(cartItemList);
    }

    /**
     * this.axios.post('/cart/update/quantity',Qs.stringify({
     *             id:item.id,
     *             quantity:item.quantity
     *           })
     */
    @RequestMapping(value = "/update/quantity", method = RequestMethod.POST)
    public CommonResult updateQuantity(
            @RequestParam Long id,
            @RequestParam Integer quantity) {
        boolean result = omsCartItemService.updateQuantity(id, quantity);
        if (result) {
            //System.out.println("CartController.add: success");
            //System.out.println(result);
            return CommonResult.success(result);
        }
        else {
            return CommonResult.failed();
        }
    }

    /**
     *  this.axios.post('/cart/delete',Qs.stringify({
     *      ids:item.id
     *  }),{headers: {'Content-Type': 'application/x-www-form-urlencoded'}})
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public CommonResult deleteCartItem(@RequestParam Long ids) {
        boolean result = omsCartItemService.delete(ids);
        return null;
    }
}

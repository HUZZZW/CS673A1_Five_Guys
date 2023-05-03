package com.tulingxueyuan.mall.controller;

import com.tulingxueyuan.mall.common.api.CommonResult;
import com.tulingxueyuan.mall.dto.ConfirmOrderDTO;
import com.tulingxueyuan.mall.dto.OrderDetailDTO;
import com.tulingxueyuan.mall.dto.OrderParamDTO;
import com.tulingxueyuan.mall.modules.oms.model.OmsOrder;
import com.tulingxueyuan.mall.modules.oms.service.OmsOrderService;
import io.netty.handler.ssl.util.InsecureTrustManagerFactory;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Api(tags = "OrderController", description = "订单服务接口")
@RequestMapping("/order")
public class OrderController {

    @Autowired
    OmsOrderService orderService;


    /**
     * Add to cart: generate an order based on the cart id
     * Direct Purchase: According to product_id and sku_id (changed to DTO reception), reuse code to generate order
     * Initialize the goods and harvest address information for confirming the order
     * this.axios.post(
     *      "/order/generateConfirmOrder",
     *      Qs.stringify({ itemIds: constStore.itemids }, { indices: false }),
     *      { headers: { "Content-Type": "application/x-www-form-urlencoded" } }
     * )
     */
    @RequestMapping(value = "/generateConfirmOrder", method = RequestMethod.POST)
    public CommonResult generateConfirmOrder(@RequestParam("itemIds") List<Long> ids) {
        ConfirmOrderDTO confirmOrder = orderService.generateConfirmOrder(ids);
        return CommonResult.success(confirmOrder);
    }

    /**
     * Generate an order (placing an order)
     * .post("/order/generateOrder", {
     *             itemIds: this.itemIds,     // item id
     *             memberReceiveAddressId: item.id,  // address id
     *             //payType: 1,
     *           })
     */
    @RequestMapping(value = "/generateOrder", method = RequestMethod.POST)
    public CommonResult generateOrder(@RequestBody OrderParamDTO paramDTO) {
        OmsOrder omsOrder = orderService.generateOrder(paramDTO);
        return CommonResult.success(omsOrder.getId());
    }

    /**
     * Read the order details after the order is successfully placed
     * this.axios.get(`/order/orderDetail?orderId=${this.orderId}`)
     */
    @RequestMapping(value = "/orderDetail")
    public CommonResult getOrderDetail(@RequestParam("orderId") Long id) {
        OrderDetailDTO orderDetail = orderService.getOrderDetail(id);
        return CommonResult.success(orderDetail);
    }
}

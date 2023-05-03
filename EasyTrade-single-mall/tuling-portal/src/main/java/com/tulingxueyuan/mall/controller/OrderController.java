package com.tulingxueyuan.mall.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.tulingxueyuan.mall.common.api.CommonResult;
import com.tulingxueyuan.mall.dto.ConfirmOrderDTO;
import com.tulingxueyuan.mall.dto.OrderDetailDTO;
import com.tulingxueyuan.mall.dto.OrderListDTO;
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
     * 加入购物车：根据购物车id生成订单
     * 直接购买：根据product_id和sku_id（改成DTO接收），复用代码生成订单
     * 初始化确认订单的商品和收获地址信息
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
     * 生成订单（下单）
     * .post("/order/generateOrder", {
     *             itemIds: this.itemIds,     // 购物id
     *             memberReceiveAddressId: item.id,  // 地址id
     *             //payType: 1,   // 支付宝
     *           })
     */
    @RequestMapping(value = "/generateOrder", method = RequestMethod.POST)
    public CommonResult generateOrder(@RequestBody OrderParamDTO paramDTO) {
        OmsOrder omsOrder = orderService.generateOrder(paramDTO);
        return CommonResult.success(omsOrder.getId());
    }

    /**
     * 读取下单成功后的订单详情
     * this.axios.get(`/order/orderDetail?orderId=${this.orderId}`)
     */
    @RequestMapping(value = "/orderDetail")
    public CommonResult getOrderDetail(@RequestParam("orderId") Long id) {
        OrderDetailDTO orderDetail = orderService.getOrderDetail(id);
        return CommonResult.success(orderDetail);
    }

    /**
     * 我的订单列表
     * this.axios.post('/order/list/userOrder',Qs.stringify({
     * pageSize:10,
     * pageNum:this.pageNum
     */
    @RequestMapping(value = "/list/userOrder", method = RequestMethod.POST)
    public CommonResult getMyOrders(
            @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        IPage<OrderListDTO> myOrders = orderService.getMyOrders(pageSize, pageNum);
        return CommonResult.success(myOrders);
    }
}

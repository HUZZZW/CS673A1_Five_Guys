package com.tulingxueyuan.mall.modules.oms.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.tulingxueyuan.mall.dto.ConfirmOrderDTO;
import com.tulingxueyuan.mall.dto.OrderDetailDTO;
import com.tulingxueyuan.mall.dto.OrderListDTO;
import com.tulingxueyuan.mall.dto.OrderParamDTO;
import com.tulingxueyuan.mall.modules.oms.model.OmsOrder;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 订单表 服务类
 * </p>
 *
 * @author XuShu
 * @since 2023-03-10
 */
public interface OmsOrderService extends IService<OmsOrder> {

    /**
     * 初始化确认订单的商品和收获地址信息
     * @param ids
     * @return
     */
    ConfirmOrderDTO generateConfirmOrder(List<Long> ids);

    /**
     * 生成订单（下单）
     * .post("/order/generateOrder", {
     *             itemIds: this.itemIds,     // 购物id
     *             memberReceiveAddressId: item.id,  // 地址id
     *             //payType: 1,   // 支付宝
     *           })
     */
    OmsOrder generateOrder(OrderParamDTO paramDTO);

    /**
     * 读取下单成功后的订单详情
     * this.axios.get(`/order/orderDetail?orderId=${this.orderId}`)
     */
    OrderDetailDTO getOrderDetail(Long id);

    IPage<OrderListDTO> getMyOrders(Integer pageSize, Integer pageNum);
}

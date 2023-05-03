package com.tulingxueyuan.mall.modules.oms.service;

import com.tulingxueyuan.mall.dto.ConfirmOrderDTO;
import com.tulingxueyuan.mall.dto.OrderDetailDTO;
import com.tulingxueyuan.mall.dto.OrderParamDTO;
import com.tulingxueyuan.mall.modules.oms.model.OmsOrder;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * order form service
 * </p>
 *
 */
public interface OmsOrderService extends IService<OmsOrder> {

    /**
     *
     * Initialize the goods and harvest address information for confirming the order
     * @param ids
     * @return
     */
    ConfirmOrderDTO generateConfirmOrder(List<Long> ids);

    /**
     *
     * Generate an order (placing an order)
     * .post("/order/generateOrder", {
     *             itemIds: this.itemIds,
     *             memberReceiveAddressId: item.id,
     *             //payType: 1,
     *           })
     */
    OmsOrder generateOrder(OrderParamDTO paramDTO);

    /**
     * Read the order details after the order is successfully placed
     * this.axios.get(`/order/orderDetail?orderId=${this.orderId}`)
     */
    OrderDetailDTO getOrderDetail(Long id);
}

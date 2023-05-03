package com.tulingxueyuan.mall.modules.oms.mapper;

import com.tulingxueyuan.mall.dto.OrderDetailDTO;
import com.tulingxueyuan.mall.modules.oms.model.OmsOrder;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * Order table Mapper interface
 * </p>
 *
 */
public interface OmsOrderMapper extends BaseMapper<OmsOrder> {

    OrderDetailDTO getOrderDetail(Long id);
}

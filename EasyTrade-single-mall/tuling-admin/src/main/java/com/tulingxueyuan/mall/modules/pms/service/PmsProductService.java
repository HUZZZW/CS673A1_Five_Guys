package com.tulingxueyuan.mall.modules.pms.service;

import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tulingxueyuan.mall.modules.pms.model.PmsProduct;
import com.baomidou.mybatisplus.extension.service.IService;
import com.tulingxueyuan.mall.modules.pms.model.dto.ProductConditionDTO;
import com.tulingxueyuan.mall.modules.pms.model.dto.ProductSaveParamsDTO;
import com.tulingxueyuan.mall.modules.pms.model.dto.ProductUpdateInitDTO;

import java.util.List;

/**
 * <p>
 *
 * Commodity Information Service
 * </p>
 *
 */
public interface PmsProductService extends IService<PmsProduct> {

    Page list(ProductConditionDTO conditionDTO);

    boolean updateStatus(Integer newStatus, List<Long> ids, SFunction<PmsProduct, ?> getNewStatus);

    boolean create(ProductSaveParamsDTO productSaveParamsDTO);

    ProductUpdateInitDTO getUpdateInfo(Long id);
}

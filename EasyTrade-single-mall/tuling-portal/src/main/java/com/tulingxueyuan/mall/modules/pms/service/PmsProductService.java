package com.tulingxueyuan.mall.modules.pms.service;

import com.tulingxueyuan.mall.modules.pms.model.PmsProduct;
import com.baomidou.mybatisplus.extension.service.IService;
import com.tulingxueyuan.mall.dto.ProductDetailDTO;


/**
 * <p>
 *
 * Commodity Information Service
 * </p>
 *
 */
public interface PmsProductService extends IService<PmsProduct> {

    /**
     *
     * Get product details
     * @param id productid
     * @return
     */

    ProductDetailDTO getProductDetail(Long id);
}

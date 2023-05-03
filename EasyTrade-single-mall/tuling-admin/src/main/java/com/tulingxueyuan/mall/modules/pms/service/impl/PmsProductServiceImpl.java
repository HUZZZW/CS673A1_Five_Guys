package com.tulingxueyuan.mall.modules.pms.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.tulingxueyuan.mall.modules.pms.model.PmsProduct;
import com.tulingxueyuan.mall.modules.pms.mapper.PmsProductMapper;
import com.tulingxueyuan.mall.modules.pms.model.dto.ProductConditionDTO;
import com.tulingxueyuan.mall.modules.pms.model.dto.ProductSaveParamsDTO;
import com.tulingxueyuan.mall.modules.pms.model.dto.ProductUpdateInitDTO;
import com.tulingxueyuan.mall.modules.pms.service.PmsProductAttributeValueService;
import com.tulingxueyuan.mall.modules.pms.service.PmsProductService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tulingxueyuan.mall.modules.pms.service.PmsSkuStockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Method;
import java.util.List;

/**
 * <p>
 *
 * Commodity Information Service Implementation Class
 * </p>
 *
 */
@Service
public class PmsProductServiceImpl extends ServiceImpl<PmsProductMapper, PmsProduct> implements PmsProductService {
    @Autowired
    PmsSkuStockService skuStockService;
    @Autowired
    PmsProductAttributeValueService productAttributeValueService;

    @Autowired
    PmsProductMapper productMapper;

    @Override
    public Page list(ProductConditionDTO conditionDTO) {
        Page page = new Page(conditionDTO.getPageNum(), conditionDTO.getPageSize());
        QueryWrapper<PmsProduct> pmsProductQueryWrapper = new QueryWrapper<>();
        LambdaQueryWrapper<PmsProduct> lambdaQueryWrapper = pmsProductQueryWrapper.lambda();
        if (!StrUtil.isBlank(conditionDTO.getKeyword())) {
            lambdaQueryWrapper.like(PmsProduct::getName, conditionDTO.getKeyword());
        }
        if(!StrUtil.isBlank(conditionDTO.getProductSn())) {
            lambdaQueryWrapper.eq(PmsProduct::getProductSn, conditionDTO.getProductSn());
        }
        if(conditionDTO.getProductCategoryId() != null && conditionDTO.getProductCategoryId()>0) {
            lambdaQueryWrapper.eq(PmsProduct::getProductCategoryId, conditionDTO.getProductCategoryId());
        }
        if(conditionDTO.getBrandId() != null && conditionDTO.getBrandId()>0) {
            lambdaQueryWrapper.eq(PmsProduct::getBrandId, conditionDTO.getBrandId());
        }
        if (conditionDTO.getPublishStatus() != null) {
            lambdaQueryWrapper.eq(PmsProduct::getPublishStatus, conditionDTO.getPublishStatus());
        }
        if (conditionDTO.getVerifyStatus() != null) {
            lambdaQueryWrapper.eq(PmsProduct::getVerifyStatus, conditionDTO.getVerifyStatus());
        }
        lambdaQueryWrapper.orderByAsc(PmsProduct::getSort);
        return this.page(page, lambdaQueryWrapper);
    }

    @Override
    public boolean updateStatus(Integer status, List<Long> ids, SFunction<PmsProduct, ?> getNewStatus) {
        UpdateWrapper<PmsProduct> updateWrapper = new UpdateWrapper<>();
        updateWrapper.lambda().set(getNewStatus, status)
                .in(PmsProduct::getId, ids);

        return this.update(updateWrapper);
    }

    @Override
    @Transactional
    public boolean create(ProductSaveParamsDTO productSaveParamsDTO) {
        PmsProduct product = productSaveParamsDTO;
        product.setId(null);
        boolean result = this.save(product);
        if (result) {
            saveLists(productSaveParamsDTO.getSkuStockList(), product.getId(), skuStockService);
            saveLists(productSaveParamsDTO.getProductAttributeValueList(), product.getId(), productAttributeValueService);
        }
        return result;
    }

    @Override
    public ProductUpdateInitDTO getUpdateInfo(Long id) {


        return productMapper.getUpdateInfo(id);
    }

    public void saveLists(List list, Long productId, IService service) {
        if (CollectionUtils.isEmpty(list)) {
            return;
        }
        try {
            for (Object obj : list) {
                Method setProductIdMethod = obj.getClass().getMethod("setProductId", Long.class);
                setProductIdMethod.invoke(obj, productId);
            }
            service.saveBatch(list);
        }
        catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
}

package com.tulingxueyuan.mall.modules.pms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tulingxueyuan.mall.modules.pms.model.PmsProductAttribute;
import com.tulingxueyuan.mall.modules.pms.mapper.PmsProductAttributeMapper;
import com.tulingxueyuan.mall.modules.pms.model.PmsProductAttributeCategory;
import com.tulingxueyuan.mall.modules.pms.model.PmsProductCategory;
import com.tulingxueyuan.mall.modules.pms.service.PmsProductAttributeCategoryService;
import com.tulingxueyuan.mall.modules.pms.service.PmsProductAttributeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * <p>
 * Commodity attribute parameter table Service implementation class
 * </p>
 *
 */
@Service
public class PmsProductAttributeServiceImpl extends ServiceImpl<PmsProductAttributeMapper, PmsProductAttribute> implements PmsProductAttributeService {
    @Autowired
    PmsProductAttributeMapper productAttributeMapper;

    @Autowired
    PmsProductAttributeCategoryService productAttributeCategoryService;

    @Override
    public Page list(Long cid, Integer type, Integer pageNum, Integer pageSize) {
        Page page = new Page(pageNum, pageSize);
        QueryWrapper<PmsProductAttribute> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(PmsProductAttribute::getProductAttributeCategoryId, cid)
                .eq(PmsProductAttribute::getType, type)
                .orderByAsc(PmsProductAttribute::getSort);
        return this.page(page, queryWrapper);
    }

    @Override
    public boolean create(PmsProductAttribute productAttribute) {
        boolean save = this.save(productAttribute);
        if(save) {
            UpdateWrapper<PmsProductAttributeCategory> updateWrapper = new UpdateWrapper<>();
            if(productAttribute.getType() == 0) {
                updateWrapper.setSql("attribute_count=attribute_count+1");
            } else if(productAttribute.getType() == 1) {
                updateWrapper.setSql("param_count=param_count+1");
            }
            updateWrapper.lambda().eq(PmsProductAttributeCategory::getId,
                    productAttribute.getProductAttributeCategoryId());
            productAttributeCategoryService.update(updateWrapper);
        }
        return save;
    }

    @Override
    @Transactional
    public boolean delete(List<Long> ids) {
        if (CollectionUtils.isEmpty(ids)) {
            return false;
        }
        PmsProductAttribute productAttribute = null;
        for (Long id : ids) {
            productAttribute=this.getById(id);
            if (productAttribute != null) {
                break;
            }
        }
        int length = productAttributeMapper.deleteBatchIds(ids);
        if(length > 0 && productAttribute != null) {
            UpdateWrapper<PmsProductAttributeCategory> updateWrapper = new UpdateWrapper<>();
            if(productAttribute.getType() == 0) {
                updateWrapper.setSql("attribute_count=attribute_count-" + length);
            } else if(productAttribute.getType() == 1) {
                updateWrapper.setSql("param_count=param_count-" + length);
            }
            updateWrapper.lambda().eq(PmsProductAttributeCategory::getId,
                    productAttribute.getProductAttributeCategoryId());
            productAttributeCategoryService.update(updateWrapper);
        }
        return length>0;
    }
}

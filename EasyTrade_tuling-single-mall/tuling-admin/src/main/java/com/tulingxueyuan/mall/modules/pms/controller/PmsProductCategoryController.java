package com.tulingxueyuan.mall.modules.pms.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tulingxueyuan.mall.common.api.CommonPage;
import com.tulingxueyuan.mall.common.api.CommonResult;
import com.tulingxueyuan.mall.modules.pms.model.PmsProductCategory;
import com.tulingxueyuan.mall.modules.pms.model.dto.ProductCateChildrenDTO;
import com.tulingxueyuan.mall.modules.pms.service.PmsProductCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * Product Category Front Controller
 * </p>
 *
 */
@RestController
@RequestMapping("/productCategory")
public class PmsProductCategoryController {
    @Autowired
    PmsProductCategoryService productCategoryService;
    @RequestMapping(value="/list/{parentId}", method = RequestMethod.GET)
    public CommonResult<CommonPage<PmsProductCategory>> getList(@PathVariable Long parentId,
                                                                @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                                                @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize) {
        Page page =  productCategoryService.list(parentId, pageNum, pageSize);
        return CommonResult.success(CommonPage.restPage(page));
    }


    @RequestMapping(value="/update/navStatus", method = RequestMethod.POST)
    public CommonResult updateNavStatus(@RequestParam(value = "ids") List<Long> ids,
                                                                @RequestParam(value = "navStatus") Integer navStatus) {
        boolean result = productCategoryService.updateNavStatus(ids, navStatus);
        if(result) {
            return CommonResult.success(result);
        }else {
            return CommonResult.failed();
        }
    }
    @RequestMapping(value="/delete/{id}", method = RequestMethod.POST)
    public CommonResult delete(@PathVariable Long id) {
        boolean result = productCategoryService.removeById(id);
        if(result) {
            return CommonResult.success(result);
        }else {
            return CommonResult.failed();
        }
    }

    @RequestMapping(value="/create", method = RequestMethod.POST)
    public CommonResult create(@RequestBody PmsProductCategory productCategory) {
        boolean result = productCategoryService.save(productCategory);
        if(result) {
            return CommonResult.success(result);
        }else {
            return CommonResult.failed();
        }
    }
    @RequestMapping(value="/{id}", method = RequestMethod.GET)
    public CommonResult<PmsProductCategory> getById(@PathVariable Long id) {
        PmsProductCategory productCategory = productCategoryService.getById(id);
        return CommonResult.success(productCategory);
    }

    @RequestMapping(value="/update/{id}", method = RequestMethod.POST)
    public CommonResult update(@RequestBody PmsProductCategory productCategory) {
        boolean result = productCategoryService.updateById(productCategory);
        if (result) {
            return CommonResult.success(result);
        } else {
            return CommonResult.failed();
        }
    }

    @RequestMapping(value="/list/withChildren", method = RequestMethod.GET)
    public CommonResult getWithChildren() {
        List<ProductCateChildrenDTO> list =  productCategoryService.getWithChildren();
        return CommonResult.success(list);
    }
}


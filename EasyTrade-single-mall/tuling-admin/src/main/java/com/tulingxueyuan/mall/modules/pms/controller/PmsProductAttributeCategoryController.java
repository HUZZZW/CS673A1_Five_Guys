package com.tulingxueyuan.mall.modules.pms.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tulingxueyuan.mall.common.api.CommonPage;
import com.tulingxueyuan.mall.common.api.CommonResult;
import com.tulingxueyuan.mall.modules.pms.model.PmsProductAttributeCategory;
import com.tulingxueyuan.mall.modules.pms.model.PmsProductCategory;
import com.tulingxueyuan.mall.modules.pms.service.PmsProductAttributeCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * Product attribute classification table Front-end controller
 * </p>
 *
 */
@RestController
@RequestMapping("/productAttribute/category")
public class PmsProductAttributeCategoryController {
    @Autowired
    PmsProductAttributeCategoryService attributeCategoryService;
    @RequestMapping(value="/list", method = RequestMethod.GET)
    public CommonResult<CommonPage<PmsProductAttributeCategory>> getList(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                                                @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize) {
        Page page =  attributeCategoryService.list(pageNum, pageSize);
        return CommonResult.success(CommonPage.restPage(page));
    }

    @RequestMapping(value="/create", method = RequestMethod.POST)
    public CommonResult create(PmsProductAttributeCategory productAttributeCategory) {
        boolean result = attributeCategoryService.add(productAttributeCategory);
        if(result) {
            return CommonResult.success(result);
        }else {
            return CommonResult.failed();
        }
    }

    //url:'/productAttribute/category/update/'+id,
    //method:'post',
    //data:data

    @RequestMapping(value="/update/{id}", method = RequestMethod.POST)
    public CommonResult update(PmsProductAttributeCategory productAttributeCategory) {
        boolean result = attributeCategoryService.updateById(productAttributeCategory);
        if (result) {
            return CommonResult.success(result);
        } else {
            return CommonResult.failed();
        }
    }

    //url:'/productAttribute/category/delete/'+id,
    //method:'get'
    @RequestMapping(value="/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable Long id) {
        boolean result = attributeCategoryService.removeById(id);
        if(result) {
            return CommonResult.success(result);
        }else {
            return CommonResult.failed();
        }
    }
}


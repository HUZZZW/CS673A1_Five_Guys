package com.tulingxueyuan.mall.modules.pms.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tulingxueyuan.mall.common.api.CommonPage;
import com.tulingxueyuan.mall.common.api.CommonResult;
import com.tulingxueyuan.mall.modules.pms.model.PmsProductAttribute;
import com.tulingxueyuan.mall.modules.pms.model.PmsProductAttributeCategory;
import com.tulingxueyuan.mall.modules.pms.model.PmsProductCategory;
import com.tulingxueyuan.mall.modules.pms.service.PmsProductAttributeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * Commodity attribute parameter table Front-end controller
 * </p>
 *
 */
@RestController
@RequestMapping("/productAttribute")
public class PmsProductAttributeController {
    @Autowired
    PmsProductAttributeService productAttributeService;
    /**
     * url:'/productAttribute/list/'+cid,
     *     method:'get',
     *     params:params
     */
    @RequestMapping(value="/list/{cid}", method = RequestMethod.GET)
    public CommonResult<CommonPage> getList(@PathVariable Long cid,
                                                                @RequestParam(value="type") Integer type,
                                                                @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                                                @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize) {
        Page page =  productAttributeService.list(cid, type, pageNum, pageSize);
        return CommonResult.success(CommonPage.restPage(page));
    }

    @RequestMapping(value="/create", method = RequestMethod.POST)
    public CommonResult create(@RequestBody PmsProductAttribute productAttribute) {
        boolean result = productAttributeService.create(productAttribute);
        if(result) {
            return CommonResult.success(result);
        }else {
            return CommonResult.failed();
        }
    }

    @RequestMapping(value="/update/{id}", method = RequestMethod.POST)
    public CommonResult update(@RequestBody PmsProductAttribute productAttribute) {
        boolean result = productAttributeService.updateById(productAttribute);
        if (result) {
            return CommonResult.success(result);
        } else {
            return CommonResult.failed();
        }
    }

    @RequestMapping(value="/{id}", method = RequestMethod.GET)
    public CommonResult<PmsProductAttribute> getById(@PathVariable Long id) {
        PmsProductAttribute productAttribute = productAttributeService.getById(id);
        return CommonResult.success(productAttribute);
    }

    @RequestMapping(value="/delete", method = RequestMethod.POST)
    public CommonResult delete(@RequestParam List<Long> ids) {
        boolean result = productAttributeService.delete(ids);
        if(result) {
            return CommonResult.success(result);
        }else {
            return CommonResult.failed();
        }
    }
}


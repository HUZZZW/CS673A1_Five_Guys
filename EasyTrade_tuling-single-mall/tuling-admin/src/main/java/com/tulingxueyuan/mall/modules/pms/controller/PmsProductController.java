package com.tulingxueyuan.mall.modules.pms.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tulingxueyuan.mall.common.api.CommonPage;
import com.tulingxueyuan.mall.common.api.CommonResult;
import com.tulingxueyuan.mall.modules.pms.model.PmsProduct;
import com.tulingxueyuan.mall.modules.pms.model.PmsProductAttribute;
import com.tulingxueyuan.mall.modules.pms.model.dto.ProductConditionDTO;
import com.tulingxueyuan.mall.modules.pms.model.dto.ProductSaveParamsDTO;
import com.tulingxueyuan.mall.modules.pms.model.dto.ProductUpdateInitDTO;
import com.tulingxueyuan.mall.modules.pms.service.PmsProductService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * Product Information Front Controller
 * </p>
 *
 */
@RestController
@RequestMapping("/product")
public class PmsProductController {
    @Autowired
    PmsProductService productService;

    /**
     * url:'/product/list',
     *     method:'get',
     *     params:params
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list(ProductConditionDTO conditionDTO) {
        Page page = productService.list(conditionDTO);
        return CommonResult.success(CommonPage.restPage(page));
    }

    @RequestMapping(value = "/update/deleteStatus", method = RequestMethod.POST)
    public CommonResult delete(@RequestParam("ids") List<Long> ids) {
        boolean result = productService.removeByIds(ids);
        if(result) {
            return CommonResult.success(result);
        } else {
            return CommonResult.failed();
        }
    }

    @RequestMapping(value = "/update/newStatus", method = RequestMethod.POST)
    public CommonResult updateNewStatus(@RequestParam("ids") List<Long> ids,
                                        @RequestParam("newStatus") Integer newStatus) {
        boolean result = productService.updateStatus(newStatus, ids,PmsProduct::getNewStatus);
        if(result) {
            return CommonResult.success(result);
        } else {
            return CommonResult.failed();
        }
    }

    @RequestMapping(value = "/update/recommendStatus", method = RequestMethod.POST)
    public CommonResult updateRecommendStatus(@RequestParam("ids") List<Long> ids,
                                              @RequestParam("recommendStatus") Integer recommendStatus) {
        boolean result = productService.updateStatus(recommendStatus, ids,PmsProduct::getRecommandStatus);
        if(result) {
            return CommonResult.success(result);
        } else {
            return CommonResult.failed();
        }
    }

    @RequestMapping(value = "/update/publishStatus", method = RequestMethod.POST)
    public CommonResult updatePublishStatus(@RequestParam("ids") List<Long> ids,
                                            @RequestParam("publishStatus") Integer publishStatus) {
        boolean result = productService.updateStatus(publishStatus, ids,PmsProduct::getPublishStatus);
        if(result) {
            return CommonResult.success(result);
        } else {
            return CommonResult.failed();
        }
    }
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult create(@RequestBody ProductSaveParamsDTO productSaveParamsDTO) {
        boolean result = productService.create(productSaveParamsDTO);
        if(result) {
            return CommonResult.success(result);
        } else {
            return CommonResult.failed();
        }
    }

    @RequestMapping(value = "/updateInfo/{id}", method = RequestMethod.GET)
    public CommonResult getUpdateInfo(@PathVariable Long id) {
        ProductUpdateInitDTO updateInitDTO = productService.getUpdateInfo(id);
        return CommonResult.success(updateInitDTO);
    }

    /**
     * url:'/product/update/'+id,
     *     method:'post',
     *     data:data
     */
    @RequestMapping(value="/update/{id}", method = RequestMethod.POST)
    public CommonResult update(@RequestBody PmsProduct product) {
        boolean result = productService.updateById(product);
        if (result) {
            return CommonResult.success(result);
        } else {
            return CommonResult.failed();
        }
    }
}


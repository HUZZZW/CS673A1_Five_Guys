package com.tulingxueyuan.mall.controller;

import com.tulingxueyuan.mall.common.api.CommonResult;
import com.tulingxueyuan.mall.dto.HomeGoodsSaleDTO;
import com.tulingxueyuan.mall.dto.HomeMenusBannerDTO;
import com.tulingxueyuan.mall.dto.HomeMenusDTO;
import com.tulingxueyuan.mall.modules.pms.service.PmsProductCategoryService;
import com.tulingxueyuan.mall.modules.sms.model.SmsHomeAdvertise;
import com.tulingxueyuan.mall.modules.sms.service.SmsHomeAdvertiseService;
import com.tulingxueyuan.mall.modules.sms.service.SmsHomeCategoryService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
* 首页控制器
* */

@RestController
@Api(tags = "HomeController", description = "首页内容管理")
@RequestMapping("/home")
public class HomeController {

    @Autowired
    PmsProductCategoryService productCategoryService;
    @Autowired
    SmsHomeAdvertiseService homeAdvertiseService;
    @Autowired
    SmsHomeCategoryService homeCategoryService;

    /**
     * 获取首页类型导航栏和横幅的组合数据
     * get("/home/menus_banner")
     */
    @RequestMapping(value = "/menus_banner", method = RequestMethod.GET)
    public CommonResult getMenus() {

        // menus
        List<HomeMenusDTO> list = productCategoryService.getMenus();

        // banner
        List<SmsHomeAdvertise> homeAdvertiseList = homeAdvertiseService.getHomeBanners();

        HomeMenusBannerDTO homeMenusBannerDTO = new HomeMenusBannerDTO();
        homeMenusBannerDTO.setHomeMenusList(list);
        homeMenusBannerDTO.setHomeAdvertiseList(homeAdvertiseList);

        return CommonResult.success(homeMenusBannerDTO);
    }

    /**
     * 获取首页热销商品数据
     * get("/home/goods_sale")
     */
    @RequestMapping(value = "/goods_sale", method = RequestMethod.GET)
    public CommonResult getGoodsSale() {
        List<HomeGoodsSaleDTO> list = homeCategoryService.getGoodsSale();
        return CommonResult.success(list);
    }
}

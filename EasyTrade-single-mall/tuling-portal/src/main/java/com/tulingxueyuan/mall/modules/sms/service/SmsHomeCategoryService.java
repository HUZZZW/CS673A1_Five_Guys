package com.tulingxueyuan.mall.modules.sms.service;

import com.tulingxueyuan.mall.dto.HomeGoodsSaleDTO;
import com.tulingxueyuan.mall.modules.sms.model.SmsHomeCategory;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *
 * service class
 * </p>
 *
 */
public interface SmsHomeCategoryService extends IService<SmsHomeCategory> {
    List<HomeGoodsSaleDTO> getGoodsSale();
}

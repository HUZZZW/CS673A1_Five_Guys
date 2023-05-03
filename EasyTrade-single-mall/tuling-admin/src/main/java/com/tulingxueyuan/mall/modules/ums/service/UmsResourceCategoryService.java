package com.tulingxueyuan.mall.modules.ums.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.tulingxueyuan.mall.modules.ums.model.UmsResourceCategory;

import java.util.List;

/**
 *
 * Background resource classification management service
 */
public interface UmsResourceCategoryService extends IService<UmsResourceCategory> {

    /**
     *
     * Get all resource categories
     */
    List<UmsResourceCategory> listAll();

    /**
     *
     * Create resource categories
     */
    boolean create(UmsResourceCategory umsResourceCategory);
}

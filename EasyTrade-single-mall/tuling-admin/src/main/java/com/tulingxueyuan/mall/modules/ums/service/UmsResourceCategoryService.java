package com.tulingxueyuan.mall.modules.ums.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.tulingxueyuan.mall.modules.ums.model.UmsResourceCategory;

import java.util.List;

/**
 * Back-end resource classification management Service
 * Created by macro on 2020/2/5.
 */
public interface UmsResourceCategoryService extends IService<UmsResourceCategory> {

    /**
     * Get all resource classifications
     */
    List<UmsResourceCategory> listAll();

    /**
     * Creating resource categories
     */
    boolean create(UmsResourceCategory umsResourceCategory);
}

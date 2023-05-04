package com.tulingxueyuan.mall.modules.ums.service;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.tulingxueyuan.mall.modules.ums.model.UmsResource;

/**
 *
 * Background Resource Management Service
 */
public interface UmsResourceService extends IService<UmsResource> {
    /**
     *
     * add resources
     */
    boolean create(UmsResource umsResource);

    /**
     *
     * edit resources
     */
    boolean update(Long id, UmsResource umsResource);

    /**
     *
     * delete resources
     */
    boolean delete(Long id);

    /**
     *
     * Paging query resources
     */
    Page<UmsResource> list(Long categoryId, String nameKeyword, String urlKeyword, Integer pageSize, Integer pageNum);
}

package com.tulingxueyuan.mall.modules.ums.service;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.tulingxueyuan.mall.modules.ums.model.UmsResource;

/**
 * Back-end resource management Service
 * Created by macro on 2020/2/2.
 */
public interface UmsResourceService extends IService<UmsResource> {
    /**
     * Adding resources
     */
    boolean create(UmsResource umsResource);

    /**
     * Modifying resources
     */
    boolean update(Long id, UmsResource umsResource);

    /**
     * Deleting resources
     */
    boolean delete(Long id);

    /**
     * Paginate resources
     */
    Page<UmsResource> list(Long categoryId, String nameKeyword, String urlKeyword, Integer pageSize, Integer pageNum);
}

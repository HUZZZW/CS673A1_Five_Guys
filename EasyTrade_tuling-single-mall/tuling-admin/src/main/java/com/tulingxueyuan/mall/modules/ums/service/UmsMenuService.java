package com.tulingxueyuan.mall.modules.ums.service;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.tulingxueyuan.mall.modules.ums.dto.UmsMenuNode;
import com.tulingxueyuan.mall.modules.ums.model.UmsMenu;

import java.util.List;

/**
 * Background menu management service
 */
public interface UmsMenuService extends IService<UmsMenu> {
    /**
     *
     * Create background menu
     */
    boolean create(UmsMenu umsMenu);

    /**
     * Modify background menu
     */
    boolean update(Long id, UmsMenu umsMenu);

    /**
     *
     * Paging query background menu
     */
    Page<UmsMenu> list(Long parentId, Integer pageSize, Integer pageNum);

    /**
     *
     * Tree structure returns a list of all menus
     */
    List<UmsMenuNode> treeList();

    /**
     *
     * Modify menu display status
     */
    boolean updateHidden(Long id, Integer hidden);
}

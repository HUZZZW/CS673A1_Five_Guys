package com.tulingxueyuan.mall.modules.ums.service;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.tulingxueyuan.mall.modules.ums.dto.UmsMenuNode;
import com.tulingxueyuan.mall.modules.ums.model.UmsMenu;

import java.util.List;

/**
 * Back-end menu management Service
 * Created by macro on 2020/2/2.
 */
public interface UmsMenuService extends IService<UmsMenu> {
    /**
     * Creating a back-end menu
     */
    boolean create(UmsMenu umsMenu);

    /**
     * Modify the back-end menu
     */
    boolean update(Long id, UmsMenu umsMenu);

    /**
     * Paginate the back-end menu
     */
    Page<UmsMenu> list(Long parentId, Integer pageSize, Integer pageNum);

    /**
     * The tree structure returns a list of all menus
     */
    List<UmsMenuNode> treeList();

    /**
     * Modify the display state of the menu
     */
    boolean updateHidden(Long id, Integer hidden);
}

package com.tulingxueyuan.mall.modules.ums.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.tulingxueyuan.mall.modules.ums.model.UmsMenu;
import com.tulingxueyuan.mall.modules.ums.model.UmsResource;
import com.tulingxueyuan.mall.modules.ums.model.UmsRole;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Back-end role management Service
 * Created by macro on 2018/9/30.
 */
public interface UmsRoleService extends IService<UmsRole> {
    /**
     * Adding a role
     */
    boolean create(UmsRole role);

    /**
     * Deleting roles in bulk
     */
    boolean delete(List<Long> ids);

    /**
     * Paginate to get a list of roles
     */
    Page<UmsRole> list(String keyword, Integer pageSize, Integer pageNum);

    /**
     * Get the corresponding menu according to the administrator ID
     */
    List<UmsMenu> getMenuList(Long adminId);

    /**
     * Get the role related menu
     */
    List<UmsMenu> listMenu(Long roleId);

    /**
     * Access resources related to roles
     */
    List<UmsResource> listResource(Long roleId);

    /**
     * Assign menus to roles
     */
    @Transactional
    int allocMenu(Long roleId, List<Long> menuIds);

    /**
     * Allocate resources to roles
     */
    @Transactional
    int allocResource(Long roleId, List<Long> resourceIds);
}

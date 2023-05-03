package com.tulingxueyuan.mall.modules.ums.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.tulingxueyuan.mall.modules.ums.model.UmsMenu;
import com.tulingxueyuan.mall.modules.ums.model.UmsResource;
import com.tulingxueyuan.mall.modules.ums.model.UmsRole;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 *
 * Background role management Service
 */
public interface UmsRoleService extends IService<UmsRole> {
    /**
     *
     * add role
     */
    boolean create(UmsRole role);

    /**
     *
     * Batch delete roles
     */
    boolean delete(List<Long> ids);

    /**
     *
     * Paging to get the list of roles
     */
    Page<UmsRole> list(String keyword, Integer pageSize, Integer pageNum);

    /**
     * Get the corresponding menu according to the administrator ID
     */
    List<UmsMenu> getMenuList(Long adminId);

    /**
     * Get role related menu
     */
    List<UmsMenu> listMenu(Long roleId);

    /**
     * Get role-related resources
     */
    List<UmsResource> listResource(Long roleId);

    /**
     *
     * assign role menu
     */
    @Transactional
    int allocMenu(Long roleId, List<Long> menuIds);

    /**
     *
     * Assign resources to roles
     */
    @Transactional
    int allocResource(Long roleId, List<Long> resourceIds);
}

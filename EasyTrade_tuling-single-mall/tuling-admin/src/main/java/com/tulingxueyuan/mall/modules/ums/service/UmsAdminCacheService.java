package com.tulingxueyuan.mall.modules.ums.service;



import com.tulingxueyuan.mall.modules.ums.model.UmsAdmin;
import com.tulingxueyuan.mall.modules.ums.model.UmsResource;

import java.util.List;

/**
 *
 * Background user cache management service
 */
public interface UmsAdminCacheService {
    /**
     * Delete background user cache
     */
    void delAdmin(Long adminId);

    /**
     *
     * Delete background user resource list cache
     */
    void delResourceList(Long adminId);

    /**
     *
     * When role-related resource information changes, delete the relevant background user cache
     */
    void delResourceListByRole(Long roleId);

    /**
     *
     * When role-related resource information changes, delete the relevant background user cache
     */
    void delResourceListByRoleIds(List<Long> roleIds);

    /**
     *
     * When the resource information changes, delete the background user cache of the resource item
     */
    void delResourceListByResource(Long resourceId);

    /**
     *
     * Get cached background user information
     */
    UmsAdmin getAdmin(String username);

    /**
     *
     * Set cache background user information
     */
    void setAdmin(UmsAdmin admin);

    /**
     *
     * Get the list of cached background user resources
     */
    List<UmsResource> getResourceList(Long adminId);

    /**
     *
     * Set background background user resource list
     */
    void setResourceList(Long adminId, List<UmsResource> resourceList);
}

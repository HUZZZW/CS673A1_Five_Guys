package com.tulingxueyuan.mall.modules.ums.service;



import com.tulingxueyuan.mall.modules.ums.model.UmsAdmin;
import com.tulingxueyuan.mall.modules.ums.model.UmsResource;

import java.util.List;

/**
 * Back-end user cache managementService
 * Created by macro on 2020/3/13.
 */
public interface UmsAdminCacheService {
    /**
     * Remove the back-end user cache
     */
    void delAdmin(Long adminId);

    /**
     * Remove the back-end user resource list cache
     */
    void delResourceList(Long adminId);

    /**
     * When the role-related resource information changes, the related back-end user cache is deleted
     */
    void delResourceListByRole(Long roleId);

    /**
     * When the role-related resource information changes, the related back-end user cache is deleted
     */
    void delResourceListByRoleIds(List<Long> roleIds);

    /**
     * When the resource information changes, the resource project back-end user cache is deleted
     */
    void delResourceListByResource(Long resourceId);

    /**
     * Get cached back-end user information
     */
    UmsAdmin getAdmin(String username);

    /**
     * Set to cache back-end user information
     */
    void setAdmin(UmsAdmin admin);

    /**
     * Get a list of cached back-end user resources
     */
    List<UmsResource> getResourceList(Long adminId);

    /**
     * Set the back-end user resource list
     */
    void setResourceList(Long adminId, List<UmsResource> resourceList);
}

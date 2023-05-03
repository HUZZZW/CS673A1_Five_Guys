package com.tulingxueyuan.mall.modules.ums.service;

import com.tulingxueyuan.mall.modules.ums.model.UmsMember;


/**
 *
 * Background user cache management service
 */
public interface UmsMemberCacheService {


    /**
     *
     * Get cached background user information
     */
    UmsMember getMember(String username);

    /**
     *
     * Set cache background user information
     */
    void setMember(UmsMember Member);

    /**
     *
     * Get the list of cached background user resources
     */
//    List<UmsResource> getResourceList(Long MemberId);

    /**
     *
     * Set background background user resource list
     */
//    void setResourceList(Long MemberId, List<UmsResource> resourceList);
}

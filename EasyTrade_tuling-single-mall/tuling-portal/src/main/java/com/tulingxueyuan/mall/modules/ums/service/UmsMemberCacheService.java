package com.tulingxueyuan.mall.modules.ums.service;

import com.tulingxueyuan.mall.modules.ums.model.UmsMember;


/**
 * 后台用户缓存管理Service
 * Created by macro on 2020/3/13.
 */
public interface UmsMemberCacheService {
//    /**
//     * 删除后台用户缓存
//     */
//    void delMember(Long MemberId);
//
//    /**
//     * 删除后台用户资源列表缓存
//     */
//    void delResourceList(Long MemberId);
//
//    /**
//     * 当角色相关资源信息改变时删除相关后台用户缓存
//     */
//    void delResourceListByRole(Long roleId);
//
//    /**
//     * 当角色相关资源信息改变时删除相关后台用户缓存
//     */
//    void delResourceListByRoleIds(List<Long> roleIds);
//
//    /**
//     * 当资源信息改变时，删除资源项目后台用户缓存
//     */
//    void delResourceListByResource(Long resourceId);

    /**
     * 获取缓存后台用户信息
     */
    UmsMember getMember(String username);

    /**
     * 设置缓存后台用户信息
     */
    void setMember(UmsMember Member);

    /**
     * 获取缓存后台用户资源列表
     */
//    List<UmsResource> getResourceList(Long MemberId);

    /**
     * 设置后台后台用户资源列表
     */
//    void setResourceList(Long MemberId, List<UmsResource> resourceList);
}

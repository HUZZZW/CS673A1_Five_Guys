package com.tulingxueyuan.mall.modules.ums.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tulingxueyuan.mall.modules.ums.model.UmsResource;
import com.tulingxueyuan.mall.modules.ums.model.UmsResource;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Background resource table Mapper interface
 * </p>
 *
 */
public interface UmsResourceMapper extends BaseMapper<UmsResource> {

    /**
     *
     * Get all accessible resources of the user
     */
    List<UmsResource> getResourceList(@Param("adminId") Long adminId);

    /**
     * Get resources by role ID
     */
    List<UmsResource> getResourceListByRoleId(@Param("roleId") Long roleId);

}

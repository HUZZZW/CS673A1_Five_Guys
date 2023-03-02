package com.tulingxueyuan.mall.modules.ums.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tulingxueyuan.mall.modules.ums.model.UmsResource;
import com.tulingxueyuan.mall.modules.ums.model.UmsResource;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Back-end resource table Mapper interface
 * </p>
 *
 * @author macro
 * @since 2020-08-21
 */
public interface UmsResourceMapper extends BaseMapper<UmsResource> {

    /**
     * Obtain all resources accessible to the user
     */
    List<UmsResource> getResourceList(@Param("adminId") Long adminId);

    /**
     * Gets resources based on the role ID
     */
    List<UmsResource> getResourceListByRoleId(@Param("roleId") Long roleId);

}

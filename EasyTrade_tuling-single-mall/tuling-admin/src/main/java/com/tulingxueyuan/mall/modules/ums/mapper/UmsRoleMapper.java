package com.tulingxueyuan.mall.modules.ums.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tulingxueyuan.mall.modules.ums.model.UmsRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Background user role table Mapper interface
 * </p>
 *
 */
public interface UmsRoleMapper extends BaseMapper<UmsRole> {

    /**
     *
     * Get all roles of a user
     */
    List<UmsRole> getRoleList(@Param("adminId") Long adminId);

}

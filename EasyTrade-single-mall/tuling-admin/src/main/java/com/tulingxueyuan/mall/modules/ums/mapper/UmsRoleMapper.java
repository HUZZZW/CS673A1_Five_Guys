package com.tulingxueyuan.mall.modules.ums.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tulingxueyuan.mall.modules.ums.model.UmsRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Back-end user role table Mapper interface
 * </p>
 *
 * @author macro
 * @since 2020-08-21
 */
public interface UmsRoleMapper extends BaseMapper<UmsRole> {

    /**
     * Obtain all roles of the user
     */
    List<UmsRole> getRoleList(@Param("adminId") Long adminId);

}

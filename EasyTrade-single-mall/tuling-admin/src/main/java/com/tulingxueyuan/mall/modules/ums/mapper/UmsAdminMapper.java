package com.tulingxueyuan.mall.modules.ums.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tulingxueyuan.mall.modules.ums.model.UmsAdmin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *
 * Background user table Mapper interface
 * </p>
 *
 */
public interface UmsAdminMapper extends BaseMapper<UmsAdmin> {

    /**
     *
     * Get a list of resource-related user IDs
     */
    List<Long> getAdminIdList(@Param("resourceId") Long resourceId);

}

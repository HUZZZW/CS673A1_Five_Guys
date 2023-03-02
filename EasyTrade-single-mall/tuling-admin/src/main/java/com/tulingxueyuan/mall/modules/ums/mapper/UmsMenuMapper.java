package com.tulingxueyuan.mall.modules.ums.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tulingxueyuan.mall.modules.ums.model.UmsMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Back-end menu table Mapper interface
 * </p>
 *
 * @author macro
 * @since 2020-08-21
 */
public interface UmsMenuMapper extends BaseMapper<UmsMenu> {

    /**
     * Get the menu based on the background user ID
     */
    List<UmsMenu> getMenuList(@Param("adminId") Long adminId);
    /**
     * Gets the menu based on the role ID
     */
    List<UmsMenu> getMenuListByRoleId(@Param("roleId") Long roleId);

}

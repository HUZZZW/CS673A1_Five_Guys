package com.tulingxueyuan.mall.modules.ums.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tulingxueyuan.mall.modules.ums.model.UmsMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Background menu table Mapper interface
 * </p>
 *
 */
public interface UmsMenuMapper extends BaseMapper<UmsMenu> {

    /**
     *
     * Get the menu according to the background user ID
     */
    List<UmsMenu> getMenuList(@Param("adminId") Long adminId);
    /**
     *
     * Get the menu according to the role ID
     */
    List<UmsMenu> getMenuListByRoleId(@Param("roleId") Long roleId);

}

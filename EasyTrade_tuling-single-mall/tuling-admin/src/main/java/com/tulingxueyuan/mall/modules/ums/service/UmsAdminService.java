package com.tulingxueyuan.mall.modules.ums.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.tulingxueyuan.mall.modules.ums.dto.UmsAdminParam;
import com.tulingxueyuan.mall.modules.ums.dto.UpdateAdminPasswordParam;
import com.tulingxueyuan.mall.modules.ums.model.UmsAdmin;
import com.tulingxueyuan.mall.modules.ums.model.UmsResource;
import com.tulingxueyuan.mall.modules.ums.model.UmsRole;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 *
 * Background administrator management Service
 */
public interface UmsAdminService extends IService<UmsAdmin> {
    /**
     *
     * Get the background administrator according to the user name
     */
    UmsAdmin getAdminByUsername(String username);

    /**
     *
     * registration function
     */
    UmsAdmin register(UmsAdminParam umsAdminParam);

    /**
     *
     * login function
     * @param username username
     * @param password password
     * @return The generated JWT token
     */
    UmsAdmin login(String username, String password);



    /**
     *
     * Query users according to user name or nickname
     */
    Page<UmsAdmin> list(String keyword, Integer pageSize, Integer pageNum);

    /**
     *
     * Modify specified user information
     */
    boolean update(Long id, UmsAdmin admin);

    /**
     *
     * delete specified user
     */
    boolean delete(Long id);

    /**
     * Modify User Role Relationships
     */
    @Transactional
    int updateRole(Long adminId, List<Long> roleIds);

    /**
     *
     * get user for role
     */
    List<UmsRole> getRoleList(Long adminId);

    /**
     * Get the accessible resources of the specified user
     */
    List<UmsResource> getResourceList(Long adminId);

    /**
     *
     * change Password
     */
    int updatePassword(UpdateAdminPasswordParam updatePasswordParam);

    /**
     *
     * Get user information
     */
    UmsAdmin loadUserByUsername(String username);
}

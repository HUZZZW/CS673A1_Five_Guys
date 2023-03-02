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
 * Back-end administrator management Service
 * Created by macro on 2018/4/26.
 */
public interface UmsAdminService extends IService<UmsAdmin> {
    /**
     * Get the back-end administrator based on the user name
     */
    UmsAdmin getAdminByUsername(String username);

    /**
     * Registration function
     */
    UmsAdmin register(UmsAdminParam umsAdminParam);

    /**
     * Login function
     * @param username username
     * @param password password
     * @return produce JWT token
     */
    UmsAdmin login(String username, String password);



    /**
     * Pagination searches for users by username or nickname
     */
    Page<UmsAdmin> list(String keyword, Integer pageSize, Integer pageNum);

    /**
     * Modify the specified user information
     */
    boolean update(Long id, UmsAdmin admin);

    /**
     * Remove specified user
     */
    boolean delete(Long id);

    /**
     * Modify user role relationships
     */
    @Transactional
    int updateRole(Long adminId, List<Long> roleIds);

    /**
     * Get the user for the role
     */
    List<UmsRole> getRoleList(Long adminId);

    /**
     * Retrieves the accessible resources for the specified user
     */
    List<UmsResource> getResourceList(Long adminId);

    /**
     * Change password
     */
    int updatePassword(UpdateAdminPasswordParam updatePasswordParam);

    /**
     * Getting user information
     */
    UmsAdmin loadUserByUsername(String username);
}

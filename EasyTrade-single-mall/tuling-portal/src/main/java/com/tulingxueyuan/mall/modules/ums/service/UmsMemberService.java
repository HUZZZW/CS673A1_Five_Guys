package com.tulingxueyuan.mall.modules.ums.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tulingxueyuan.mall.modules.ums.model.UmsMember;
//import org.springframework.security.core.userdetails.UserDetails;


/**
 * <p>
 *
 * membership form
 * </p>
 *
 */
public interface UmsMemberService extends IService<UmsMember> {
    /**
     *
     * Get the background administrator according to the user name
     */
    UmsMember getMemberByUsername(String username);

    /**
     *
     * registration function
     */
    UmsMember register(UmsMember umsMemberParam);

    /**
     *
     * login function
     * @param username
     * @param password
     * @return
     */
    UmsMember login(String username, String password);



    /**
     *
     * Get user information
     */
    UmsMember loadUserByUsername(String username);

    /**
     *
     * Get the currently logged in user
     */
    UmsMember getCurrentMember();
}


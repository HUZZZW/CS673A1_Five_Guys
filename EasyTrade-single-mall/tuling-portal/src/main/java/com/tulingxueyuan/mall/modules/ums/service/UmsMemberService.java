package com.tulingxueyuan.mall.modules.ums.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tulingxueyuan.mall.modules.ums.model.UmsMember;
//import org.springframework.security.core.userdetails.UserDetails;


/**
 * <p>
 * 会员表 服务类
 * </p>
 *
 * @author XuShu
 * @since 2021-03-19
 */
public interface UmsMemberService extends IService<UmsMember> {
    /**
     * 根据用户名获取后台管理员
     */
    UmsMember getMemberByUsername(String username);

    /**
     * 注册功能
     */
    UmsMember register(UmsMember umsMemberParam);

    /**
     * 登录功能
     * @param username 用户名
     * @param password 密码
     * @return 生成的JWT的token
     */
    UmsMember login(String username, String password);



//    /**
//     * 根据用户名或昵称分页查询用户
//     */
//    Page<UmsMember> list(String keyword, Integer pageSize, Integer pageNum);
//
//    /**
//     * 修改指定用户信息
//     */
//    boolean update(Long id, UmsMember Member);
//
//    /**
//     * 删除指定用户
//     */
//    boolean delete(Long id);
//
//    /**
//     * 修改用户角色关系
//     */
//    @Transactional
//    int updateRole(Long MemberId, List<Long> roleIds);

//    /**
//     * 获取用户对于角色
//     */
//    List<UmsRole> getRoleList(Long MemberId);
//
//    /**
//     * 获取指定用户的可访问资源
//     */
//    List<UmsResource> getResourceList(Long MemberId);
//
//    /**
//     * 修改密码
//     */
//    int updatePassword(UpdateMemberPasswordParam updatePasswordParam);

    /**
     * 获取用户信息
     */
    UmsMember loadUserByUsername(String username);

    /**
     * 获取当前登录用户
     */
    UmsMember getCurrentMember();
}


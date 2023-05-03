package com.tulingxueyuan.mall.modules.ums.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.digest.BCrypt;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tulingxueyuan.mall.common.exception.ApiException;
import com.tulingxueyuan.mall.common.exception.Asserts;
import com.tulingxueyuan.mall.common.util.ComConstants;
import com.tulingxueyuan.mall.common.util.JwtTokenUtil;
import com.tulingxueyuan.mall.modules.ums.mapper.UmsMemberLoginLogMapper;
import com.tulingxueyuan.mall.modules.ums.model.UmsMember;
import com.tulingxueyuan.mall.modules.ums.mapper.UmsMemberMapper;
import com.tulingxueyuan.mall.modules.ums.model.UmsMemberLoginLog;
import com.tulingxueyuan.mall.modules.ums.service.UmsMemberCacheService;
import com.tulingxueyuan.mall.modules.ums.service.UmsMemberService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *
 * membership form
 * </p>
 *
 */
@Service
public class UmsMemberServiceImpl extends ServiceImpl<UmsMemberMapper, UmsMember> implements UmsMemberService {

    @Autowired
    private UmsMemberCacheService memberCacheService;
    @Autowired
    UmsMemberLoginLogMapper loginLogMapper;
//    @Autowired
//    private HttpSession session;

    @Override
    public UmsMember getMemberByUsername(String username) {
        UmsMember user = memberCacheService.getMember(username);
        if(user!=null) return  user;
        QueryWrapper<UmsMember> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(UmsMember::getUsername,username);
        List<UmsMember> memberList = list(wrapper);
        if (memberList != null && memberList.size() > 0) {
            user = memberList.get(0);
            memberCacheService.setMember(user);
            return user;
        }
        return null;
    }

    @Override
    public UmsMember register(UmsMember UmsMemberParam) {
        UmsMember umsMember = new UmsMember();
        BeanUtils.copyProperties(UmsMemberParam, umsMember);
        umsMember.setCreateTime(new Date());
        umsMember.setStatus(1);
        //查询是否有相同用户名的用户
        QueryWrapper<UmsMember> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(UmsMember::getUsername,umsMember.getUsername());
        List<UmsMember> UmsMemberList = list(wrapper);
        if (UmsMemberList.size() > 0) {
            return null;
        }
        //将密码进行加密操作
        String encodePassword = BCrypt.hashpw(umsMember.getPassword());
        umsMember.setPassword(encodePassword);
        baseMapper.insert(umsMember);
        return umsMember;
    }

    @Override
    public UmsMember login(String username, String password) {

        //密码需要客户端加密后传递
        UmsMember umsMember=null;
        try {
            umsMember = loadUserByUsername(username);
            if(!BCrypt.checkpw(password,umsMember.getPassword())){
                Asserts.fail("密码不正确");
            }
            /*if(!userDetails.isEnabled()){
                Asserts.fail("帐号已被禁用");
            }*/
            insertLoginLog(username);
        } catch (Exception e) {
            Asserts.fail("登录异常:"+e.getMessage());
        }
        return umsMember;
    }

    /**
     * @param username 用户名
     */
    private void insertLoginLog(String username) {
        UmsMember member = getMemberByUsername(username);
        if(member==null) return;
        UmsMemberLoginLog loginLog = new UmsMemberLoginLog();
        loginLog.setMemberId(member.getId());
        loginLog.setCreateTime(new Date());
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        loginLog.setIp(request.getRemoteAddr());
        loginLogMapper.insert(loginLog);
    }

    /**
     * @return
     */
    public UmsMember getCurrentMember() {
        // UmsMember umsMember = (UmsMember) session.getAttribute(ComConstants.FLAG_CURRENT_USER);
        String userName = JwtTokenUtil.currentUserName.get();
        if (StrUtil.isNotBlank(userName)) {
            return this.getMemberByUsername(userName);
        }
        return null;
    }

//
//    /**
//     * 根据用户名修改登录时间
//     */
//    private void updateLoginTimeByUsername(String username) {
//        UmsMember record = new UmsMember();
//        record.setLoginTime(new Date());
//        QueryWrapper<UmsMember> wrapper = new QueryWrapper<>();
//        wrapper.lambda().eq(UmsMember::getUsername,username);
//        update(record,wrapper);
//    }
//
//
//    @Override
//    public Page<UmsMember> list(String keyword, Integer pageSize, Integer pageNum) {
//        Page<UmsMember> page = new Page<>(pageNum,pageSize);
//        QueryWrapper<UmsMember> wrapper = new QueryWrapper<>();
//        LambdaQueryWrapper<UmsMember> lambda = wrapper.lambda();
//        if(StrUtil.isNotEmpty(keyword)){
//            lambda.like(UmsMember::getUsername,keyword);
//            lambda.or().like(UmsMember::getNickName,keyword);
//        }
//        return page(page,wrapper);
//    }

//    @Override
//    public boolean update(Long id, UmsMember member) {
//        member.setId(id);
//        UmsMember rawmember = getById(id);
//        if(rawmember.getPassword().equals(member.getPassword())){
//            //与原加密密码相同的不需要修改
//            member.setPassword(null);
//        }else{
//            //与原加密密码不同的需要加密修改
//            if(StrUtil.isEmpty(member.getPassword())){
//                member.setPassword(null);
//            }else{
//                member.setPassword(BCrypt.hashpw(member.getPassword()));
//            }
//        }
//        boolean success = updateById(member);
//        memberCacheService.delmember(id);
//        return success;
//    }
//
//    @Override
//    public boolean delete(Long id) {
//        memberCacheService.delmember(id);
//        boolean success = removeById(id);
//        memberCacheService.delResourceList(id);
//        return success;
//    }
//
//    @Override
//    public int updateRole(Long memberId, List<Long> roleIds) {
//        int count = roleIds == null ? 0 : roleIds.size();
//        //先删除原来的关系
//        QueryWrapper<UmsMemberRoleRelation> wrapper = new QueryWrapper<>();
//        wrapper.lambda().eq(UmsMemberRoleRelation::getmemberId,memberId);
//        memberRoleRelationService.remove(wrapper);
//        //建立新关系
//        if (!CollectionUtils.isEmpty(roleIds)) {
//            List<UmsMemberRoleRelation> list = new ArrayList<>();
//            for (Long roleId : roleIds) {
//                UmsMemberRoleRelation roleRelation = new UmsMemberRoleRelation();
//                roleRelation.setmemberId(memberId);
//                roleRelation.setRoleId(roleId);
//                list.add(roleRelation);
//            }
//            memberRoleRelationService.saveBatch(list);
//        }
//        memberCacheService.delResourceList(memberId);
//        return count;
//    }
//
//    @Override
//    public List<UmsRole> getRoleList(Long memberId) {
//        return roleMapper.getRoleList(memberId);
//    }
//
//    @Override
//    public List<UmsResource> getResourceList(Long memberId) {
//        List<UmsResource> resourceList = memberCacheService.getResourceList(memberId);
//        if(CollUtil.isNotEmpty(resourceList)){
//            return  resourceList;
//        }
//        resourceList = resourceMapper.getResourceList(memberId);
//        if(CollUtil.isNotEmpty(resourceList)){
//            memberCacheService.setResourceList(memberId,resourceList);
//        }
//        return resourceList;
//    }
//
//    @Override
//    public int updatePassword(UpdatememberPasswordParam param) {
//        if(StrUtil.isEmpty(param.getUsername())
//                ||StrUtil.isEmpty(param.getOldPassword())
//                ||StrUtil.isEmpty(param.getNewPassword())){
//            return -1;
//        }
//        QueryWrapper<UmsMember> wrapper = new QueryWrapper<>();
//        wrapper.lambda().eq(UmsMember::getUsername,param.getUsername());
//        List<UmsMember> memberList = list(wrapper);
//        if(CollUtil.isEmpty(memberList)){
//            return -2;
//        }
//        UmsMember UmsMember = memberList.get(0);
//        if(!BCrypt.checkpw(param.getOldPassword(),UmsMember.getPassword())){
//            return -3;
//        }
//        UmsMember.setPassword(BCrypt.hashpw(param.getNewPassword()));
//        updateById(UmsMember);
//        memberCacheService.delmember(UmsMember.getId());
//        return 1;
//    }
//
    @Override
    public UmsMember loadUserByUsername(String username){
        UmsMember member = getMemberByUsername(username);
        if (member != null) {
            return member;
        }
        throw new ApiException("用户不存在");
    }
}

package com.tulingxueyuan.mall.modules.ums.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.tulingxueyuan.mall.common.service.RedisService;
import com.tulingxueyuan.mall.modules.ums.mapper.UmsMemberMapper;
import com.tulingxueyuan.mall.modules.ums.model.UmsMember;
//import com.tulingxueyuan.mall.modules.ums.model.UmsMemberRoleRelation;
//import com.tulingxueyuan.mall.modules.ums.model.UmsResource;
import com.tulingxueyuan.mall.modules.ums.service.UmsMemberCacheService;
//import com.tulingxueyuan.mall.modules.ums.service.UmsMemberRoleRelationService;
import com.tulingxueyuan.mall.modules.ums.service.UmsMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 后台用户缓存管理Service实现类
 * Created by macro on 2020/3/13.
 */
@Service
public class UmsMemberCacheServiceImpl implements UmsMemberCacheService {
//    @Autowired
//    private UmsMemberService MemberService;
    @Autowired
    private RedisService redisService;
//    @Autowired
//    private UmsMemberMapper MemberMapper;
//    @Autowired
//    private UmsMemberRoleRelationService MemberRoleRelationService;
    @Value("${redis.database}")
    private String REDIS_DATABASE;
    @Value("${redis.expire.common}")
    private Long REDIS_EXPIRE;
    @Value("${redis.key.user}")
    private String REDIS_KEY_Member;
//    @Value("${redis.key.resourceList}")
//    private String REDIS_KEY_RESOURCE_LIST;

//    @Override
//    public void delMember(Long MemberId) {
//        UmsMember Member = MemberService.getById(MemberId);
//        if (Member != null) {
//            String key = REDIS_DATABASE + ":" + REDIS_KEY_Member + ":" + Member.getUsername();
//            redisService.del(key);
//        }
//    }

//    @Override
//    public void delResourceList(Long MemberId) {
//        String key = REDIS_DATABASE + ":" + REDIS_KEY_RESOURCE_LIST + ":" + MemberId;
//        redisService.del(key);
//    }

//    @Override
//    public void delResourceListByRole(Long roleId) {
//        QueryWrapper<UmsMemberRoleRelation> wrapper = new QueryWrapper<>();
//        wrapper.lambda().eq(UmsMemberRoleRelation::getRoleId,roleId);
//        List<UmsMemberRoleRelation> relationList = MemberRoleRelationService.list(wrapper);
//        if (CollUtil.isNotEmpty(relationList)) {
//            String keyPrefix = REDIS_DATABASE + ":" + REDIS_KEY_RESOURCE_LIST + ":";
//            List<String> keys = relationList.stream().map(relation -> keyPrefix + relation.getMemberId()).collect(Collectors.toList());
//            redisService.del(keys);
//        }
//    }

//    @Override
//    public void delResourceListByRoleIds(List<Long> roleIds) {
//        QueryWrapper<UmsMemberRoleRelation> wrapper = new QueryWrapper<>();
//        wrapper.lambda().in(UmsMemberRoleRelation::getRoleId,roleIds);
//        List<UmsMemberRoleRelation> relationList = MemberRoleRelationService.list(wrapper);
//        if (CollUtil.isNotEmpty(relationList)) {
//            String keyPrefix = REDIS_DATABASE + ":" + REDIS_KEY_RESOURCE_LIST + ":";
//            List<String> keys = relationList.stream().map(relation -> keyPrefix + relation.getMemberId()).collect(Collectors.toList());
//            redisService.del(keys);
//        }
//    }

//    @Override
//    public void delResourceListByResource(Long resourceId) {
//        List<Long> MemberIdList = MemberMapper.getMemberIdList(resourceId);
//        if (CollUtil.isNotEmpty(MemberIdList)) {
//            String keyPrefix = REDIS_DATABASE + ":" + REDIS_KEY_RESOURCE_LIST + ":";
//            List<String> keys = MemberIdList.stream().map(MemberId -> keyPrefix + MemberId).collect(Collectors.toList());
//            redisService.del(keys);
//        }
//    }

    @Override
    public UmsMember getMember(String username) {
        String key = REDIS_DATABASE + ":" + REDIS_KEY_Member + ":" + username;
        return (UmsMember) redisService.get(key);
    }

    @Override
    public void setMember(UmsMember Member) {
        String key = REDIS_DATABASE + ":" + REDIS_KEY_Member + ":" + Member.getUsername();
        redisService.set(key, Member, REDIS_EXPIRE);
    }

//    @Override
//    public List<UmsResource> getResourceList(Long MemberId) {
//        String key = REDIS_DATABASE + ":" + REDIS_KEY_RESOURCE_LIST + ":" + MemberId;
//        return (List<UmsResource>) redisService.get(key);
//    }

//    @Override
//    public void setResourceList(Long MemberId, List<UmsResource> resourceList) {
//        String key = REDIS_DATABASE + ":" + REDIS_KEY_RESOURCE_LIST + ":" + MemberId;
//        redisService.set(key, resourceList, REDIS_EXPIRE);
//    }
}

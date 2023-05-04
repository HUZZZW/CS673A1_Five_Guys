package com.tulingxueyuan.mall.controller;

import com.tulingxueyuan.mall.common.api.CommonResult;
import com.tulingxueyuan.mall.common.util.ComConstants;
import com.tulingxueyuan.mall.common.util.JwtTokenUtil;
import com.tulingxueyuan.mall.modules.ums.model.UmsMember;
import com.tulingxueyuan.mall.modules.ums.service.UmsMemberService;
import io.jsonwebtoken.Jwt;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@Api(tags = "UserController", description = " 前台用户服务接口")
@RequestMapping("/user")
public class UserController {

    @Autowired
    UmsMemberService memberService;
    @Autowired
    HttpSession session;
    @Autowired
    JwtTokenUtil jwtTokenUtil;
    @Value("${jwt.tokenHead}")
    private String tokenHead;
    @Value("${jwt.tokenHeader}")
    private String tokenHeader;

    @ApiOperation(value = "用户注册")
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult<UmsMember> register(@Validated @RequestBody UmsMember umsMemberParam) {
        UmsMember umsMember = memberService.register(umsMemberParam);
        if (umsMember == null) {
            return CommonResult.failed();
        }
        return CommonResult.success(umsMember);
    }

    @ApiOperation(value = "登录")
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult login(@Validated UmsMember umsMemberLoginParam) {
        UmsMember login = memberService.login(umsMemberLoginParam.getUsername(), umsMemberLoginParam.getPassword());
        if (login == null) {
            return CommonResult.validateFailed("用户名或密码错误");
        }
        session.setAttribute(ComConstants.FLAG_CURRENT_USER,login);
        // System.out.println(session.getAttribute(ComConstants.FLAG_CURRENT_USER));
        // System.out.println("UmsAdminController session id: " + session.getId());

        String token = jwtTokenUtil.generateUserNameStr(login.getUsername());

        Map<String, String> tokenMap = new HashMap<>();
        tokenMap.put("token", token);
        tokenMap.put("tokenHead", tokenHead);
        tokenMap.put("tokenHeader", tokenHeader);

        // jwt
        return CommonResult.success(tokenMap);
    }
}

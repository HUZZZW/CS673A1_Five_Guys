package com.tulingxueyuan.mall.interceptor;

import cn.hutool.core.util.StrUtil;
import com.tulingxueyuan.mall.common.api.ResultCode;
import com.tulingxueyuan.mall.common.exception.ApiException;
import com.tulingxueyuan.mall.common.util.ComConstants;
import com.tulingxueyuan.mall.common.util.JwtTokenUtil;
import com.tulingxueyuan.mall.modules.ums.model.UmsMember;
//import com.tulingxueyuan.mall.modules.ums.model.UmsResource;
import com.tulingxueyuan.mall.modules.ums.service.UmsMemberService;
import io.netty.util.internal.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Verify whether the user is logged in, menu resource permissions
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {

    // 配置文件中的白名单secure.ignored.urls
    private List<String> urls;

    @Autowired
    private UmsMemberService umsMemberService;
    @Autowired
    private JwtTokenUtil jwtTokenUtil;
    @Value("${jwt.tokenHead}")
    private String tokenHead;
    @Value("${jwt.tokenHeader}")
    private String tokenHeader;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        //Paths that can be accessed without logging in - whitelist
        // Get the current request   /Member/login
        String requestURI = request.getRequestURI();
        //Ant way path matching /**  ？  _
        PathMatcher matcher = new AntPathMatcher();
        for (String ignoredUrl : urls) {
            if(matcher.match(ignoredUrl,requestURI)){
                return  true;
                //If it is a white list, it means that you can access it without logging in
            }
        }


        // get jwt
        String jwt = request.getHeader(tokenHeader);
        //judge whether there is
        //Determine whether tokenHead is added at the beginning
        if (StrUtil.isBlank(jwt)) {
            System.out.println("AuthInterceptor.preHandle: StrUtil.isBlank(jwt)");
            throw new ApiException(ResultCode.UNAUTHORIZED);
        }
        if (!jwt.startsWith(tokenHead)) {
            System.out.println("AuthInterceptor.preHandle: !jwt.startsWith(tokenHead)");
            throw new ApiException(ResultCode.UNAUTHORIZED);
        }
        //decrypt
        jwt = jwt.substring(tokenHead.length());
        String userName = jwtTokenUtil.getUserNameFromToken(jwt);
        if (StrUtil.isBlank(userName)) {
            System.out.println("AuthInterceptor.preHandle: StrUtil.isBlank(userName)");
            throw new ApiException(ResultCode.UNAUTHORIZED);
        }
        //query from the server
        UmsMember umsMember = umsMemberService.getMemberByUsername(userName);
        if (umsMember == null) {
            System.out.println("AuthInterceptor.preHandle: umsMember == null");
            throw new ApiException(ResultCode.UNAUTHORIZED);
        }
        JwtTokenUtil.currentUserName.set(userName);
        return  true;
    }


    public List<String> getUrls() {
        return urls;
    }

    public void setUrls(List<String> urls) {
        this.urls = urls;
    }
}

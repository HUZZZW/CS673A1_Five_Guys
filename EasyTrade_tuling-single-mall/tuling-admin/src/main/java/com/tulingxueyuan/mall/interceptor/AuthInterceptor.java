package com.tulingxueyuan.mall.interceptor;

import com.tulingxueyuan.mall.common.api.ResultCode;
import com.tulingxueyuan.mall.common.exception.ApiException;
import com.tulingxueyuan.mall.common.util.ComConstants;
import com.tulingxueyuan.mall.modules.ums.model.UmsAdmin;
import com.tulingxueyuan.mall.modules.ums.model.UmsResource;
import com.tulingxueyuan.mall.modules.ums.service.UmsAdminService;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Role: Verify whether the user is logged in, menu resource permissions
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {

    // Whitelist: secure.ignored.urls in the configuration file
    private List<String> urls;

    @Autowired
    private UmsAdminService umsAdminService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //1. Paths that can be accessed without logging in - whitelist
        //Get the current request   /admin/login
        String requestURI = request.getRequestURI();
        // Ant way path matching /**  ？  _
        PathMatcher matcher = new AntPathMatcher();
        for (String ignoredUrl : urls) {
            if(matcher.match(ignoredUrl,requestURI)){
                return  true;
            }
        }

        //2. For users who are not logged in, access is directly denied
        if (null == request.getSession().getAttribute(ComConstants.FLAG_CURRENT_USER)) {
            throw new ApiException(ResultCode.UNAUTHORIZED);
        } else {
            //3. Logged in user, determine whether there is resource access permission
            UmsAdmin umsAdmin = (UmsAdmin) request.getSession().getAttribute(ComConstants.FLAG_CURRENT_USER);
            // Get all accessible resources of the user
            List<UmsResource> resourceList = umsAdminService.getResourceList(umsAdmin.getId());
            for (UmsResource umsResource : resourceList) {
                if(matcher.match( umsResource.getUrl(),requestURI)){
                    return  true;
                }
            }
            throw new ApiException(ResultCode.FORBIDDEN);
        }
    }


    public List<String> getUrls() {
        return urls;
    }

    public void setUrls(List<String> urls) {
        this.urls = urls;
    }
}

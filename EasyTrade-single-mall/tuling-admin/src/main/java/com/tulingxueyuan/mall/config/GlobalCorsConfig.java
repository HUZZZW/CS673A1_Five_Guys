package com.tulingxueyuan.mall.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

/**
 * Global cross-domain configuration
 * Created by macro on 2019/7/27.
 */
@Configuration
public class GlobalCorsConfig  {

    /**
     * Filters that allow cross-domain invocation
     */
    @Bean
    public CorsFilter corsFilter() {
        CorsConfiguration config = new CorsConfiguration();
        //Allows all domain names to be called across domains
        config.addAllowedOrigin("*");
        //Allow sending across cookies
        config.setAllowCredentials(true);
        //Release all original headers
        config.addAllowedHeader("*");
        //Allows all request methods to be invoked across domains
        config.addAllowedMethod("*");
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config);
        return new CorsFilter(source);
    }
}

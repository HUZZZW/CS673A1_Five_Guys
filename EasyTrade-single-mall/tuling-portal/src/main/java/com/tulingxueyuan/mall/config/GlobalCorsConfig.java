package com.tulingxueyuan.mall.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

/**
 * Global cross-domain configuration
 */
@Configuration
public class GlobalCorsConfig  {

    /**
     *
     * Filters that allow cross-origin calls
     */
    @Bean
    public CorsFilter corsFilter() {
        CorsConfiguration config = new CorsConfiguration();
        //Allow all domain names to make cross-domain calls
        config.addAllowedOrigin("*");
        //Allow cookies to be sent across
        config.setAllowCredentials(true);
        //Release all original header information
        config.addAllowedHeader("*");
        //Allow all request methods to be called across domains
        config.addAllowedMethod("*");
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config);
        return new CorsFilter(source);
    }
}

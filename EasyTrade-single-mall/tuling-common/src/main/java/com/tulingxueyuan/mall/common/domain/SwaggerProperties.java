package com.tulingxueyuan.mall.common.domain;

import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Swagger Custom configuration
 * Created by macro on 2020/7/16.
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Builder
public class SwaggerProperties {
    /**
     * API Document generation base path
     */
    private String apiBasePackage;
    /**
     * Whether login authentication should be enabled
     */
    private boolean enableSecurity;
    /**
     * Document title
     */
    private String title;
    /**
     * Document Description
     */
    private String description;
    /**
     * Document version
     */
    private String version;
    /**
     * Document contact Name
     */
    private String contactName;
    /**
     * Document Contact URL
     */
    private String contactUrl;
    /**
     * Document Contact Email
     */
    private String contactEmail;
}

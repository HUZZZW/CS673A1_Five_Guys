package com.tulingxueyuan.mall.common.domain;

import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Swagger custom configuration
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Builder
public class SwaggerProperties {
    /**
     *
     * API document generation base path
     */
    private String apiBasePackage;
    /**
     *
     * Do you want to enable login authentication
     */
    private boolean enableSecurity;
    /**
     *
     * document title
     */
    private String title;
    /**
     *
     * document description
     */
    private String description;
    /**
     *
     * document version
     */
    private String version;
    /**
     *
     * Documentation Contact Name
     */
    private String contactName;
    /**
     *
     * Documentation Contact Url
     */
    private String contactUrl;
    /**
     *
     * Document Contact Email
     */
    private String contactEmail;
}

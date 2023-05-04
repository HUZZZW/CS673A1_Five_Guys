package com.tulingxueyuan.mall.common.config;

import com.tulingxueyuan.mall.common.domain.SwaggerProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * Swagger basic configuration
 */
public abstract class BaseSwaggerConfig {

    @Bean
    public Docket createRestApi() {
        SwaggerProperties swaggerProperties = swaggerProperties();
        Docket docket = new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo(swaggerProperties))
                .select()
                .apis(RequestHandlerSelectors.basePackage(swaggerProperties.getApiBasePackage()))
                .paths(PathSelectors.any())
                .build();
        if (swaggerProperties.isEnableSecurity()) {
            docket.securitySchemes(securitySchemes()).securityContexts(securityContexts());
        }
        return docket;
    }

    private ApiInfo apiInfo(SwaggerProperties swaggerProperties) {
        return new ApiInfoBuilder()
                .title(swaggerProperties.getTitle())
                .description(swaggerProperties.getDescription())
                .contact(new Contact(swaggerProperties.getContactName(), swaggerProperties.getContactUrl(), swaggerProperties.getContactEmail()))
                .version(swaggerProperties.getVersion())
                .build();
    }

    /**
     *
     * After the setting is complete, enter SwaggerUI, and the "Authorization" button will appear. Click it to enter the authentication parameters we configured.
     *
     * For interfaces that do not require input parameters (the above-mentioned interfaces that include auth), they can be accessed without entering the Authorization parameter.
     *
     * Configure global parameters through Swagger2's securitySchemes: As shown in the following code, add a parameter named "Authorization" and type "header" to the ApiKey of securitySchemes.
     * @return
     */
    private List<ApiKey> securitySchemes() {
        //设置请求头信息
        List<ApiKey> result = new ArrayList<>();
        ApiKey apiKey = new ApiKey("Authorization", "Authorization", "header");
        result.add(apiKey);
        return result;
    }
    /**
     *
     * Through regular expressions in the securityContexts of Swagger2, set the interface that needs to use parameters (or in other words, remove the interface that does not need to use authentication parameters),
     *
     * As shown in the following code, through PathSelectors.regex("^(?!auth).*$"), all interfaces containing "auth" do not need to use securitySchemes.
     *
     * That is, it is not necessary to use the authentication parameters named "Authorization" and type "header" set above.
     *
     * In layman's terms, the default authentication is used if it can match, and the Authorization authentication parameter in the header is not used.
     */
    private List<SecurityContext> securityContexts() {
        //设置需要登录认证的路径
        List<SecurityContext> result = new ArrayList<>();
        result.add(getContextByPath("/*/.*"));
        return result;
    }

    private SecurityContext getContextByPath(String pathRegex) {
        return SecurityContext.builder()
                .securityReferences(defaultAuth())
                .forPaths(PathSelectors.regex(pathRegex))
                .build();
    }

    private List<SecurityReference> defaultAuth() {
        List<SecurityReference> result = new ArrayList<>();
        AuthorizationScope authorizationScope = new AuthorizationScope("global", "accessEverything");
        AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
        authorizationScopes[0] = authorizationScope;
        result.add(new SecurityReference("Authorization", authorizationScopes));
        return result;
    }

    /**
     * Custom Swagger configuration
     */
    public abstract SwaggerProperties swaggerProperties();
}

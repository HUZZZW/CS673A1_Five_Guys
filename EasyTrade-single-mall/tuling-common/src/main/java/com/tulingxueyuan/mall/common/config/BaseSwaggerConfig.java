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
 * Swagger basic configuration
 * Created by macro on 2020/7/16.
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
     * After setting, enter SwaggerUI, and the "Authorization" button will appear. Click it to enter the authentication parameters we configured
     * For interfaces that do not require input parameters (the interface that contains auth as described above), access is possible without entering Authorization parameters.
     * Configure global parameters through Swagger2's securitySchemes: Add a parameter called "Authorization" with type "header" to the ApiKey of securitySchemes, as shown in the code below.
     * @return
     */
    private List<ApiKey> securitySchemes() {
        //Set the request header
        List<ApiKey> result = new ArrayList<>();
        ApiKey apiKey = new ApiKey("Authorization", "Authorization", "header");
        result.add(apiKey);
        return result;
    }
    /**
     * In Swagger2's securityContexts, set up interfaces that require parameters (or remove interfaces that do not require authentication parameters) using regular expressions in Swagger2's SecurityContexts，
     * As shown in the following code, use PathSelectors.regex("^(? ! auth).*$"), all interfaces that contain "auth" do not need to use securitySchemes
     * That is, the authentication parameter named "Authorization" and type "header" configured in the preceding paragraph do not need to be used.
     * Generally speaking, if it can match, the default authentication will be used, and the Authorization authentication parameter in the header will not be used
     */
    private List<SecurityContext> securityContexts() {
        //Set the path for login authentication
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
     * Customize the Swagger configuration
     */
    public abstract SwaggerProperties swaggerProperties();
}

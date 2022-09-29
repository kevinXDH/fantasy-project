package com.jay.fantasy.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.oas.annotations.EnableOpenApi;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

@Configuration
@EnableOpenApi
public class SpringFoxSwaggerConfig {

    /**
     * 自定义修改Swagger的默认配置信息
     * @return
     */
    @Bean
    public Docket docket(){
        return new Docket(DocumentationType.OAS_30)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.jay.fantasy.controller"))
                .paths(PathSelectors.any())
                .build();
    }

    /**
     * 配置 Swagger 接口文档的基本信息
     * @return
     */
    private ApiInfo apiInfo(){
        return new ApiInfoBuilder()
                .title("Fantasy 接口文档")
                .description("Fantasy 接口文档")
                .version("1.0")
                .contact(new Contact("谢鼎鸿组","","2654153573@qq.com"))
                .license("")
                .licenseUrl("")
                .build();
    }
}



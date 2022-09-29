package com.jay.fantasy.config;
import com.jay.fantasy.intercepter.JwtInterceptor;
import org.springframework.context.annotation.Configuration;

import org.springframework.web.servlet.config.annotation.*;


@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {

    /**
     * 添加静态资源处理器
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/swagger-ui/**").addResourceLocations("classpath:/META-INF/resources/webjars/springfox-swagger-ui/").resourceChain(false);
    }

    /**
     * 添加视图控制器
     * @param registry
     */
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/swagger-ui/").setViewName("/swagger-ui/index.html");
    }

    /**
     * JWT权限拦截器
     */
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        InterceptorRegistration registration = registry.addInterceptor(new JwtInterceptor());
//        registration.addPathPatterns("/user/**");
//        registration.excludePathPatterns(
//                "/user/login",
//                "/user/save"
//        );
//    }

}

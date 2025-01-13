package com.yongoe.pure.common.security;

import cn.dev33.satoken.interceptor.SaInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * satoken拦截器，可以启用satoken的注解鉴权
 *
 * @author yongoe
 * @since 2024/7/4
 */
@Configuration
public class SaTokenConfigure implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new SaInterceptor(handle -> {
                    // 登录拦截，放行白名单
                }))
                .addPathPatterns("/**");
    }
}

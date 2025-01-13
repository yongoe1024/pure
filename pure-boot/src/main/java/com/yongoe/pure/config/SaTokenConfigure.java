package com.yongoe.pure.config;

import cn.dev33.satoken.interceptor.SaInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

/**
 * Sa-Token 配置类 全部放开，注解鉴权
 *
 * @author yongoe
 * @since 2024/7/4
 */

@Configuration
public class SaTokenConfigure implements WebMvcConfigurer {
    @Bean
    public CorsFilter corsFilter() {
        CorsConfiguration corsConfiguration = new CorsConfiguration();
        corsConfiguration.setAllowedOrigins(List.of("http://localhost:3000", "http://127.0.0.1:5173", "http://localhost:5173")); // 设置允许的来源
        corsConfiguration.setAllowedMethods(List.of("*"));     // 设置允许的方法
        corsConfiguration.setAllowedHeaders(List.of("*"));     // 设置允许的头部
        corsConfiguration.setAllowCredentials(true); // 允许携带凭证
        UrlBasedCorsConfigurationSource urlBasedCorsConfigurationSource = new UrlBasedCorsConfigurationSource();
        urlBasedCorsConfigurationSource.registerCorsConfiguration("/**", corsConfiguration);
        return new CorsFilter(urlBasedCorsConfigurationSource);
    }


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new SaInterceptor(handle -> {
                    // 登录拦截，放行白名单
                }))
                .addPathPatterns("/**");
    }

}

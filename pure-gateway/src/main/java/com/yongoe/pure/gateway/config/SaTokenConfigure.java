package com.yongoe.pure.gateway.config;

import cn.dev33.satoken.exception.NotLoginException;
import cn.dev33.satoken.reactor.filter.SaReactorFilter;
import cn.dev33.satoken.router.SaRouter;
import cn.dev33.satoken.stp.StpUtil;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Map;

/**
 * [Sa-Token 权限认证] 配置类
 *
 * @author click33
 */
@Configuration
public class SaTokenConfigure {

    // 注册 Sa-Token全局过滤器
    @Bean
    public SaReactorFilter getSaReactorFilter() {
        SaReactorFilter saReactorFilter = new SaReactorFilter();
        saReactorFilter.addInclude("/**");
        saReactorFilter.addExclude("/favicon.ico", "/auth/login*", "/auth/register", "/auth/captcha");
        saReactorFilter.setAuth(obj -> SaRouter.match("/**", r -> StpUtil.checkLogin()));
        saReactorFilter.setError(e -> {
            if (e instanceof NotLoginException) {
                return Map.of("code", 401, "message", "未登录");
            } else {
                return Map.of("code", 500, "message", e.getMessage());

            }
        });
        return saReactorFilter;
    }

}

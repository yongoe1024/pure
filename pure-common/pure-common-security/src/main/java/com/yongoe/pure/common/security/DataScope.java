package com.yongoe.pure.common.security;

import org.springframework.core.annotation.Order;

import java.lang.annotation.*;

/**
 * 数据权限注解
 * 用于标识需要进行数据权限控制的方法
 *
 * @author yongoe
 * @since 2024/7/29
 */
@Order(1000)
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DataScope {
    /**
     * 权限字符（用于多个角色匹配符合要求的权限，不支持多个权限字符）
     * 例如：@SaCheckPermission("system:dept:query")
     * :@DataScope("system:dept:query")
     */
    String value();

}

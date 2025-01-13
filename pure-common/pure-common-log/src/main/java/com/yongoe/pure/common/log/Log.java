package com.yongoe.pure.common.log;

import java.lang.annotation.*;

/**
 * 操作日志注解
 *
 * @author yongoe
 * @since 2024/7/4
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {

    /**
     * 日志title
     */
    String value() default "";

    /**
     * spel 表达式日志title
     */
    String spel() default "";
}

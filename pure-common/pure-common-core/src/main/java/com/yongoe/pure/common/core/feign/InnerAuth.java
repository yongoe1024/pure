package com.yongoe.pure.common.core.feign;

import java.lang.annotation.*;

/**
 * 只能feign调用的权限
 *
 * @author yongoe
 * @since 2024/7/5
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface InnerAuth {

}
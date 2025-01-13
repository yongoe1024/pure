package com.yongoe.pure.common.core.excel;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * excel导出字典转换注解
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface ExcelDict {

    /**
     * 手动映射的字典值，格式为key，value，多个用逗号分隔
     */
    String[] kv() default {};

    /**
     * 字典code
     */
    String dictCode() default "";

}

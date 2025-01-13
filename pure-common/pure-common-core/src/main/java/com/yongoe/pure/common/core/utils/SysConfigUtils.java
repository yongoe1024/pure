package com.yongoe.pure.common.core.utils;

import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;

/**
 * 系统配置工具
 *
 * @author yongoe
 * @since 2024/8/9
 */
public class SysConfigUtils {

    /**
     * 获取系统配置参数
     */
    public static String getValue(String configKey) {
        CacheManager cacheManager = SpringContextHolder.getBean(CacheManager.class);
        Cache cache = cacheManager.getCache("sys_config");
        String value = cache.get(configKey, String.class);
        if (value == null) {
            throw new IllegalArgumentException("系统配置项[" + configKey + "]不存在");
        }
        return value;
    }
}
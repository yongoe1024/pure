package com.yongoe.pure.common.core.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * 数据权限ThreadLocal工具
 *
 * @author yongoe
 * @since 2023/1/1
 */
public class DataScopeThreadLocal {

    private DataScopeThreadLocal() {
    }

    private static final ThreadLocal<Map<String, Object>> LOCAL = new ThreadLocal<>();

    /**
     * 初始化线程变量，正常是要在拦截器中初始化
     */
    public static void init() {
        HashMap<String, Object> map = new HashMap<>();
        LOCAL.set(map);
    }

    public static void put(String key, Object value) {
        Map<String, Object> map = LOCAL.get();
        if (map == null) {
            return;
        }
        map.put(key, value);
    }

    public static Object get(String key) {
        Map<String, Object> map = LOCAL.get();
        if (map == null) {
            return null;
        }
        return map.get(key);
    }

    public static void remove() {
        LOCAL.remove();
    }
}
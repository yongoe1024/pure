package com.yongoe.pure.common.core.utils;

import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;

import java.util.List;
import java.util.Map;

/**
 * 数据字典工具
 *
 * @author yongoe
 * @since 2024/8/9
 */
public class DictUtils {

    /**
     * 根据字典编码，获取数据字典项
     */
    public static List<Map<String, Object>> getItem(String dictCode) {
        CacheManager cacheManager = SpringContextHolder.getBean(CacheManager.class);
        Cache cache = cacheManager.getCache("sys_dict");
        List<Map<String, Object>> list = (List<Map<String, Object>>) cache.get(dictCode, List.class);
        return list;
    }

    /**
     * 根据lable，获取数据字典项的value
     */
    public static String getValue(String dictCode, String dictLable) {
        List<Map<String, Object>> list = getItem(dictCode);
        for (Map<String, Object> map : list) {
            if (map.get("dictLable").equals(dictLable)) {
                return (String) map.get("dictValue");
            }
        }
        return null;
    }

    /**
     * 根据value，获取数据字典项的lable
     */
    public static String getLable(String dictCode, String dictValue) {
        List<Map<String, Object>> list = getItem(dictCode);
        for (Map<String, Object> map : list) {
            if (map.get("dictValue").equals(dictValue)) {
                return (String) map.get("dictLable");
            }
        }
        return null;
    }
}
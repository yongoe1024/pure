package com.yongoe.pure.common.core.entity;

import lombok.Data;

/**
 * 统一返回类
 *
 * @author yongoe
 * @since 2023/1/1
 */
@Data
public class R<T> {

    int code;
    String message;
    T data;

    public static R<Object> success() {
        R<Object> r = new R<>();
        r.code = 200;
        return r;
    }

    public static R<Object> success(String message) {
        R<Object> r = new R<>();
        r.code = 200;
        r.message = message;
        return r;
    }

    public static <T> R<T> success(String message, T data) {
        R<T> r = new R<>();
        r.code = 200;
        r.message = message;
        r.data = data;
        return r;
    }

    public static R<Object> error() {
        R<Object> r = new R<>();
        r.code = 500;
        r.message = "请求失败";
        return r;
    }

    public static R<Object> error(String message) {
        R<Object> r = new R<>();
        r.code = 500;
        r.message = message;
        return r;
    }

    public static R<Object> error(int code, String message) {
        R<Object> r = new R<>();
        r.code = code;
        r.message = message;
        return r;
    }

    public static <T> R<T> error(int code, String message, T data) {
        R<T> r = new R<>();
        r.code = code;
        r.message = message;
        r.data = data;
        return r;
    }

}

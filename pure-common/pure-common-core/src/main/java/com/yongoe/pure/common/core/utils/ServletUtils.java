package com.yongoe.pure.common.core.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.io.BufferedReader;

/**
 * HttpServlet工具类
 *
 * @author yongoe
 * @since 2023/1/1
 */
@Slf4j
public class ServletUtils {

    /**
     * 从HttpServletRequest的请求体中解析JSON，并封装到指定的JavaBean对象中。
     */
    public static <T> T convertRequestBodyToBean(HttpServletRequest request, Class<T> beanClass) throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        // 读取请求体内容
        StringBuilder jsonStringBuilder = new StringBuilder();
        String line;
        try (BufferedReader bufferedReader = request.getReader()) {
            while ((line = bufferedReader.readLine()) != null) {
                jsonStringBuilder.append(line);
            }
        }
        // 将JSON字符串转换为JavaBean对象
        return objectMapper.readValue(jsonStringBuilder.toString(), beanClass);
    }

    /**
     * 获取request
     */
    public static HttpServletRequest getRequest() {
        ServletRequestAttributes requestAttributes = getRequestAttributes();
        if (requestAttributes == null)
            return null;
        return requestAttributes.getRequest();
    }

    /**
     * 获取response
     */
    public static HttpServletResponse getResponse() {
        ServletRequestAttributes requestAttributes = getRequestAttributes();
        if (requestAttributes == null)
            return null;
        return requestAttributes.getResponse();
    }

    /**
     * 获取session
     */
    public static HttpSession getSession() {
        HttpServletRequest request = getRequest();
        if (request == null)
            return null;
        return request.getSession();
    }

    public static ServletRequestAttributes getRequestAttributes() {
        RequestAttributes attributes = RequestContextHolder.getRequestAttributes();
        return (ServletRequestAttributes) attributes;
    }

}
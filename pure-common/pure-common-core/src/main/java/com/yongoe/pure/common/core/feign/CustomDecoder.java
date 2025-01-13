package com.yongoe.pure.common.core.feign;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yongoe.pure.common.core.entity.R;
import feign.FeignException;
import feign.Response;
import feign.codec.DecodeException;
import feign.codec.Decoder;
import jakarta.annotation.Resource;

import java.io.IOException;
import java.lang.reflect.Type;
import java.nio.charset.StandardCharsets;

/**
 * 自定义解析器
 *
 * @author yongoe
 * @since 2024/7/5
 */
public class CustomDecoder implements Decoder {
    @Resource
    private ObjectMapper objectMapper;

    @Override
    public Object decode(Response response, Type type) throws IOException, FeignException {
        // 判断是否成功
        if (response.status() != 200) {
            throw new DecodeException(response.status(), "Feign服务调用失败", response.request());
        }
        JavaType javaType = objectMapper.getTypeFactory().constructType(type);
        Class<?> clazz = javaType.getRawClass();
        // 判断是否是R类型
        if (!R.class.equals(clazz)) {
            throw new DecodeException(response.status(), "只接受R类型返回值", response.request());
        }
        try {
            return objectMapper.readValue(response.body().asReader(StandardCharsets.UTF_8), javaType);
        } catch (JsonProcessingException e) {
            throw new DecodeException(response.status(), "返回值解码失败", response.request());
        }
    }
}
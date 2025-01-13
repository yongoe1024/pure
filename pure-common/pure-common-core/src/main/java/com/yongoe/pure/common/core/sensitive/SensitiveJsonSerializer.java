package com.yongoe.pure.common.core.sensitive;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.ContextualSerializer;

import java.io.IOException;
import java.util.Objects;

/**
 * 数据脱敏序列化过滤
 *
 * @author yongoe
 * @since 2024/7/4
 */
public class SensitiveJsonSerializer extends JsonSerializer<String> implements ContextualSerializer {
    private SensitiveType desensitizedType;

    @Override
    public void serialize(String value, JsonGenerator jsonGenerator, SerializerProvider serializers) throws IOException {
        //全部脱敏
        jsonGenerator.writeString(desensitizedType.desensitizer().apply(value));
        // 管理员不脱敏
        //if (StpUtil.hasRole("admin")) {
        //    jsonGenerator.writeString(value);
        //} else {
        //    jsonGenerator.writeString(desensitizedType.desensitizer().apply(value));
        //}
    }

    @Override
    public JsonSerializer<?> createContextual(SerializerProvider serializerProvider, BeanProperty beanProperty) throws JsonMappingException {
        Sensitive annotation = beanProperty.getAnnotation(Sensitive.class);
        if (Objects.nonNull(annotation) && Objects.equals(String.class, beanProperty.getType().getRawClass())) {
            this.desensitizedType = annotation.value();
            return this;
        }
        return serializerProvider.findValueSerializer(beanProperty.getType(), beanProperty);
    }
}

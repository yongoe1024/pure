package com.yongoe.pure.common.core.excel;

import com.alibaba.excel.converters.Converter;
import com.alibaba.excel.converters.ReadConverterContext;
import com.alibaba.excel.converters.WriteConverterContext;
import com.alibaba.excel.enums.CellDataTypeEnum;
import com.alibaba.excel.metadata.data.WriteCellData;
import com.yongoe.pure.common.core.utils.DictUtils;
import com.yongoe.pure.common.core.utils.StringUtils;

import java.lang.annotation.Annotation;
import java.util.Objects;

/**
 * Excel Converter字典转换器
 */
public class ExcelDictConverter implements Converter<String> {
    @Override
    public Class<?> supportJavaTypeKey() {
        return String.class;
    }

    @Override
    public CellDataTypeEnum supportExcelTypeKey() {
        return CellDataTypeEnum.STRING;
    }

    /**
     * 这里读的时候会调用
     */
    @Override
    public String convertToJavaData(ReadConverterContext<?> context) {
        String value = context.getReadCellData().getStringValue();
        Annotation[] annotations = context.getContentProperty().getField().getAnnotations();
        for (Annotation annotation : annotations) {
            if (annotation instanceof ExcelDict excelDict) {
                // 从注解中获取值
                if (excelDict.kv().length > 0 && excelDict.kv().length % 2 == 0) {
                    // 自定义键值对
                    String[] kv = excelDict.kv();
                    for (int i = 0; i < kv.length; i += 2) {
                        if (value.equals(kv[i])) {
                            return kv[i + 1];
                        }
                    }
                    return null;
                } else if (StringUtils.isNotEmpty(excelDict.dictCode())) {
                    // 从缓存中得到字典数据
                    return DictUtils.getValue(excelDict.dictCode(), value);
                }
            }
        }
        return value;
    }

    /**
     * 这里是写的时候会调用 不用管
     */
    @Override
    public WriteCellData<?> convertToExcelData(WriteConverterContext<String> context) {
        String value = context.getValue();
        Annotation[] annotations = context.getContentProperty().getField().getAnnotations();
        for (Annotation annotation : annotations) {
            if (annotation instanceof ExcelDict excelDict) {
                // 从注解中获取值
                if (excelDict.kv().length > 0 && excelDict.kv().length % 2 == 0) {
                    // 自定义键值对
                    String[] kv = excelDict.kv();
                    for (int i = 0; i < kv.length; i += 2) {
                        if (value.equals(kv[i + 1])) {
                            // 找到了对应的键
                            return new WriteCellData<>(kv[i]);
                        }
                    }
                    return new WriteCellData<>("");
                } else if (StringUtils.isNotEmpty(excelDict.dictCode())) {
                    String lable = DictUtils.getLable(excelDict.dictCode(), value);
                    return new WriteCellData<>(Objects.requireNonNullElse(lable, ""));
                }
            }
        }
        return new WriteCellData<>(value);
    }
}

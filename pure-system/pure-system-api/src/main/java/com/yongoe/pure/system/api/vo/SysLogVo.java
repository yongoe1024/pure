package com.yongoe.pure.system.api.vo;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.format.DateTimeFormat;
import com.yongoe.pure.common.core.excel.ExcelDict;
import com.yongoe.pure.common.core.excel.ExcelDictConverter;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 日志管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysLogVo {

    /**
     * 编号
     */
    private Long id;
    /**
     * 日志类型(0正常 1异常)
     */
    @ExcelProperty(value = "日志类型", converter = ExcelDictConverter.class)
    @ExcelDict(kv = {"正常", "0", "异常", "1",})
    private String logType;

    /**
     * 日志标题
     */
    @ExcelProperty(value = "日志标题")
    private String title;
    /**
     * IP地址
     */
    @ExcelProperty(value = "IP地址")
    private String ip;
    /**
     * 操作地址
     */
    @ExcelProperty(value = "操作地址")
    private String address;
    /**
     * 设备
     */
    @ExcelProperty(value = "设备")
    private String os;
    /**
     * 请求人
     */
    @ExcelProperty(value = "请求人")
    private String uservalue;
    /**
     * 请求方法
     */
    @ExcelProperty(value = "请求方法")
    private String method;
    /**
     * 请求参数
     */
    @ExcelProperty(value = "请求参数")
    private String params;
    /**
     * 执行时间(ms)
     */
    @ExcelProperty(value = "执行时间(ms)")
    private Long time;
    /**
     * 异常信息
     */
    @ExcelProperty(value = "异常信息")
    private String exception;
    /**
     * 创建时间
     */
    @ExcelProperty(value = "创建时间")
    @DateTimeFormat("yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;
}
package com.yongoe.pure.system.api.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

/**
 * 日志管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysLogDto {

    /**
     * 日志类型(0正常 1异常)
     */
    @NotBlank
    @Pattern(regexp = "^[01]$", message = "只能是0或1")
    private String logType;

    /**
     * 日志标题
     */
    @NotBlank
    private String title;

    /**
     * IP地址
     */
    private String ip;
    /**
     * 操作地址
     */
    private String address;

    /**
     * 设备
     */
    private String os;

    /**
     * 请求方法
     */
    private String method;
    /**
     * 请求人
     */
    private String username;
    /**
     * 请求参数
     */
    private String params;

    /**
     * 执行时间(ms)
     */
    private Long time;

    /**
     * 异常信息
     */
    private String exception;

}
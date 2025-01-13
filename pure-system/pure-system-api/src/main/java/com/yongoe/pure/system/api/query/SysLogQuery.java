package com.yongoe.pure.system.api.query;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * 日志管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysLogQuery {
    /**
     * 日志类型(0正常 1异常)
     */
    private String logType;
    /**
     * 日志标题
     */
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
     * 请求人
     */
    private String username;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;
}
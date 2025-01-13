package com.yongoe.pure.system.api.query;

import lombok.Data;

/**
 * 系统参数
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysConfigQuery {

    /**
     * 参数主键
     */
    private Long configId;
    /**
     * 参数名称
     */
    private String configName;
    /**
     * 参数键名
     */
    private String configKey;
    /**
     * 系统内置（1是 0否）
     */
    private String configType;
}
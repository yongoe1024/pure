package com.yongoe.pure.system.api.vo;

import lombok.Data;

/**
 * 系统参数
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysConfigVo {

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
     * 参数键值
     */
    private String configValue;
    /**
     * 系统内置（1是 0否）
     */
    private String configType;
    /**
     * 备注
     */
    private String remark;
}
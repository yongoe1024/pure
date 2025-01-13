package com.yongoe.pure.system.api.query;

import lombok.Data;

/**
 * 字典管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysDictQuery {

    /**
     * 字典名称
     */
    private String dictName;
    /**
     * 字典编码
     */
    private String dictCode;
}
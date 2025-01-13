package com.yongoe.pure.system.api.query;

import lombok.Data;

/**
 * 岗位管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysPostQuery {
    /**
     * 岗位编码
     */
    private String postCode;
    /**
     * 岗位名称
     */
    private String postName;
}
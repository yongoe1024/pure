package com.yongoe.pure.system.api.vo;

import lombok.Data;

/**
 * 岗位管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysPostVo {

    /**
     * 岗位ID
     */
    private Long postId;
    /**
     * 岗位编码
     */
    private String postCode;
    /**
     * 岗位名称
     */
    private String postName;
    /**
     * 岗位排序
     */
    private Integer postSort;
    /**
     * 备注
     */
    private String remark;
}
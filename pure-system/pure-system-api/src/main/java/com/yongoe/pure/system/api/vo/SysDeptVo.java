package com.yongoe.pure.system.api.vo;

import lombok.Data;

/**
 * 部门管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysDeptVo {

    /**
     * 部门id
     */
    private Long deptId;
    /**
     * 父部门id
     */
    private Long parentId;
    /**
     * 部门名称
     */
    private String deptName;
    /**
     * 显示顺序
     */
    private Integer orderNum;
    /**
     * 祖级列表
     */
    private String ancestors;
}
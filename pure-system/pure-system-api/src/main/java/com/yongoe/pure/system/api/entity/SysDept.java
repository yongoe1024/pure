package com.yongoe.pure.system.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.yongoe.pure.system.api.dto.SysDeptDto;
import com.yongoe.pure.system.api.query.SysDeptQuery;
import com.yongoe.pure.system.api.vo.SysDeptVo;
import io.github.linpeilie.annotations.AutoMapper;
import io.github.linpeilie.annotations.AutoMappers;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 部门管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@AutoMappers({
        @AutoMapper(target = SysDeptDto.class),
        @AutoMapper(target = SysDeptVo.class),
        @AutoMapper(target = SysDeptQuery.class)
})
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_dept")
public class SysDept {

    /**
     * 部门id
     */
    @TableId(type = IdType.AUTO)
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
    /**
     * 创建者
     */
    @TableField(fill = FieldFill.INSERT)
    private String createBy;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 更新者
     */
    @TableField(fill = FieldFill.UPDATE)
    private String updateBy;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.UPDATE)
    private LocalDateTime updateTime;

    /**
     * 删除标志
     */
    @TableLogic
    private String delFlag;
}
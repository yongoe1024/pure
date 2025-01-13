package com.yongoe.pure.gen.entity;

import com.baomidou.mybatisplus.annotation.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 代码生成业务表
 *
 * @author yongoe
 * @since 2024/08/01
 */
@Data
@Builder
@TableName("gen_table")
public class GenTable {

    /**
     * 编号
     */
    @NotNull
    @TableId(type = IdType.AUTO)
    private Long tableId;

    /**
     * 表名称：下划线分隔的写法
     */
    @NotBlank
    private String tableName;

    /**
     * 表描述，用不到
     */
    @NotBlank
    private String tableComment;

    /**
     * 关联子表的表名：预留字段
     */
    private String subTableName;

    /**
     * 子表关联的外键名：预留字段
     */
    private String subTableFkName;

    /**
     * 实体类名称：首字母大写，驼峰式命名
     */
    @NotBlank
    private String entityName;

    /**
     * 生成类别（crud单表操作 tree树表操作）
     */
    @Pattern(regexp = "^(crud|tree)$", message = "只能是crud或tree")
    @NotBlank
    private String genCategory;

    /**
     * maven模块
     */
    @NotBlank
    private String mavenModuleName;

    /**
     * 生成模块类型（single、multiple）
     */
    @NotBlank
    @Pattern(regexp = "^(single|multiple)$", message = "只能是single、multiple")
    private String genModuleType;

    /**
     * 包路径（模块名结尾）
     */
    @NotBlank
    private String packageName;

    /**
     * 模块名
     */
    @NotBlank
    private String moduleName;

    /**
     * 业务名（接口路径&前端文件夹）
     */
    @NotBlank
    private String businessName;

    /**
     * 业务名（中文）
     */
    @NotBlank
    private String businessNameZh;

    /**
     * 上级菜单ID
     */
    @NotNull
    private Long menuParentId;
    /**
     * 作者
     */
    @NotBlank
    private String author;

    /**
     * 其它生成选项
     */
    private String options;

    /**
     * 备注
     */
    private String remark;

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
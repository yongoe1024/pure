package com.yongoe.pure.gen.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.yongoe.pure.gen.constant.GenConstant;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 代码生成业务表字段
 *
 * @author yongoe
 * @since 2024/08/01
 */
@Data
@Builder
@TableName("gen_table_column")
public class GenTableColumn {

    public static GenTableColumn create() {
        return GenTableColumn.builder()
                .isRequired(GenConstant.YES)
                .isInsert(GenConstant.YES)
                .isEdit(GenConstant.YES)
                .isList(GenConstant.YES)
                .isQuery(GenConstant.YES)
                .queryType(GenConstant.EQ)
                .htmlType(GenConstant.input)
                .sort(1)
                .build();
    }

    /**
     * 编号
     */
    @NotNull
    @TableId(type = IdType.AUTO)
    private Long columnId;

    /**
     * 归属表编号
     */
    @NotNull
    private Long tableId;

    /**
     * 列名称
     */
    @NotBlank
    private String columnName;

    /**
     * 列描述
     */
    @NotBlank
    private String columnComment;

    /**
     * 列类型
     */
    @NotBlank
    private String columnType;

    /**
     * JAVA类型
     */
    @NotBlank
    private String javaType;

    /**
     * JAVA字段名
     */
    @NotBlank
    private String javaField;

    /**
     * java包导入路径
     */
    private String javaImport;

    /**
     * 是否主键（1是）
     */
    @NotBlank
    @Pattern(regexp = "^[01]$", message = "只能填0或1")
    private String isPk;

    /**
     * 是否自增（1是）
     */
    @NotBlank
    @Pattern(regexp = "^[01]$", message = "只能填0或1")
    private String isIncrement;

    /**
     * 是否必填（1是）表单校验
     */
    @NotBlank
    @Pattern(regexp = "^[01]$", message = "只能填0或1")
    private String isRequired;

    /**
     * 是否为插入字段（1是）Form表单
     */
    @NotBlank
    @Pattern(regexp = "^[01]$", message = "只能填0或1")
    private String isInsert;

    /**
     * 是否编辑字段（1是） Form表单
     */
    @NotBlank
    @Pattern(regexp = "^[01]$", message = "只能填0或1")
    private String isEdit;

    /**
     * 是否列表字段（1是） Table列表
     */
    @NotBlank
    @Pattern(regexp = "^[01]$", message = "只能填0或1")
    private String isList;

    /**
     * 是否查询字段（1是） Query表单
     */
    @NotBlank
    @Pattern(regexp = "^[01]$", message = "只能填0或1")
    private String isQuery;

    /**
     * 查询方式
     */
    @NotBlank
    @Pattern(regexp = "^(?:=|!=|>|>=|<|<=|LIKE|BETWEEN)$\n", message = "填写错误")
    private String queryType;

    /**
     * 显示类型
     */
    @NotBlank
    @Pattern(regexp = "^(文本框|文本域|下拉框|复选框|单选框|日期|日期时间|时间|图片上传|文件上传|富文本)$", message = "填写错误")
    private String htmlType;

    /**
     * 字典类型
     */
    private String dictCode;

    /**
     * 排序
     */
    @NotNull
    private Integer sort;

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
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateBy;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    /**
     * 删除标志
     */
    @TableLogic
    private String delFlag;

}
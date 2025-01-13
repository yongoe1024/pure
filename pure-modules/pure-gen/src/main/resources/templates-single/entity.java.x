package ${packageName}.entity;

import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

<#list javaImport as pkg>
import ${pkg};
</#list>

/**
 * ${comment}
 *
 * @author ${author}
 * @since ${date}
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("${tableName}")
public class ${Entity} extends Model<${Entity}> {

<#-- ----------  BEGIN 字段循环遍历  ---------->
<#list columns as field>
    /**
     * ${field.columnComment}
     */
<#if field.isPk=="1">
<#if field.isIncrement=="1">
    @TableId(type = IdType.AUTO)
    <#elseif field.javaType=="Long">
    @TableId(type = IdType.ASSIGN_ID)
<#elseif field.propertyType=="String">
    @TableId(type = IdType.ASSIGN_UUID)
</#if>
</#if>
<#if field.javaField=="createTime" || field.javaField=="createBy">
    @TableField(fill = FieldFill.INSERT)
<#elseif field.javaField=="updateTime" || field.javaField=="updateBy">
    @TableField(fill = FieldFill.UPDATE)
<#elseif field.javaField=="delFlag">
    @TableLogic
<#else>
    @ExcelProperty(value = "${field.columnComment}")
</#if>
    private ${field.javaType} ${field.javaField};

</#list>
<#------------  END 字段循环遍历  ---------->
}
package ${apiPackageName}.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
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
public class ${Entity} {

<#-- ----------  BEGIN 字段循环遍历  ---------->
<#list columns as field>
<#if field.isQuery=="1" || field.isPk=="1">
    /**
     * ${field.columnComment}
     */
    private ${field.javaType} ${field.javaField};
</#if>
</#list>
<#------------  END 字段循环遍历  ---------->
}
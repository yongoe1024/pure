package ${apiPackageName}.dto;

import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.annotation.Update;
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
<#if field.isInsert=="1" || field.isPk=="1">
    /**
     * ${field.columnComment}
     */
    <#if field.isPk=="1">
    @Null(groups = {Create.class})
    @NotNull(groups = {Update.class})
    </#if>
    private ${field.javaType} ${field.javaField};
</#if>
</#list>
<#------------  END 字段循环遍历  ---------->
}
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${packageName}.mapper.${Entity}Mapper">

    <!--获取分页数据-->
    <select id="selectByPage" resultType="${packageName}.entity.${Entity}">
        select *
        from  ${tableName}
        <where>
 <#list columns as field>
 <#if field.isQuery == '1' || field.isPk == '1'>
 <#if field.queryType == '='>
             <if test="null != ${entity}.${field.javaField}<#if field.javaType=="String"> and ''!=${entity}.${field.javaField}</#if>">
                 and ${field.columnName} = ${r'#{'}${entity}.${field.javaField}${r'}'}
             </if>
 <#elseif field.queryType == 'LIKE'>
             <if test="null != ${entity}.${field.javaField}<#if field.javaType=="String"> and ''!=${entity}.${field.javaField}</#if>">
                 and ${field.columnName} = LIKE CONCAT('%',${r'#{'}${entity}.${field.javaField}${r'}'},'%')
             </if>
 <#elseif field.queryType == '!='>
             <if test="null != ${entity}.${field.javaField}<#if field.javaType=="String"> and ''!=${entity}.${field.javaField}</#if>">
                 and ${field.columnName} != ${r'#{'}${entity}.${field.javaField}${r'}'}
             </if>
 <#elseif field.queryType == 'BETWEEN'>
             <if test="null != ${entity}.${field.javaField}">
                 and ${field.columnName} = ${r'#{'}${entity}.${field.javaField}${r'}'}
             </if>
 <#elseif field.queryType == '>'>
             <if test="null != ${entity}.${field.javaField}">
                 and ${field.columnName}  &gt; ${r'#{'}${entity}.${field.javaField}${r'}'}
             </if>
 <#elseif field.queryType == '>='>
             <if test="null != ${entity}.${field.javaField}">
                 and ${field.columnName}  &gt;= ${r'#{'}${entity}.${field.javaField}${r'}'}
             </if>
 <#elseif field.queryType == '<'>
             <if test="null != ${entity}.${field.javaField}">
                 and ${field.columnName} &lt; ${r'#{'}${entity}.${field.javaField}${r'}'}
             </if>
 <#elseif field.queryType == '<='>
             <if test="null != ${entity}.${field.javaField}">
                 and ${field.columnName} &lt;= ${r'#{'}${entity}.${field.javaField}${r'}'}
             </if>
 </#if>
 </#if>
 </#list>
         </where>
    </select>

</mapper>
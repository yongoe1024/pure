package com.yongoe.pure.gen.entity;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Builder;
import lombok.Data;

/**
 * 生成新模块配置表单
 *
 * @author yongoe
 * @since 2024/7/31
 */
@Data
@Builder
public class MavenModule {

    /**
     * maven模块
     */
    @NotBlank
    private String mavenModuleName;

    /**
     * maven模块端口
     */
    @NotBlank
    @Pattern(regexp = "^\\d+$", message = "只能是数字")
    private String port;

    /**
     * maven模块描述
     */
    @NotBlank
    private String description;

    /**
     * 生成maven模块类型（single、multiple）
     * single：单模块
     * multiple：api+biz模块
     */
    @NotBlank
    @Pattern(regexp = "^(single|multiple)$", message = "只能是single、multiple")
    private String genModuleType;

    /**
     * 模块名
     */
    @NotBlank
    private String moduleName;

    /**
     * 完整包路径 例：com.yongoe.pure.emp，结尾必须是moduleName
     */
    @NotBlank
    private String packageName;


}
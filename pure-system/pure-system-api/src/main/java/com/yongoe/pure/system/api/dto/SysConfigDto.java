package com.yongoe.pure.system.api.dto;

import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.annotation.Update;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Null;
import jakarta.validation.constraints.Pattern;
import lombok.Data;


/**
 * 系统参数
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysConfigDto {

    /**
     * 参数主键
     */
    @Null(groups = {Create.class})
    @NotNull(groups = {Update.class})
    private Long configId;

    /**
     * 参数名称
     */
    @NotBlank
    private String configName;

    /**
     * 参数键名
     */
    @NotBlank
    private String configKey;

    /**
     * 参数键值
     */
    @NotBlank
    private String configValue;

    /**
     * 系统内置（1是 0否）
     */
    @NotBlank
    @Pattern(regexp = "^[01]$", message = "只能是0或1")
    private String configType;

    /**
     * 备注
     */
    private String remark;

}
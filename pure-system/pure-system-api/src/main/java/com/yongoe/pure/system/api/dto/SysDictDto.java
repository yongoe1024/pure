package com.yongoe.pure.system.api.dto;

import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.annotation.Update;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Null;
import lombok.Data;


/**
 * 字典管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysDictDto {

    /**
     * 字典主键
     */
    @Null(groups = {Create.class})
    @NotNull(groups = {Update.class})
    private Long dictId;

    /**
     * 字典名称
     */
    @NotBlank
    private String dictName;

    /**
     * 字典编码
     */
    @NotBlank
    private String dictCode;

    /**
     * 备注
     */
    private String remark;

}
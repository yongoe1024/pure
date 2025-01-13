package com.yongoe.pure.system.api.dto;

import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.annotation.Update;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Null;
import lombok.Data;


/**
 * 字典项
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysDictItemDto {

    /**
     * 编号
     */
    @Null(groups = {Create.class})
    @NotNull(groups = {Update.class})
    private Long id;

    /**
     * 字典ID
     */
    @NotNull
    private Long dictId;

    /**
     * 字典标签
     */
    @NotBlank
    private String dictLabel;

    /**
     * 字典键值
     */
    @NotBlank
    private String dictValue;

    /**
     * 字典排序
     */
    @NotNull
    private Integer orderNum;

    /**
     * 回显样式
     */
    private String style;

    /**
     * 备注
     */
    private String remark;

}
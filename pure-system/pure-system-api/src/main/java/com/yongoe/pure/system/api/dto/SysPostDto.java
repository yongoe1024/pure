package com.yongoe.pure.system.api.dto;

import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.annotation.Update;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Null;
import lombok.Data;


/**
 * 岗位管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysPostDto {

    /**
     * 岗位ID
     */
    @Null(groups = {Create.class})
    @NotNull(groups = {Update.class})
    private Long postId;

    /**
     * 岗位编码
     */
    @NotBlank
    private String postCode;

    /**
     * 岗位名称
     */
    @NotBlank
    private String postName;

    /**
     * 岗位排序
     */
    @NotNull
    private Integer postSort;

    /**
     * 备注
     */
    private String remark;

}
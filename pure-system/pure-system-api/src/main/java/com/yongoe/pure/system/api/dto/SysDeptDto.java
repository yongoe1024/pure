package com.yongoe.pure.system.api.dto;

import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.annotation.Update;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Null;
import lombok.Data;

/**
 * 部门管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysDeptDto {

    /**
     * 部门id
     */
    @Null(groups = {Create.class})
    @NotNull(groups = {Update.class})
    private Long deptId;

    /**
     * 父部门id
     */
    @NotNull
    private Long parentId;

    /**
     * 部门名称
     */
    @NotBlank
    private String deptName;

    /**
     * 显示顺序
     */
    @NotNull
    private Integer orderNum;

}
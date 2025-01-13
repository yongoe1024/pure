package com.yongoe.pure.system.api.dto;

import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.annotation.Update;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Null;
import jakarta.validation.constraints.Pattern;
import lombok.Data;


/**
 * 角色管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysRoleDto {

    /**
     * 角色ID
     */
    @Null(groups = {Create.class})
    @NotNull(groups = {Update.class})
    private Long roleId;

    /**
     * 角色名称
     */
    @NotBlank
    private String roleName;

    /**
     * 角色权限字符
     */
    @NotBlank
    private String roleCode;

    /**
     * 数据范围(默认0 全部数据)
     */
    @NotBlank
    @Pattern(regexp = "^[01234]$", message = "只能是0,1,2,3,4")
    private String dataScope;

    /**
     * 备注
     */
    private String remark;

}
package com.yongoe.pure.system.api.dto;

import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.annotation.Update;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Null;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * 用户管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysUserDto {
    /**
     * 添加修改岗位所用
     */
    private List<Long> postIds;

    /**
     * 添加修改角色所用
     */
    private List<Long> roleIds;

    /**
     * 用户ID
     */
    @Null(groups = {Create.class})
    @NotNull(groups = {Update.class})
    private Long userId;

    /**
     * 部门ID
     */
    private Long deptId;

    @NotBlank
    private String username;

    /**
     * 昵称 --添加修改时必填
     */
    @NotBlank
    private String nickname;

    /**
     * 帐号状态（1正常 0停用）
     */
    @NotBlank
    @Pattern(regexp = "^[01]$", message = "只能是0,1")
    private String status;

    /**
     * 姓名 --添加修改时必填
     */
    private String name;

    /**
     * 用户性别（0男 1女 2未知）
     */
    @Pattern(regexp = "^[012]$", message = "性别只能是0,1,2")
    private String sex;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 电话号码
     */
    private String phone;

    /**
     * 头像
     */
    private String avatar;

    /**
     * 备注
     */
    private String remark;

    /**
     * 用户额外数据
     */
    private Map<String, Object> userExtraData;
}
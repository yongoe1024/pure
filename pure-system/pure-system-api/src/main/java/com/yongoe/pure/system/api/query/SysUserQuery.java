package com.yongoe.pure.system.api.query;

import lombok.Data;

import java.util.Map;

/**
 * 用户管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysUserQuery {

    /**
     * 部门ID
     */
    private Long deptId;
    /**
     * 账号
     */
    private String username;
    /**
     * 昵称
     */
    private String nickname;
    /**
     * 姓名
     */
    private String name;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 电话号码
     */
    private String phone;
    /**
     * 用户性别（0男 1女 2未知）
     */
    private String sex;
    /**
     * 帐号状态（1正常 0停用）
     */
    private String status;
}
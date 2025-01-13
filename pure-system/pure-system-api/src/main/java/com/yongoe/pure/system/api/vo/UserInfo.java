package com.yongoe.pure.system.api.vo;

import com.yongoe.pure.common.core.sensitive.Sensitive;
import com.yongoe.pure.common.core.sensitive.SensitiveType;
import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * 用户信息
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class UserInfo {
    /**
     * 角色集合
     */
    private List<SysRoleVo> roles;
    /**
     * 岗位集合
     */
    private List<SysPostVo> posts;
    /**
     * 用户ID
     */
    private Long userId;
    /**
     * 部门ID
     */
    private Long deptId;
    /**
     * 部门name
     */
    private String deptName;
    /**
     * 账号
     */
    protected String username;
    /**
     * 密码
     */
    @Sensitive(SensitiveType.PASSWORD)
    private String password;
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
     * 头像
     */
    private String avatar;
    /**
     * 帐号状态（1正常 0停用）
     */
    private String status;
    /**
     * 备注
     */
    private String remark;
    /**
     * 用户额外数据
     */
    private Map<String, Object> userExtraData;
}
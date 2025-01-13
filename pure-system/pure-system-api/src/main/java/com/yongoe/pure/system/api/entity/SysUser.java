package com.yongoe.pure.system.api.entity;

import cn.dev33.satoken.secure.SaSecureUtil;
import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import com.yongoe.pure.system.api.dto.RegisterDto;
import com.yongoe.pure.system.api.dto.SysUserDto;
import com.yongoe.pure.system.api.query.SysUserQuery;
import com.yongoe.pure.system.api.vo.UserInfo;
import io.github.linpeilie.annotations.AutoMapper;
import io.github.linpeilie.annotations.AutoMappers;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@AutoMappers({
        @AutoMapper(target = RegisterDto.class),
        @AutoMapper(target = SysUserDto.class),
        @AutoMapper(target = UserInfo.class),
        @AutoMapper(target = SysUserQuery.class)
})
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@TableName("sys_user")
public class SysUser {

    /**
     * 创建user，将密码加密
     */
    public static SysUser createUser(String username, String password, String nickname) {
        return SysUser.builder()
                .username(username)
                .password(SaSecureUtil.sha1(password))
                .nickname(nickname)
                .status("1")
                .userExtraData(new HashMap<>())
                .build();
    }

    /**
     * 用户ID
     */
    @TableId(type = IdType.AUTO)
    private Long userId;

    /**
     * 部门ID
     */
    private Long deptId;

    /**
     * 账号
     */
    private String username;

    /**
     * 密码
     */
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

    @TableField(typeHandler = JacksonTypeHandler.class)
    private Map<String, Object> userExtraData;

    /**
     * 备注
     */
    private String remark;

    /**
     * 创建人
     */
    @TableField(fill = FieldFill.INSERT)
    private String createBy;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 修改人
     */
    @TableField(fill = FieldFill.UPDATE)
    private String updateBy;

    /**
     * 修改时间
     */
    @TableField(fill = FieldFill.UPDATE)
    private LocalDateTime updateTime;

    /**
     * 删除标记
     */
    @TableLogic
    private String delFlag;
}
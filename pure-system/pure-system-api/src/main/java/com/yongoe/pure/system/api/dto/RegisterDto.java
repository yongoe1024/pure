package com.yongoe.pure.system.api.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

/**
 * 注册信息
 *
 * @author yongoe
 * @since 2024/7/5
 */
@Data
public class RegisterDto {

    /**
     * 账号
     */
    @NotBlank
    private String username;

    /**
     * 密码
     */
    @NotBlank
    private String password;

    /**
     * 昵称
     */
    @NotBlank
    private String nickname;

}
package com.yongoe.pure.system.api.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * 登录信息
 *
 * @author yongoe
 * @since 2024/7/5
 */
@Data
public class LoginDto {

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

}
package com.yongoe.pure.auth.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.yongoe.pure.common.core.entity.R;
import com.yongoe.pure.common.log.Log;
import com.yongoe.pure.system.api.dto.LoginDto;
import com.yongoe.pure.system.api.dto.RegisterDto;
import com.yongoe.pure.system.api.feign.RemoteLoginService;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 登录接口
 *
 * @author yongoe
 * @since 2024/7/4
 */
@RestController
@RequestMapping("/auth")
public class LoginController {
    @Resource
    RemoteLoginService service;

    @Log(spel = "'登录' + #login.getUsername()")
    @PostMapping("/login")
    public R loginPC(@Validated @RequestBody LoginDto login) {
        return service.login(login);
    }

    @Log("退出登录")
    @DeleteMapping("logout")
    public R logout() {
        StpUtil.logout();
        return R.success("退出登录");
    }

    @Log(spel = "'注册' + #register.getUsername()")
    @PostMapping("/register")
    public R register(@Validated @RequestBody RegisterDto register) {
        return service.register(register);
    }

}

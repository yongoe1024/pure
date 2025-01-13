package com.yongoe.pure.system.controller;

import cn.dev33.satoken.secure.SaSecureUtil;
import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.yongoe.pure.common.core.entity.R;
import com.yongoe.pure.common.core.feign.InnerAuth;
import com.yongoe.pure.common.core.utils.SysConfigUtils;
import com.yongoe.pure.common.security.UserUtils;
import com.yongoe.pure.system.api.dto.LoginDto;
import com.yongoe.pure.system.api.dto.RegisterDto;
import com.yongoe.pure.system.api.entity.SysRole;
import com.yongoe.pure.system.api.entity.SysUser;
import com.yongoe.pure.system.api.vo.UserInfo;
import com.yongoe.pure.system.service.SysRoleService;
import com.yongoe.pure.system.service.SysUserService;
import jakarta.annotation.Resource;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * 系统账户：登录注册
 *
 * @author yongoe
 * @since 2024/10/18
 */
@RestController
@RequestMapping("/system")
public class SysLoginController {
    @Resource
    private SysUserService sysUserService;
    @Resource
    private SysRoleService sysRoleService;

    /**
     * feign调用注册
     */
    @InnerAuth
    @PostMapping("/register")
    @Transactional(rollbackFor = Exception.class)
    public R<Void> feignRegister(@Validated @RequestBody RegisterDto register) {
        // 判断是否开启注册功能
        String isRegister = SysConfigUtils.getValue("sys.account.register");
        if (!"true".equals(isRegister)) {
            return R.error(500, "当前系统没有开启注册功能！", null);
        }
        // 判断用户名是否存在
        long count = sysUserService.count(new LambdaQueryWrapper<SysUser>().eq(SysUser::getUsername, register.getUsername()));
        if (count > 0) {
            return R.error(500, "用户名已存在", null);
        }
        SysUser newUser = SysUser.createUser(register.getUsername(), register.getPassword(), register.getNickname());
        // 获取默认角色id
        String code = SysConfigUtils.getValue("sys.account.defaultRoleCode");
        SysRole sysRole = sysRoleService.getOne(new LambdaQueryWrapper<SysRole>()
                .eq(SysRole::getRoleCode, code));
        Long roleId = sysRole.getRoleId();
        //先保存用户，拿到id后，保存 用户-角色
        sysUserService.save(newUser);
        sysUserService.updateUserRole(newUser.getUserId(), List.of(roleId));
        return R.success("注册成功", null);

    }

    /**
     * feign调用登录
     */
    @InnerAuth
    @PostMapping("/login")
    public R<String> feignLogin(@Validated @RequestBody LoginDto login) {
        UserInfo user = sysUserService.getUserInfoByUsername(login.getUsername());
        if (user == null) {
            return R.error(500, "用户不存在", null);
        }
        String sha1 = SaSecureUtil.sha1(login.getPassword());
        if (!user.getPassword().equals(sha1)) {
            return R.error(500, "密码错误", null);
        }
        if ("0".equals(user.getStatus())) {
            return R.error(500, "账号已被停用", null);
        }
        StpUtil.login(login.getUsername());
        UserUtils.setUserInfo(user);
        return R.success(null,  UserUtils.getTokenValue());
    }
}
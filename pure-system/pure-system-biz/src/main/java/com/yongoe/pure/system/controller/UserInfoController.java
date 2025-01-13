package com.yongoe.pure.system.controller;

import cn.dev33.satoken.secure.SaSecureUtil;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.yongoe.pure.common.core.entity.R;
import com.yongoe.pure.common.core.utils.StringUtils;
import com.yongoe.pure.common.log.Log;
import com.yongoe.pure.common.security.UserUtils;
import com.yongoe.pure.system.api.entity.SysUser;
import com.yongoe.pure.system.api.vo.SysMenuVo;
import com.yongoe.pure.system.api.vo.UserInfo;
import com.yongoe.pure.system.service.SysUserService;
import io.github.linpeilie.Converter;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 用户个人信息
 *
 * @author yongoe
 * @since 2024/7/5
 */
@RestController
@RequestMapping("/system/userinfo")
public class UserInfoController {
    @Resource
    private Converter converter;
    @Resource
    private SysUserService sysUserService;

    public static class UpdateUserDto {

        /**
         * 修改user信息
         */
        public SysUser update(SysUser user) {
            user.setNickname(this.nickname);
            user.setName(this.name);
            user.setEmail(this.email);
            user.setPhone(this.phone);
            user.setSex(this.sex);
            user.setAvatar(this.avatar);
            user.setUserExtraData(this.userExtraData);
            return user;
        }

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
         * 用户额外数据
         */
        private Map<String, Object> userExtraData;
    }

    /**
     * 获取当前登录用户信息
     */
    @GetMapping("/info")
    public R info() {
        UserInfo userInfo = UserUtils.getUserInfo();
        return R.success(null, userInfo);
    }

    /**
     * 查询个人菜单
     */
    @GetMapping("/menu")
    public R getMenu() {
        List<SysMenuVo> list = sysUserService.getMenu();
        return R.success(null, list);
    }

    /**
     * 修改个人信息
     */
    @Log("修改个人信息")
    @PutMapping("/update")
    public R updateUserInfo(@Validated @RequestBody UpdateUserDto dto) {
        String username = UserUtils.getUsername();
        UserInfo info = sysUserService.getUserInfoByUsername(username);
        //获取到entity
        SysUser sysUser = converter.convert(info, SysUser.class);
        //更新entity
        SysUser newUser = dto.update(sysUser);
        sysUserService.updateById(newUser);
        UserUtils.updateUserInfoByUsername(newUser.getUsername());
        return R.success("修改成功");
    }

    /**
     * 修改密码
     */
    @Log("修改密码")
    @PutMapping("/password")
    public R updatePassword(String newPassword) {
        if (StringUtils.isBlank(newPassword)) {
            return R.error("密码不能为空");
        }
        String username = UserUtils.getUsername();
        // sha1加密
        String sha1 = SaSecureUtil.sha1(newPassword);
        sysUserService.update(new LambdaUpdateWrapper<SysUser>()
                .eq(SysUser::getUsername, username)
                .set(SysUser::getPassword, sha1));
        return R.success("修改成功");
    }

}
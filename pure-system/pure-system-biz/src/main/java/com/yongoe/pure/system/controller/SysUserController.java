package com.yongoe.pure.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.secure.SaSecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.annotation.Update;
import com.yongoe.pure.common.core.entity.R;
import com.yongoe.pure.common.core.feign.InnerAuth;
import com.yongoe.pure.common.core.utils.PageUtils;
import com.yongoe.pure.common.core.utils.StringUtils;
import com.yongoe.pure.common.log.Log;
import com.yongoe.pure.common.security.UserUtils;
import com.yongoe.pure.system.api.dto.SysUserDto;
import com.yongoe.pure.system.api.entity.SysUser;
import com.yongoe.pure.system.api.entity.SysUserPost;
import com.yongoe.pure.system.api.entity.SysUserRole;
import com.yongoe.pure.system.api.query.SysUserQuery;
import com.yongoe.pure.system.api.vo.UserInfo;
import com.yongoe.pure.system.mapper.SysUserPostMapper;
import com.yongoe.pure.system.mapper.SysUserRoleMapper;
import com.yongoe.pure.system.service.SysUserService;
import io.github.linpeilie.Converter;
import jakarta.annotation.Resource;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@RestController
@RequestMapping("/system/user")
public class SysUserController {
    @Resource
    private SysUserService sysUserService;
    @Resource
    private Converter converter;
    @Resource
    private SysUserRoleMapper sysUserRoleMapper;
    @Resource
    private SysUserPostMapper sysUserPostMapper;

    /**
     * 分页查询
     */
    @SaCheckPermission("system:user:query")
    @GetMapping("/page")
    public R page(SysUserQuery query) {
        SysUser entity = converter.convert(query, SysUser.class);
        IPage<UserInfo> page = sysUserService.selectByPage(PageUtils.getPage(), entity);
        return R.success(null, new PageUtils(page));
    }

    /**
     * feign调用获取用户信息
     */
    @InnerAuth
    @GetMapping("/getUserInfo")
    public R getUserInfo(String username) {
        if (StringUtils.isBlank(username)) {
            return R.error("用户名不能为空");
        }
        UserInfo userInfo = sysUserService.getUserInfoByUsername(username);
        return R.success(null, userInfo);
    }

    /**
     * 添加
     */
    @Log("添加用户")
    @SaCheckPermission("system:user:add")
    @PostMapping("/add")
    @Transactional(rollbackFor = Exception.class)
    public R add(@Validated(Create.class) @RequestBody SysUserDto dto) {
        SysUser entity = converter.convert(dto, SysUser.class);
        String username = entity.getUsername();
        // 判断用户名是否存在
        long count = sysUserService.count(new LambdaQueryWrapper<SysUser>().eq(SysUser::getUsername, username));
        if (count > 0) {
            return R.error("用户名已存在");
        }
        entity.setPassword(SaSecureUtil.sha1("123456"));
        sysUserService.save(entity);
        // 更新用户的角色和岗位，需要添加后获取 UserId
        sysUserService.updateUserRole(entity.getUserId(), dto.getRoleIds());
        sysUserService.updateUserPost(entity.getUserId(), dto.getPostIds());
        return R.success("添加成功，密码：123456 ");
    }

    /**
     * 修改密码
     */
    @Log("修改密码")
    @SaCheckPermission("system:user:update")
    @PutMapping("/update/password")
    public R updatePassword(@RequestParam Long userId, @RequestParam String newPassword) {
        if (userId == null || StringUtils.isBlank(newPassword)) {
            return R.error("用户ID和密码不能为空");
        }
        // sha1加密
        String sha1 = SaSecureUtil.sha1(newPassword);
        sysUserService.update(new LambdaUpdateWrapper<SysUser>()
                .eq(SysUser::getUserId, userId)
                .set(SysUser::getPassword, sha1));
        return R.success("修改成功");
    }

    /**
     * 修改用户
     */
    @Log("修改用户")
    @SaCheckPermission("system:user:update")
    @PutMapping("/update")
    @Transactional(rollbackFor = Exception.class)
    public R update(@Validated(Update.class) @RequestBody SysUserDto dto) {
        SysUser entity = converter.convert(dto, SysUser.class);
        //防止修改用户名
        entity.setUsername(null);
        sysUserService.updateById(entity);
        // 更新用户的角色和岗位
        sysUserService.updateUserRole(dto.getUserId(), dto.getRoleIds());
        sysUserService.updateUserPost(dto.getUserId(), dto.getPostIds());
        UserUtils.updateUserInfoByUsername(dto.getUsername());
        return R.success("修改成功");
    }

    /**
     * 删除 - 关联删除 ‘用户岗位’和‘用户角色’
     */
    @Log("删除用户")
    @SaCheckPermission("system:user:delete")
    @Transactional(rollbackFor = Exception.class)
    @DeleteMapping("/delete/{ids}")
    public R delete(@PathVariable List<Long> ids) {
        if (ids.contains(1L))
            return R.error("禁止删除超级管理员");
        sysUserService.removeByIds(ids);
        sysUserRoleMapper.delete(new LambdaUpdateWrapper<SysUserRole>().in(SysUserRole::getUserId, ids));
        sysUserPostMapper.delete(new LambdaUpdateWrapper<SysUserPost>().in(SysUserPost::getUserId, ids));
        return R.success("删除成功");
    }
}
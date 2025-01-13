package com.yongoe.pure.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yongoe.pure.common.security.UserUtils;
import com.yongoe.pure.system.api.entity.SysRole;
import com.yongoe.pure.system.api.entity.SysUser;
import com.yongoe.pure.system.api.entity.SysUserPost;
import com.yongoe.pure.system.api.entity.SysUserRole;
import com.yongoe.pure.system.api.vo.SysMenuVo;
import com.yongoe.pure.system.api.vo.SysRoleVo;
import com.yongoe.pure.system.api.vo.UserInfo;
import com.yongoe.pure.system.mapper.SysUserMapper;
import com.yongoe.pure.system.mapper.SysUserPostMapper;
import com.yongoe.pure.system.mapper.SysUserRoleMapper;
import com.yongoe.pure.system.service.SysUserService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * 用户管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {
    @Resource
    private SysUserRoleMapper sysUserRoleMapper;
    @Resource
    private SysUserPostMapper sysUserPostMapper;

    @Override
    public IPage<UserInfo> selectByPage(IPage page, SysUser sysUser) {
        return baseMapper.selectByPage(page, sysUser);
    }

    @Override
    public UserInfo getUserInfoByUsername(String username) {
        return baseMapper.getUserInfoByUsername(username);
    }

    @Override
    public void updateUserRole(Long userId, List<Long> roleIds) {
        sysUserRoleMapper.delete(new LambdaQueryWrapper<SysUserRole>().eq(SysUserRole::getUserId, userId));
        if (!CollectionUtils.isEmpty(roleIds)) {
            for (Long roleId : roleIds) {
                sysUserRoleMapper.insert(new SysUserRole(userId, roleId));
            }
        }
    }

    @Override
    public void updateUserPost(Long userId, List<Long> postIds) {
        sysUserRoleMapper.delete(new LambdaQueryWrapper<SysUserRole>().eq(SysUserRole::getUserId, userId));
        if (!CollectionUtils.isEmpty(postIds)) {
            for (Long postId : postIds) {
                sysUserPostMapper.insert(new SysUserPost(userId, postId));
            }
        }
    }

    @Override
    public List<SysMenuVo> getMenu() {
        Long userId = UserUtils.getUserInfo().getUserId();
        // 判断存在admin ,给全部菜单
        for (SysRoleVo role : UserUtils.getUserInfo().getRoles()){
            if ("admin".equals(role.getRoleCode())) {
                return baseMapper.getMenuByAdmin();
            }
        }
        return baseMapper.getMenu(userId);
    }

}

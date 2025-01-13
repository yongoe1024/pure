package com.yongoe.pure.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yongoe.pure.system.api.entity.SysRole;
import com.yongoe.pure.system.api.entity.SysRoleDept;
import com.yongoe.pure.system.api.entity.SysRoleMenu;
import com.yongoe.pure.system.api.vo.SysRoleVo;
import com.yongoe.pure.system.mapper.SysRoleDeptMapper;
import com.yongoe.pure.system.mapper.SysRoleMapper;
import com.yongoe.pure.system.mapper.SysRoleMenuMapper;
import com.yongoe.pure.system.service.SysRoleService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * 角色管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements SysRoleService {
    @Resource
    private SysRoleMenuMapper sysRoleMenuMapper;
    @Resource
    private SysRoleDeptMapper sysRoleDeptMapper;

    @Override
    public IPage<SysRoleVo> selectByPage(IPage page, SysRole sysRole) {
        return baseMapper.selectByPage(page, sysRole);
    }

    @Override
    public void updateRoleMenu(Long roleId, List<Long> menuIds) {
        sysRoleMenuMapper.delete(new LambdaQueryWrapper<SysRoleMenu>().eq(SysRoleMenu::getRoleId, roleId));
        if (!CollectionUtils.isEmpty(menuIds)) {
            for (Long menuId : menuIds) {
                sysRoleMenuMapper.insert(new SysRoleMenu(roleId, menuId));
            }
        }
    }

    @Override
    public void updateRoleDept(Long roleId, List<Long> deptIds) {
        sysRoleDeptMapper.delete(new LambdaQueryWrapper<SysRoleDept>().eq(SysRoleDept::getRoleId, roleId));
        if (!CollectionUtils.isEmpty(deptIds)) {
            for (Long deptId : deptIds) {
                sysRoleDeptMapper.insert(new SysRoleDept(roleId, deptId));
            }
        }
    }

}

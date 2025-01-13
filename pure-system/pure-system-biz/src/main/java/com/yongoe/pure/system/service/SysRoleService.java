package com.yongoe.pure.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yongoe.pure.system.api.entity.SysRole;
import com.yongoe.pure.system.api.vo.SysRoleVo;

import java.util.List;

/**
 * 角色管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
public interface SysRoleService extends IService<SysRole> {

    IPage<SysRoleVo> selectByPage(IPage page, SysRole sysRole);

    /**
     * 更新角色菜单
     */
    void updateRoleMenu(Long roleId, List<Long> menuIds);

    /**
     * 更新角色数据权限
     */
    void updateRoleDept(Long roleId, List<Long> deptIds);
}

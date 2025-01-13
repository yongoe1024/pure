package com.yongoe.pure.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yongoe.pure.system.api.entity.SysUser;
import com.yongoe.pure.system.api.vo.SysMenuVo;
import com.yongoe.pure.system.api.vo.UserInfo;

import java.util.List;

/**
 * 用户管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
public interface SysUserService extends IService<SysUser> {

    IPage<UserInfo> selectByPage(IPage page, SysUser sysUser);

    /**
     * 根据用户名获取用户信息
     */
    UserInfo getUserInfoByUsername(String username);

    /**
     * 根据userId，更新用户角色，先删除原有角色，再添加新角色
     */
    void updateUserRole(Long userId, List<Long> roleIds);

    /**
     * 根据userId，更新用户岗位
     */
    void updateUserPost(Long userId, List<Long> postIds);
    /**
     * 查询个人菜单
     */
    List<SysMenuVo> getMenu();

}

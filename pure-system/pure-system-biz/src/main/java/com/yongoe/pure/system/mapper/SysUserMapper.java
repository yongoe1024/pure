package com.yongoe.pure.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yongoe.pure.system.api.entity.SysUser;
import com.yongoe.pure.system.api.vo.SysMenuVo;
import com.yongoe.pure.system.api.vo.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {

    IPage<UserInfo> selectByPage(IPage page, @Param("sysUser") SysUser sysUser);

    /**
     * 根据用户名获取用户信息
     */
    UserInfo getUserInfoByUsername(String username);
    /**
     * 查询个人菜单
     */
    List<SysMenuVo> getMenu(Long userId );

    List<SysMenuVo> getMenuByAdmin();
}

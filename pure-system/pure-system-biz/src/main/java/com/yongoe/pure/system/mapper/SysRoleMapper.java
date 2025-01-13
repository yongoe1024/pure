package com.yongoe.pure.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yongoe.pure.system.api.entity.SysRole;
import com.yongoe.pure.system.api.vo.SysRoleVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 角色管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Mapper
public interface SysRoleMapper extends BaseMapper<SysRole> {

    IPage<SysRoleVo> selectByPage(IPage page, @Param("sysRole") SysRole sysRole);


    SysRoleVo selectRoleByUserId(Long userId);

}

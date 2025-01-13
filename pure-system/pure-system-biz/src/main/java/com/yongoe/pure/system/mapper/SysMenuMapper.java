package com.yongoe.pure.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yongoe.pure.system.api.entity.SysMenu;
import com.yongoe.pure.system.api.vo.SysMenuVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 菜单管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Mapper
public interface SysMenuMapper extends BaseMapper<SysMenu> {

    IPage<SysMenuVo> selectByPage(IPage page, @Param("sysMenu") SysMenu sysMenu);

}

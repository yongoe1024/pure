package com.yongoe.pure.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yongoe.pure.system.api.entity.SysMenu;
import com.yongoe.pure.system.api.vo.SysMenuVo;

import java.util.List;

/**
 * 菜单管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
public interface SysMenuService extends IService<SysMenu> {

    List<SysMenuVo> selectByList(SysMenu sysMenu);

}

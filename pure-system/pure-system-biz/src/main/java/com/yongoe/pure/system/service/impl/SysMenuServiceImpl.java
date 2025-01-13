package com.yongoe.pure.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yongoe.pure.system.api.entity.SysMenu;
import com.yongoe.pure.system.api.vo.SysMenuVo;
import com.yongoe.pure.system.mapper.SysMenuMapper;
import com.yongoe.pure.system.service.SysMenuService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 菜单管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements SysMenuService {

    @Override
    public List<SysMenuVo> selectByList(SysMenu sysMenu) {
        IPage<SysMenuVo> page = baseMapper.selectByPage(Page.of(-1, -1), sysMenu);
        return page.getRecords();
    }

}

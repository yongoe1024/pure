package com.yongoe.pure.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.annotation.Update;
import com.yongoe.pure.common.core.entity.R;
import com.yongoe.pure.common.log.Log;
import com.yongoe.pure.system.api.dto.SysMenuDto;
import com.yongoe.pure.system.api.entity.SysMenu;
import com.yongoe.pure.system.api.entity.SysRoleMenu;
import com.yongoe.pure.system.api.query.SysMenuQuery;
import com.yongoe.pure.system.api.vo.SysMenuVo;
import com.yongoe.pure.system.mapper.SysRoleMenuMapper;
import com.yongoe.pure.system.service.SysMenuService;
import io.github.linpeilie.Converter;
import jakarta.annotation.Resource;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 菜单管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@RestController
@RequestMapping("/system/menu")
public class SysMenuController {
    @Resource
    private SysMenuService sysMenuService;
    @Resource
    private SysRoleMenuMapper sysRoleMenuMapper;
    @Resource
    private Converter converter;

    /**
     * 查询
     */
    @SaCheckPermission("system:menu:query")
    @GetMapping("/list")
    public R list(SysMenuQuery query) {
        SysMenu entity = converter.convert(query, SysMenu.class);
        List<SysMenuVo> list = sysMenuService.selectByList(entity);
        return R.success(null, list);
    }

    /**
     * 添加
     */
    @Log("添加菜单")
    @SaCheckPermission("system:menu:add")
    @PostMapping("/add")
    public R add(@Validated(Create.class) @RequestBody SysMenuDto dto) {
        SysMenu entity = converter.convert(dto, SysMenu.class);
        sysMenuService.save(entity);
        return R.success("添加成功");
    }

    /**
     * 修改
     */
    @Log("修改菜单")
    @SaCheckPermission("system:menu:update")
    @PutMapping("/update")
    public R update(@Validated(Update.class) @RequestBody SysMenuDto dto) {
        SysMenu entity = converter.convert(dto, SysMenu.class);
        sysMenuService.updateById(entity);
        return R.success("修改成功");
    }

    /**
     * 删除 --关联删除‘角色菜单’
     */
    @Log("删除菜单")
    @SaCheckPermission("system:menu:delete")
    @DeleteMapping("/delete/{ids}")
    @Transactional(rollbackFor = Exception.class)
    public R delete(@PathVariable List<Long> ids) {
        long count = sysMenuService.count(new LambdaQueryWrapper<SysMenu>()
                .in(SysMenu::getParentId, ids));
        if (count > 0)
            return R.error("请先删除子菜单");
        sysRoleMenuMapper.delete(new LambdaQueryWrapper<SysRoleMenu>().in(SysRoleMenu::getMenuId, ids));
        sysMenuService.removeByIds(ids);
        return R.success("删除成功");
    }

}
package com.yongoe.pure.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.annotation.Update;
import com.yongoe.pure.common.core.entity.R;
import com.yongoe.pure.common.core.utils.PageUtils;
import com.yongoe.pure.common.log.Log;
import com.yongoe.pure.system.api.dto.SysRoleDto;
import com.yongoe.pure.system.api.entity.SysRole;
import com.yongoe.pure.system.api.entity.SysRoleDept;
import com.yongoe.pure.system.api.entity.SysRoleMenu;
import com.yongoe.pure.system.api.entity.SysUserRole;
import com.yongoe.pure.system.api.query.SysRoleQuery;
import com.yongoe.pure.system.api.vo.SysRoleVo;
import com.yongoe.pure.system.mapper.SysRoleDeptMapper;
import com.yongoe.pure.system.mapper.SysRoleMenuMapper;
import com.yongoe.pure.system.mapper.SysUserRoleMapper;
import com.yongoe.pure.system.service.SysRoleService;
import io.github.linpeilie.Converter;
import jakarta.annotation.Resource;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 角色管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@RestController
@RequestMapping("/system/role")
public class SysRoleController {
    @Resource
    private SysRoleService sysRoleService;
    @Resource
    private SysRoleMenuMapper sysRoleMenuMapper;
    @Resource
    private SysUserRoleMapper sysUserRoleMapper;
    @Resource
    private SysRoleDeptMapper sysRoleDeptMapper;
    @Resource
    private Converter converter;

    /**
     * 分页查询
     */
    @SaCheckPermission("system:role:query")
    @GetMapping("/page")
    public R page(SysRoleQuery query) {
        SysRole entity = converter.convert(query, SysRole.class);
        IPage<SysRoleVo> page = sysRoleService.selectByPage(PageUtils.getPage(), entity);
        return R.success(null, new PageUtils(page));
    }

    /**
     * 添加
     */
    @Log("添加角色")
    @SaCheckPermission("system:role:add")
    @PostMapping("/add")
    public R add(@Validated(Create.class) @RequestBody SysRoleDto dto) {
        SysRole entity = converter.convert(dto, SysRole.class);
        sysRoleService.save(entity);
        return R.success("添加成功");
    }

    /**
     * 修改角色菜单权限，根据角色id 修改菜单id
     */
    @Log("修改角色菜单权限")
    @SaCheckPermission("system:role:update")
    @PutMapping("/update/menu")
    public R updateRoleMenu(@RequestParam Long roleId, @RequestParam List<Long> menuIds) {
        sysRoleService.updateRoleMenu(roleId, menuIds);
        return R.success("修改成功");
    }

    /**
     * 修改角色数据权限，根据角色id 修改dept_id
     */
    @Log("修改角色数据权限")
    @SaCheckPermission("system:role:update")
    @PutMapping("/update/dept")
    public R updateRoleDept(@RequestParam Long roleId, @RequestParam List<Long> deptIds) {
        sysRoleService.updateRoleDept(roleId, deptIds);
        return R.success("修改成功");
    }

    /**
     * 修改
     */
    @Log("修改角色")
    @SaCheckPermission("system:role:update")
    @PutMapping("/update")
    public R update(@Validated(Update.class) @RequestBody SysRoleDto dto) {
        SysRole entity = converter.convert(dto, SysRole.class);
        sysRoleService.updateById(entity);
        return R.success("修改成功");
    }

    /**
     * 删除  --关联删除 ‘角色菜单’和‘用户角色’和‘角色部门’
     */
    @Log("删除角色")
    @SaCheckPermission("system:role:delete")
    @DeleteMapping("/delete/{ids}")
    @Transactional(rollbackFor = Exception.class)
    public R delete(@PathVariable List<Long> ids) {
        if (ids.contains(1L))
            return R.error("禁止删除管理员");
        sysRoleMenuMapper.delete(new LambdaQueryWrapper<SysRoleMenu>()
                .in(SysRoleMenu::getRoleId, ids));
        sysUserRoleMapper.delete(new LambdaQueryWrapper<SysUserRole>()
                .in(SysUserRole::getRoleId, ids));
        sysRoleDeptMapper.delete(new LambdaQueryWrapper<SysRoleDept>()
                .in(SysRoleDept::getRoleId, ids));
        sysRoleService.removeByIds(ids);
        return R.success("删除成功");
    }

}
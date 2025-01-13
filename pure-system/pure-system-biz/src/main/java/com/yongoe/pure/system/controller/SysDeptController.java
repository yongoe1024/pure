package com.yongoe.pure.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.annotation.Update;
import com.yongoe.pure.common.core.entity.R;
import com.yongoe.pure.common.log.Log;
import com.yongoe.pure.system.api.dto.SysDeptDto;
import com.yongoe.pure.system.api.entity.SysDept;
import com.yongoe.pure.system.api.entity.SysUser;
import com.yongoe.pure.system.api.query.SysDeptQuery;
import com.yongoe.pure.system.api.vo.SysDeptVo;
import com.yongoe.pure.system.mapper.SysRoleDeptMapper;
import com.yongoe.pure.system.service.SysDeptService;
import com.yongoe.pure.system.service.SysUserService;
import io.github.linpeilie.Converter;
import jakarta.annotation.Resource;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 部门管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@RestController
@RequestMapping("/system/dept")
public class SysDeptController {
    @Resource
    private SysDeptService sysDeptService;
    @Resource
    private SysUserService sysUserService;
    @Resource
    private SysRoleDeptMapper sysRoleDeptMapper;
    @Resource
    private Converter converter;

    /**
     * 查询
     */
    @SaCheckPermission("system:dept:query")
    @GetMapping("/list")
    public R list(SysDeptQuery query) {
        SysDept entity = converter.convert(query, SysDept.class);
        List<SysDeptVo> list = sysDeptService.selectByList(entity);
        return R.success(null, list);
    }

    /**
     * 添加
     */
    @Log("添加部门")
    @SaCheckPermission("system:dept:add")
    @PostMapping("/add")
    public R add(@Validated(Create.class) @RequestBody SysDeptDto dto) {
        SysDept entity = converter.convert(dto, SysDept.class);
        sysDeptService.save(entity);
        return R.success("添加成功");
    }

    /**
     * 修改
     */
    @Log("修改部门")
    @SaCheckPermission("system:dept:update")
    @PutMapping("/update")
    public R update(@Validated(Update.class) @RequestBody SysDeptDto dto) {
        SysDept entity = converter.convert(dto, SysDept.class);
        sysDeptService.updateById(entity);
        return R.success("修改成功");
    }

    /**
     * 删除 -- 关联删除‘角色部门’
     */
    @Log("删除部门")
    @SaCheckPermission("system:dept:delete")
    @DeleteMapping("/delete/{ids}")
    @Transactional(rollbackFor = Exception.class)
    public R delete(@PathVariable List<Long> ids) {
        long count = sysDeptService.count(new LambdaQueryWrapper<SysDept>().in(SysDept::getParentId, ids));
        if (count > 0)
            return R.error("请先删除子部门");
        long count1 = sysUserService.count(new LambdaQueryWrapper<SysUser>().in(SysUser::getDeptId, ids));
        if (count1 > 0)
            return R.error("部门下存在用户，请先删除用户");
        sysRoleDeptMapper.deleteByIds(ids);
        sysDeptService.removeByIds(ids);
        return R.success("删除成功");
    }

}
package com.yongoe.pure.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.annotation.Update;
import com.yongoe.pure.common.core.entity.R;
import com.yongoe.pure.common.core.utils.PageUtils;
import com.yongoe.pure.common.log.Log;
import com.yongoe.pure.system.api.dto.SysPostDto;
import com.yongoe.pure.system.api.entity.SysPost;
import com.yongoe.pure.system.api.entity.SysUserPost;
import com.yongoe.pure.system.api.query.SysPostQuery;
import com.yongoe.pure.system.api.vo.SysPostVo;
import com.yongoe.pure.system.mapper.SysUserPostMapper;
import com.yongoe.pure.system.service.SysPostService;
import io.github.linpeilie.Converter;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 岗位管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@RestController
@RequestMapping("/system/post")
public class SysPostController {
    @Resource
    private SysPostService sysPostService;
    @Resource
    private Converter converter;
    @Resource
    private SysUserPostMapper sysUserPostMapper;

    /**
     * 分页查询
     */
    @SaCheckPermission("system:post:query")
    @GetMapping("/page")
    public R page(SysPostQuery query) {
        SysPost entity = converter.convert(query, SysPost.class);
        IPage<SysPostVo> page = sysPostService.selectByPage(PageUtils.getPage(), entity);
        return R.success(null, new PageUtils(page));
    }

    /**
     * 添加
     */
    @Log("添加岗位")
    @SaCheckPermission("system:post:add")
    @PostMapping("/add")
    public R add(@Validated(Create.class) @RequestBody SysPostDto dto) {
        SysPost entity = converter.convert(dto, SysPost.class);
        sysPostService.save(entity);
        return R.success("添加成功");
    }

    /**
     * 修改
     */
    @Log("修改岗位")
    @SaCheckPermission("system:post:update")
    @PutMapping("/update")
    public R update(@Validated(Update.class) @RequestBody SysPostDto dto) {
        SysPost entity = converter.convert(dto, SysPost.class);
        sysPostService.updateById(entity);
        return R.success("修改成功");
    }

    /**
     * 删除
     */
    @Log("删除岗位")
    @SaCheckPermission("system:post:delete")
    @DeleteMapping("/delete/{ids}")
    public R delete(@PathVariable List<Long> ids) {
        Long count = sysUserPostMapper.selectCount(new LambdaQueryWrapper<SysUserPost>()
                .in(SysUserPost::getPostId, ids));
        if (count > 0) {
            return R.error("该岗位已分配给用户，不能删除");
        }
        sysPostService.removeByIds(ids);
        return R.success("删除成功");
    }

}
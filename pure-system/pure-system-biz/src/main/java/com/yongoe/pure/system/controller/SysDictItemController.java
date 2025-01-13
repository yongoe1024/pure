package com.yongoe.pure.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.annotation.Update;
import com.yongoe.pure.common.core.entity.R;
import com.yongoe.pure.common.core.utils.PageUtils;
import com.yongoe.pure.common.log.Log;
import com.yongoe.pure.system.api.dto.SysDictItemDto;
import com.yongoe.pure.system.api.entity.SysDictItem;
import com.yongoe.pure.system.api.query.SysDictItemQuery;
import com.yongoe.pure.system.api.vo.SysDictItemVo;
import com.yongoe.pure.system.service.SysDictItemService;
import io.github.linpeilie.Converter;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 字典项
 *
 * @author yongoe
 * @since 2024/07/04
 */
@RestController
@RequestMapping("/system/dictItem")
public class SysDictItemController {
    @Resource
    private SysDictItemService sysDictItemService;
    @Resource
    private Converter converter;

    /**
     * 分页查询
     */
    @SaCheckPermission("system:dictItem:query")
    @GetMapping("/page")
    public R page(SysDictItemQuery query) {
        SysDictItem entity = converter.convert(query, SysDictItem.class);
        IPage<SysDictItemVo> page = sysDictItemService.selectByPage(PageUtils.getPage(), entity);
        return R.success(null, new PageUtils(page));
    }

    /**
     * 添加
     */
    @Log("添加字典项")
    @SaCheckPermission("system:dictItem:add")
    @PostMapping("/add")
    public R add(@Validated(Create.class) @RequestBody SysDictItemDto dto) {
        SysDictItem entity = converter.convert(dto, SysDictItem.class);
        sysDictItemService.save(entity);
        return R.success("添加成功");
    }

    /**
     * 修改
     */
    @Log("修改字典项")
    @SaCheckPermission("system:dictItem:update")
    @PutMapping("/update")
    public R update(@Validated(Update.class) @RequestBody SysDictItemDto dto) {
        SysDictItem entity = converter.convert(dto, SysDictItem.class);
        sysDictItemService.updateById(entity);
        return R.success("修改成功");
    }

    /**
     * 删除
     */
    @Log("删除字典项")
    @SaCheckPermission("system:dictItem:delete")
    @DeleteMapping("/delete/{ids}")
    public R delete(@PathVariable List<Long> ids) {
        sysDictItemService.removeByIds(ids);
        return R.success("删除成功");
    }

}
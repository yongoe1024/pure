package com.yongoe.pure.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.annotation.Update;
import com.yongoe.pure.common.core.entity.R;
import com.yongoe.pure.common.log.Log;
import com.yongoe.pure.system.api.dto.SysDictDto;
import com.yongoe.pure.system.api.entity.SysDict;
import com.yongoe.pure.system.api.entity.SysDictItem;
import com.yongoe.pure.system.api.query.SysDictQuery;
import com.yongoe.pure.system.api.vo.SysDictVo;
import com.yongoe.pure.system.service.SysDictItemService;
import com.yongoe.pure.system.service.SysDictService;
import io.github.linpeilie.Converter;
import jakarta.annotation.Resource;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 字典管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@RestController
@RequestMapping("/system/dict")
public class SysDictController {
    @Resource
    private SysDictItemService sysDictItemService;
    @Resource
    private SysDictService sysDictService;
    @Resource
    private Converter converter;

    /**
     * 分页查询
     */
    @SaCheckPermission("system:dict:query")
    @GetMapping("/list")
    public R page(SysDictQuery query) {
        SysDict entity = converter.convert(query, SysDict.class);
        IPage<SysDictVo> page = sysDictService.selectByPage(Page.of(-1, -1), entity);
        return R.success(null, page.getRecords());
    }

    /**
     * 刷新字典缓存
     */
    @Log("刷新数据字典缓存")
    @SaCheckPermission("system:dict:query")
    @DeleteMapping("/refreshCache")
    public R refreshCache() {
        sysDictService.resetDictCache();
        return R.success("刷新成功");
    }

    /**
     * 添加
     */
    @Log("添加字典")
    @SaCheckPermission("system:dict:add")
    @PostMapping("/add")
    public R add(@Validated(Create.class) @RequestBody SysDictDto dto) {
        SysDict entity = converter.convert(dto, SysDict.class);
        sysDictService.save(entity);
        return R.success("添加成功");
    }

    /**
     * 修改
     */
    @Log("修改字典")
    @SaCheckPermission("system:dict:update")
    @PutMapping("/update")
    public R update(@Validated(Update.class) @RequestBody SysDictDto dto) {
        SysDict entity = converter.convert(dto, SysDict.class);
        sysDictService.updateById(entity);
        return R.success("修改成功");
    }

    /**
     * 删除-关联删除‘字典项’
     */
    @Log("删除字典")
    @SaCheckPermission("system:dict:delete")
    @DeleteMapping("/delete/{ids}")
    @Transactional(rollbackFor = Exception.class)
    public R delete(@PathVariable List<Long> ids) {
        sysDictItemService.remove(new LambdaQueryWrapper<SysDictItem>()
                .in(SysDictItem::getDictId, ids));
        sysDictService.removeByIds(ids);
        return R.success("删除成功");
    }

}
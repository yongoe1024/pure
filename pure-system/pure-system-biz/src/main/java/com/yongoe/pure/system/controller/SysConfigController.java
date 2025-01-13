package com.yongoe.pure.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.annotation.Update;
import com.yongoe.pure.common.core.entity.R;
import com.yongoe.pure.common.core.utils.PageUtils;
import com.yongoe.pure.common.log.Log;
import com.yongoe.pure.system.api.dto.SysConfigDto;
import com.yongoe.pure.system.api.entity.SysConfig;
import com.yongoe.pure.system.api.query.SysConfigQuery;
import com.yongoe.pure.system.api.vo.SysConfigVo;
import com.yongoe.pure.system.service.SysConfigService;
import io.github.linpeilie.Converter;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 系统参数
 *
 * @author yongoe
 * @since 2024/07/04
 */
@RestController
@RequestMapping("/system/config")
public class SysConfigController {
    @Resource
    private SysConfigService sysConfigService;
    @Resource
    private Converter converter;

    /**
     * 分页查询
     */
    @SaCheckPermission("system:config:query")
    @GetMapping("/page")
    public R page(SysConfigQuery query) {
        SysConfig entity = converter.convert(query, SysConfig.class);
        IPage<SysConfigVo> page = sysConfigService.selectByPage(PageUtils.getPage(), entity);
        return R.success(null, new PageUtils(page));
    }

    /**
     * 刷新参数缓存
     */
    @Log("刷新系统参数缓存")
    @SaCheckPermission("system:config:query")
    @DeleteMapping("/refreshCache")
    public R refreshCache() {
        sysConfigService.resetConfigCache();
        return R.success("刷新成功");
    }

    /**
     * 添加
     */
    @Log("添加系统参数")
    @SaCheckPermission("system:config:add")
    @PostMapping("/add")
    public R add(@Validated(Create.class) @RequestBody SysConfigDto dto) {
        SysConfig entity = converter.convert(dto, SysConfig.class);
        sysConfigService.save(entity);
        return R.success("添加成功");
    }

    /**
     * 修改
     */
    @Log("修改系统参数")
    @SaCheckPermission("system:config:update")
    @PutMapping("/update")
    public R update(@Validated(Update.class) @RequestBody SysConfigDto dto) {
        SysConfig entity = converter.convert(dto, SysConfig.class);
        sysConfigService.updateById(entity);
        return R.success("修改成功");
    }

    /**
     * 删除
     */
    @Log("删除系统参数")
    @SaCheckPermission("system:config:delete")
    @DeleteMapping("/delete/{ids}")
    public R delete(@PathVariable List<Long> ids) {
        long count = sysConfigService.count(new LambdaQueryWrapper<SysConfig>()
                .in(SysConfig::getConfigId, ids)
                .eq(SysConfig::getConfigType, "1"));
        if (count > 0) {
            return R.error("系统内置参数，不能删除");
        }
        sysConfigService.removeByIds(ids);
        return R.success("删除成功");
    }


}
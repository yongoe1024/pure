package com.yongoe.pure.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.entity.R;
import com.yongoe.pure.common.core.feign.InnerAuth;
import com.yongoe.pure.common.core.utils.ExcelUtils;
import com.yongoe.pure.common.core.utils.PageUtils;
import com.yongoe.pure.common.log.Log;
import com.yongoe.pure.system.api.dto.SysLogDto;
import com.yongoe.pure.system.api.entity.SysLog;
import com.yongoe.pure.system.api.query.SysLogQuery;
import com.yongoe.pure.system.api.vo.SysLogVo;
import com.yongoe.pure.system.service.SysLogService;
import io.github.linpeilie.Converter;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.time.LocalDateTime;

/**
 * 日志管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@RestController
@RequestMapping("/system/log")
public class SysLogController {
    @Resource
    private SysLogService sysLogService;
    @Resource
    private Converter converter;

    /**
     * 分页查询
     */
    @SaCheckPermission("system:log:query")
    @GetMapping("/page")
    public R page(SysLogQuery query) {
        SysLog entity = converter.convert(query, SysLog.class);
        IPage<SysLogVo> page = sysLogService.selectByPage(PageUtils.getPage(), entity);
        return R.success(null, new PageUtils(page));
    }

    /**
     * feign调用，保存日志
     */
    @InnerAuth
    @PostMapping("/add")
    public void add(@Validated(Create.class) @RequestBody SysLogDto dto) {
        SysLog entity = converter.convert(dto, SysLog.class);
        sysLogService.save(entity);
    }

    /**
     * 删除
     * all     全部删除
     * 30day   保留30天内的日志
     * 7day    保留7天内的日志
     */
    @Log("删除日志")
    @SaCheckPermission("system:log:delete")
    @DeleteMapping("/delete/{type}")
    public R delete(@PathVariable String type) {
        LambdaQueryWrapper<SysLog> wrapper = new LambdaQueryWrapper<>();
        if ("all".equals(type)) {
            //全部删除
            sysLogService.remove(null);
        } else if ("30day".equals(type)) {
            //保留30天内的日志
            sysLogService.remove(wrapper.ge(SysLog::getCreateTime, LocalDateTime.now().minusDays(30)));
        } else if ("7day".equals(type)) {
            //保留7天内的日志
            sysLogService.remove(wrapper.ge(SysLog::getCreateTime, LocalDateTime.now().minusDays(7)));
        } else {
            return R.error("参数错误");
        }
        return R.success("删除成功");
    }

    /**
     * 导出
     */
    @SaCheckPermission("system:log:export")
    @GetMapping("/export")
    public void export(SysLogQuery query, HttpServletResponse response) throws IOException {
        SysLog entity = converter.convert(query, SysLog.class);
        IPage<SysLogVo> page = sysLogService.selectByPage(Page.of(-1, -1), entity);
        ExcelUtils.export(response, page.getRecords(), SysLogVo.class);
    }
}
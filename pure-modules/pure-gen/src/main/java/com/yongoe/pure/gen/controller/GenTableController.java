package com.yongoe.pure.gen.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.pure.common.core.entity.R;
import com.yongoe.pure.common.core.utils.PageUtils;
import com.yongoe.pure.gen.entity.GenTable;
import com.yongoe.pure.gen.entity.GenTableColumn;
import com.yongoe.pure.gen.entity.MavenModule;
import com.yongoe.pure.gen.service.GenTableColumnService;
import com.yongoe.pure.gen.service.GenTableService;
import jakarta.annotation.Resource;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 代码生成业务表
 *
 * @author yongoe
 * @since 2024/08/01
 */
@RestController
@RequestMapping("/gen/gen-table")
public class GenTableController {
    @Resource
    private GenTableService genTableService;
    @Resource
    private GenTableColumnService genTableColumnService;

    /**
     * 获取数据库表
     */
    @GetMapping("/queryTable")
    public R queryTable() {
        Map<String, String> stringStringMap = genTableService.queryTable();
        return R.success(null, stringStringMap);
    }

    /**
     * 获取生成项列表
     */
    @GetMapping("/page")
    public R page(GenTable entity) {
        Page<GenTable> page = genTableService.selectByPage(PageUtils.getPage(), entity);
        return R.success(null, new PageUtils(page));
    }

    /**
     * 获取详细信息
     */
    @GetMapping("/columnList")
    public R columnList(Long tableId) {
        List<GenTableColumn> list = genTableColumnService.list(new LambdaQueryWrapper<GenTableColumn>()
                .eq(GenTableColumn::getTableId, tableId)
                .orderByAsc(GenTableColumn::getSort)
                .orderByAsc(GenTableColumn::getColumnId));
        return R.success(null, list);
    }

    /**
     * 新增生成项
     */
    @PostMapping("/addTable")
    public R addTable(String tableName, String tableComment) {
        genTableService.addTable(tableName, tableComment);
        return R.success("新增表成功");
    }

    /**
     * 修改生成项
     */
    @PostMapping("/updateTable")
    public R updateTable(@Validated @RequestBody GenTable entity) {
        genTableService.updateById(entity);
        return R.success("修改成功");
    }

    /**
     * 修改详细信息
     */
    @PostMapping("/updateColumn")
    public R updateColumn(@Validated @RequestBody List<GenTableColumn> columnList) {
        genTableColumnService.updateBatchById(columnList);
        return R.success("修改字段成功");
    }

    /**
     * 生成代码-生成到项目中
     */
    @PostMapping("/gen")
    public R genCodeToAuto(Long tableId) {
        genTableService.gen(tableId);
        return R.success("生成结束，请查看控制台日志");
    }


    /**
     * 生成maven模块结构
     */
    @PostMapping("/addModule")
    public R addMavenModule(@Validated @RequestBody MavenModule pomModule) {
        genTableService.addMavenModule(pomModule);
        return R.success("生成结束，请查看控制台日志");
    }

    /**
     * 强制同步字段
     */
    @PostMapping("/synchroData")
    public R synchroData(Long tableId) {
        genTableService.synchroData(tableId);
        return R.success("同步成功");
    }

    /**
     * 删除数据
     */
    @PostMapping("/delete/{ids}")
    @Transactional(rollbackFor = Exception.class)
    public R delete(@PathVariable List<Long> ids) {
        genTableService.removeByIds(ids);
        genTableColumnService.remove(new LambdaQueryWrapper<GenTableColumn>().in(GenTableColumn::getTableId, ids));
        return R.success("删除成功");
    }
}
package com.yongoe.pure.gen.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.yongoe.pure.common.core.utils.StringUtils;
import com.yongoe.pure.gen.config.GenConfig;
import com.yongoe.pure.gen.constant.GenConstant;
import com.yongoe.pure.gen.entity.GenTable;
import com.yongoe.pure.gen.entity.GenTableColumn;
import com.yongoe.pure.gen.entity.MavenModule;
import com.yongoe.pure.gen.mapper.GenTableMapper;
import com.yongoe.pure.gen.service.GenCodeService;
import com.yongoe.pure.gen.service.GenModuleService;
import com.yongoe.pure.gen.service.GenTableColumnService;
import com.yongoe.pure.gen.service.GenTableService;
import com.yongoe.pure.gen.utils.DataSourceUtils;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * 代码生成业务表
 *
 * @author yongoe
 * @since 2024/08/01
 */
@Service
public class GenTableServiceImpl extends ServiceImpl<GenTableMapper, GenTable> implements GenTableService {
    @Resource
    private GenConfig genConfig;
    @Resource
    private GenTableColumnService genTableColumnService;

    @Override
    public Page<GenTable> selectByPage(IPage page, GenTable genTable) {
        return baseMapper.selectByPage(page, genTable);
    }

    @Override
    public Map<String, String> queryTable() {
        return DataSourceUtils.getTableList(getDataSourceConfig());
    }

    @Override
    public void addTable(String tableName, String tableComment) {
        GenTable build = GenTable.builder()
                .tableName(tableName)
                .tableComment(tableComment)
                .entityName(StringUtils.toUpperCase(tableName))
                .genCategory(GenConstant.CRUD)
                .author(genConfig.getAuthor())
                .businessName(StringUtils.toLowerCase(tableName))
                .businessNameZh(tableComment)
                .build();
        this.save(build);
        // 添加字段
        List<GenTableColumn> columnList = DataSourceUtils.getColumnList(getDataSourceConfig(), tableName, build.getTableId());
        genTableColumnService.saveBatch(columnList);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void synchroData(Long tableId) {
        String tableName = this.getById(tableId).getTableName();
        DataSourceConfig dataSourceConfig = getDataSourceConfig();
        genTableColumnService.remove(new LambdaQueryWrapper<GenTableColumn>()
                .eq(GenTableColumn::getTableId, tableId));
        List<GenTableColumn> columnList = DataSourceUtils.getColumnList(dataSourceConfig, tableName, tableId);
        genTableColumnService.saveBatch(columnList);
    }

    @Override
    public void gen(Long tableId) {
        GenTable table = this.getById(tableId);
        if (table == null) {
            throw new RuntimeException("未找到表信息");
        }
        List<GenTableColumn> list = genTableColumnService.list(new LambdaQueryWrapper<GenTableColumn>()
                .eq(GenTableColumn::getTableId, tableId)
                .orderByAsc(GenTableColumn::getSort)
                .orderByAsc(GenTableColumn::getColumnId));
        GenCodeService.gen(table, list);
    }

    @Override
    public void addMavenModule(MavenModule pomModule) {
        GenModuleService.gen(pomModule);
    }

    /**
     * 获取数据源配置
     */
    private DataSourceConfig getDataSourceConfig() {
        return new DataSourceConfig.Builder(genConfig.getUrl(), genConfig.getUsername(), genConfig.getPassword()).build();
    }

}

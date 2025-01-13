package com.yongoe.pure.gen.utils;

import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.builder.ConfigBuilder;
import com.baomidou.mybatisplus.generator.config.po.TableField;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.yongoe.pure.gen.constant.ColumnInfo;
import com.yongoe.pure.gen.constant.ColumnType;
import com.yongoe.pure.gen.constant.GenConstant;
import com.yongoe.pure.gen.entity.GenTableColumn;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 数据源工具: 获取数据源表信息、字段信息
 *
 * @author yongoe
 * @since 2024/8/1
 */
public class DataSourceUtils {
    private static final GlobalConfig globalConfig = new GlobalConfig.Builder().build();
    private static final PackageConfig packageConfig = new PackageConfig.Builder().build();
    private static final StrategyConfig strategyConfig = new StrategyConfig.Builder().build();
    private static final InjectionConfig injection = new InjectionConfig.Builder().build();

    /**
     * 获取所有表Map
     *
     * @param dataSourceConfig 数据源配置
     * @return 数据源表列表
     */
    public static Map<String, String> getTableList(DataSourceConfig dataSourceConfig) {
        List<TableInfo> tableInfoList = getTableMetadata(dataSourceConfig);
        Map<String, String> dataMap = new HashMap<>();
        tableInfoList.forEach(tableInfo -> {
            dataMap.put(tableInfo.getName(), tableInfo.getComment());
        });
        return dataMap;
    }

    /**
     * 获取所有字段基本信息
     *
     * @param dataSourceConfig 数据源配置
     * @return 表信息
     */
    public static List<GenTableColumn> getColumnList(DataSourceConfig dataSourceConfig, String tableName, Long tableId) {
        List<GenTableColumn> genTableColumns = initColumn(dataSourceConfig, tableName);
        for (GenTableColumn column : genTableColumns) {
            column.setTableId(tableId);
            // 初始化主键
            // 主键的字段不允许增删改查,不添加修改
            if (column.getIsPk().equals(GenConstant.YES)) {
                column.setIsRequired(GenConstant.NO);
                column.setIsInsert(GenConstant.NO);
                column.setIsEdit(GenConstant.NO);
                column.setIsList(GenConstant.NO);
                column.setIsQuery(GenConstant.NO);
            } else if (ColumnInfo.findByFieldName(column.getJavaField()) != null) {
                // 初始化预设字段
                ColumnInfo columnInfo = ColumnInfo.findByFieldName(column.getJavaField());
                column.setIsRequired(columnInfo.isRequired);
                column.setIsInsert(columnInfo.isInsert);
                column.setIsEdit(columnInfo.isEdit);
                column.setIsList(columnInfo.isList);
                column.setIsQuery(columnInfo.isQuery);
                column.setJavaType(columnInfo.javaType);
            } else {
                // 普通的字段，String 默认用 LIKE 查询
                if (column.getJavaType().equals("String"))
                    column.setQueryType(GenConstant.LIKE);
            }
            // 覆盖默认java类型与java导入
            ColumnType byType = ColumnType.findByType(column.getColumnType());
            if (byType != null) {
                column.setJavaType(byType.javaType);
                column.setJavaImport(byType.javaImport);
            }
        }
        return genTableColumns;
    }

    /**
     * 初始化字段信息
     *
     * @param dataSourceConfig 数据源配置
     * @return 表信息
     */
    private static List<GenTableColumn> initColumn(DataSourceConfig dataSourceConfig, String tableName) {
        List<TableInfo> tableInfoList = getTableMetadata(dataSourceConfig);
        List<GenTableColumn> genTableInfoList = new ArrayList<>();
        tableInfoList.forEach(tableInfo -> {
            if (tableInfo.getName().equals(tableName)) {
                tableInfo.getFields().forEach(field -> {
                    GenTableColumn column = GenTableColumn.create();
                    column.setColumnName(field.getName());
                    column.setColumnComment(field.getComment());
                    TableField.MetaInfo metaInfo = field.getMetaInfo();
                    String columnType = metaInfo.getTypeName() + "(" + metaInfo.getLength() + ")";
                    column.setColumnType(columnType);
                    column.setIsPk(field.isKeyFlag() ? GenConstant.YES : GenConstant.NO);
                    column.setIsIncrement(field.isKeyIdentityFlag() ? GenConstant.YES : GenConstant.NO);
                    column.setJavaField(field.getPropertyName());
                    column.setJavaType(field.getPropertyType());
                    column.setJavaImport(field.getColumnType().getPkg());
                    genTableInfoList.add(column);
                });
            }
        });
        return genTableInfoList;
    }

    /**
     * 获取 MybatisPlus的表元数据
     */
    private static List<TableInfo> getTableMetadata(DataSourceConfig dataSourceConfig) {
        ConfigBuilder configBuilder = new ConfigBuilder(packageConfig, dataSourceConfig, strategyConfig, null, globalConfig, injection);
        return configBuilder.getTableInfoList();
    }
}
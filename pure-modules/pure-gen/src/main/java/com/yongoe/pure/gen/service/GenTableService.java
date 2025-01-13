package com.yongoe.pure.gen.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yongoe.pure.gen.entity.GenTable;
import com.yongoe.pure.gen.entity.MavenModule;

import java.util.Map;

/**
 * 代码生成业务表
 *
 * @author yongoe
 * @since 2024/08/01
 */
public interface GenTableService extends IService<GenTable> {

    Page<GenTable> selectByPage(IPage page, GenTable genTable);

    /**
     * 查询数据库表
     *
     * @return map: { "sys_user": "注释"}
     */
    Map<String, String> queryTable();

    /**
     * 添加表
     *
     * @param tableName    表名
     * @param tableComment 表注释
     */
    void addTable(String tableName, String tableComment);

    /**
     * 同步数据
     */
    void synchroData(Long tableId);

    /**
     * 生成代码-添加到项目中
     */
    void gen(Long tableId);

    /**
     * 新增maven模块-添加到项目中
     */
    void addMavenModule(MavenModule pomModule);
}

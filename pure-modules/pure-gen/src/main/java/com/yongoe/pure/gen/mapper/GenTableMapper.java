package com.yongoe.pure.gen.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.pure.gen.entity.GenTable;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 代码生成业务表
 *
 * @author yongoe
 * @since 2024/08/01
 */
@Mapper
public interface GenTableMapper extends BaseMapper<GenTable> {

    Page<GenTable> selectByPage(IPage page, @Param("genTable") GenTable genTable);

}

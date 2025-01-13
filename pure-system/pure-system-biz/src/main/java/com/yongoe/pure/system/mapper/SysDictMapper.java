package com.yongoe.pure.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yongoe.pure.system.api.entity.SysDict;
import com.yongoe.pure.system.api.vo.SysDictItemVo;
import com.yongoe.pure.system.api.vo.SysDictVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 字典管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Mapper
public interface SysDictMapper extends BaseMapper<SysDict> {

    IPage<SysDictVo> selectByPage(IPage page, @Param("sysDict") SysDict sysDict);

    /**
     * 根据字典编码查询字典项
     */
    List<SysDictItemVo> getItemByCode(String dictCode);
}

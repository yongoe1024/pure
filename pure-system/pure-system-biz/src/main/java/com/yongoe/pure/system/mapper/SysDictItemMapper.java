package com.yongoe.pure.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yongoe.pure.system.api.entity.SysDictItem;
import com.yongoe.pure.system.api.vo.SysDictItemVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 字典项
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Mapper
public interface SysDictItemMapper extends BaseMapper<SysDictItem> {

    IPage<SysDictItemVo> selectByPage(IPage page, @Param("sysDictItem") SysDictItem sysDictItem);

}

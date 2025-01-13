package com.yongoe.pure.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yongoe.pure.system.api.entity.SysDept;
import com.yongoe.pure.system.api.vo.SysDeptVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 部门管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Mapper
public interface SysDeptMapper extends BaseMapper<SysDept> {

    IPage<SysDeptVo> selectByPage(IPage page, @Param("sysDept") SysDept sysDept);

}

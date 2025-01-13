package com.yongoe.pure.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yongoe.pure.system.api.entity.SysConfig;
import com.yongoe.pure.system.api.vo.SysConfigVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 系统参数
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Mapper
public interface SysConfigMapper extends BaseMapper<SysConfig> {

    IPage<SysConfigVo> selectByPage(IPage page, @Param("sysConfig") SysConfig sysConfig);

}

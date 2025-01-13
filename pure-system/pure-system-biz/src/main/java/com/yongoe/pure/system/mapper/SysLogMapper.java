package com.yongoe.pure.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yongoe.pure.system.api.entity.SysLog;
import com.yongoe.pure.system.api.vo.SysLogVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 日志管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Mapper
public interface SysLogMapper extends BaseMapper<SysLog> {

    IPage<SysLogVo> selectByPage(IPage page, @Param("sysLog") SysLog sysLog);

}

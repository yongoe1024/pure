package com.yongoe.pure.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yongoe.pure.system.api.entity.SysLog;
import com.yongoe.pure.system.api.vo.SysLogVo;

/**
 * 日志管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
public interface SysLogService extends IService<SysLog> {

    IPage<SysLogVo> selectByPage(IPage page, SysLog sysLog);

}

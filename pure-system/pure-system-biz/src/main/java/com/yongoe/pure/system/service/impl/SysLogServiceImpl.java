package com.yongoe.pure.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yongoe.pure.system.api.entity.SysLog;
import com.yongoe.pure.system.api.vo.SysLogVo;
import com.yongoe.pure.system.mapper.SysLogMapper;
import com.yongoe.pure.system.service.SysLogService;
import org.springframework.stereotype.Service;

/**
 * 日志管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Service
public class SysLogServiceImpl extends ServiceImpl<SysLogMapper, SysLog> implements SysLogService {

    @Override
    public IPage<SysLogVo> selectByPage(IPage page, SysLog sysLog) {
        return baseMapper.selectByPage(page, sysLog);
    }

}

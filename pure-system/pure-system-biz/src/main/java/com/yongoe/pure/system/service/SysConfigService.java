package com.yongoe.pure.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yongoe.pure.system.api.entity.SysConfig;
import com.yongoe.pure.system.api.vo.SysConfigVo;

/**
 * 系统参数
 *
 * @author yongoe
 * @since 2024/07/04
 */
public interface SysConfigService extends IService<SysConfig> {

    IPage<SysConfigVo> selectByPage(IPage page, SysConfig sysConfig);

    /**
     * 清空redis缓存
     */
    void resetConfigCache();
}

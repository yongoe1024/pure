package com.yongoe.pure.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yongoe.pure.system.api.entity.SysConfig;
import com.yongoe.pure.system.api.vo.SysConfigVo;
import com.yongoe.pure.system.mapper.SysConfigMapper;
import com.yongoe.pure.system.service.SysConfigService;
import jakarta.annotation.PostConstruct;
import jakarta.annotation.Resource;
import org.springframework.cache.CacheManager;
import org.springframework.stereotype.Service;

/**
 * 系统参数
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Service
public class SysConfigServiceImpl extends ServiceImpl<SysConfigMapper, SysConfig> implements SysConfigService {
    @Resource
    private CacheManager cacheManager;

    @PostConstruct
    public void loadConfigsIntoCache() {
        init();
    }

    @Override
    public IPage<SysConfigVo> selectByPage(IPage page, SysConfig sysConfig) {
        return baseMapper.selectByPage(page, sysConfig);
    }

    @Override
    public void resetConfigCache() {
        init();
    }

    private void init() {
        cacheManager.getCache("sys_config").clear();
        selectByPage(Page.of(-1, -1), new SysConfig()).getRecords().forEach(config -> {
            cacheManager.getCache("sys_config").put(config.getConfigKey(), config.getConfigValue());
        });
    }

}

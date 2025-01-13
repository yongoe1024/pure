package com.yongoe.pure.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yongoe.pure.system.api.entity.SysDict;
import com.yongoe.pure.system.api.vo.SysDictVo;

/**
 * 字典管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
public interface SysDictService extends IService<SysDict> {

    IPage<SysDictVo> selectByPage(IPage page, SysDict sysDict);

    /**
     * 重置字典缓存
     */
    void resetDictCache();
}

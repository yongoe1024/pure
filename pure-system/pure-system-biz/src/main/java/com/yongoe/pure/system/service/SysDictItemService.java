package com.yongoe.pure.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yongoe.pure.system.api.entity.SysDictItem;
import com.yongoe.pure.system.api.vo.SysDictItemVo;

/**
 * 字典项
 *
 * @author yongoe
 * @since 2024/07/04
 */
public interface SysDictItemService extends IService<SysDictItem> {

    IPage<SysDictItemVo> selectByPage(IPage page, SysDictItem sysDictItem);

}

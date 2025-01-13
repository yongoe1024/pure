package com.yongoe.pure.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yongoe.pure.system.api.entity.SysDictItem;
import com.yongoe.pure.system.api.vo.SysDictItemVo;
import com.yongoe.pure.system.mapper.SysDictItemMapper;
import com.yongoe.pure.system.service.SysDictItemService;
import org.springframework.stereotype.Service;

/**
 * 字典项
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Service
public class SysDictItemServiceImpl extends ServiceImpl<SysDictItemMapper, SysDictItem> implements SysDictItemService {

    @Override
    public IPage<SysDictItemVo> selectByPage(IPage page, SysDictItem sysDictItem) {
        return baseMapper.selectByPage(page, sysDictItem);
    }

}

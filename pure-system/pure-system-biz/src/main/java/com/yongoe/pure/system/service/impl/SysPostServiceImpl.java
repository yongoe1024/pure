package com.yongoe.pure.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yongoe.pure.system.api.entity.SysPost;
import com.yongoe.pure.system.api.vo.SysPostVo;
import com.yongoe.pure.system.mapper.SysPostMapper;
import com.yongoe.pure.system.service.SysPostService;
import org.springframework.stereotype.Service;

/**
 * 岗位管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Service
public class SysPostServiceImpl extends ServiceImpl<SysPostMapper, SysPost> implements SysPostService {

    @Override
    public IPage<SysPostVo> selectByPage(IPage page, SysPost sysPost) {
        return baseMapper.selectByPage(page, sysPost);
    }

}

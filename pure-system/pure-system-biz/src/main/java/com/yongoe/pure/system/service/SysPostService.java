package com.yongoe.pure.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yongoe.pure.system.api.entity.SysPost;
import com.yongoe.pure.system.api.vo.SysPostVo;

/**
 * 岗位管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
public interface SysPostService extends IService<SysPost> {

    IPage<SysPostVo> selectByPage(IPage page, SysPost sysPost);

}

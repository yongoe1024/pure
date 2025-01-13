package com.yongoe.pure.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yongoe.pure.system.api.entity.SysPost;
import com.yongoe.pure.system.api.vo.SysPostVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 岗位管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Mapper
public interface SysPostMapper extends BaseMapper<SysPost> {

    IPage<SysPostVo> selectByPage(IPage page, @Param("sysPost") SysPost sysPost);

}

package com.yongoe.pure.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yongoe.pure.system.api.entity.SysDept;
import com.yongoe.pure.system.api.vo.SysDeptVo;
import com.yongoe.pure.system.mapper.SysDeptMapper;
import com.yongoe.pure.system.service.SysDeptService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 部门管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Service
public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper, SysDept> implements SysDeptService {

    @Override
    public List<SysDeptVo> selectByList(SysDept sysDept) {
        IPage<SysDeptVo> page = baseMapper.selectByPage(Page.of(-1, -1), sysDept);
        return page.getRecords();
    }

}

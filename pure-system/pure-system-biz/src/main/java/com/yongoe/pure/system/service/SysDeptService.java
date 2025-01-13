package com.yongoe.pure.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yongoe.pure.system.api.entity.SysDept;
import com.yongoe.pure.system.api.vo.SysDeptVo;

import java.util.List;

/**
 * 部门管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
public interface SysDeptService extends IService<SysDept> {

    List<SysDeptVo> selectByList(SysDept sysDept);

}

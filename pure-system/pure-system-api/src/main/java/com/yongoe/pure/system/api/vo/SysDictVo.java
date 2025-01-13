package com.yongoe.pure.system.api.vo;

import lombok.Data;

import java.util.List;

/**
 * 字典管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysDictVo {

    /**
     * 字典主键
     */
    private Long dictId;
    /**
     * 字典名称
     */
    private String dictName;
    /**
     * 字典编码
     */
    private String dictCode;
    /**
     * 备注
     */
    private String remark;

    private List<SysDictItemVo> dictItemList;
}
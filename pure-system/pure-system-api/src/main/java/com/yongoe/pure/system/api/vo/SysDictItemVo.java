package com.yongoe.pure.system.api.vo;

import lombok.Data;

/**
 * 字典项
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysDictItemVo {

    /**
     * 编号
     */
    private Long id;
    /**
     * 字典ID
     */
    private Long dictId;
    /**
     * 字典标签
     */
    private String dictLabel;
    /**
     * 字典键值
     */
    private String dictValue;
    /**
     * 回显样式
     */
    private String style;
    /**
     * 字典排序
     */
    private Integer orderNum;
    /**
     * 备注
     */
    private String remark;
}
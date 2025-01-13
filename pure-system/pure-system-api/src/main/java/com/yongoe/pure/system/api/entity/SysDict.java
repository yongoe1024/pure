package com.yongoe.pure.system.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.yongoe.pure.system.api.dto.SysDictDto;
import com.yongoe.pure.system.api.query.SysDictQuery;
import com.yongoe.pure.system.api.vo.SysDictVo;
import io.github.linpeilie.annotations.AutoMapper;
import io.github.linpeilie.annotations.AutoMappers;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 字典管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@AutoMappers({
        @AutoMapper(target = SysDictDto.class),
        @AutoMapper(target = SysDictVo.class),
        @AutoMapper(target = SysDictQuery.class)
})
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_dict")
public class SysDict {

    /**
     * 字典主键
     */
    @TableId(type = IdType.AUTO)
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

    /**
     * 创建者
     */
    @TableField(fill = FieldFill.INSERT)
    private String createBy;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 更新者
     */
    @TableField(fill = FieldFill.UPDATE)
    private String updateBy;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.UPDATE)
    private LocalDateTime updateTime;

    /**
     * 删除标志
     */
    @TableLogic
    private String delFlag;
}
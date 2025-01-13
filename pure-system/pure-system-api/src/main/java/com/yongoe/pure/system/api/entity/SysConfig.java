package com.yongoe.pure.system.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.yongoe.pure.system.api.dto.SysConfigDto;
import com.yongoe.pure.system.api.query.SysConfigQuery;
import com.yongoe.pure.system.api.vo.SysConfigVo;
import io.github.linpeilie.annotations.AutoMapper;
import io.github.linpeilie.annotations.AutoMappers;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 系统参数
 *
 * @author yongoe
 * @since 2024/07/04
 */
@AutoMappers({
        @AutoMapper(target = SysConfigDto.class),
        @AutoMapper(target = SysConfigVo.class),
        @AutoMapper(target = SysConfigQuery.class)
})
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_config")
public class SysConfig {

    /**
     * 参数主键
     */
    @TableId(type = IdType.AUTO)
    private Long configId;

    /**
     * 参数名称
     */
    private String configName;

    /**
     * 参数键名
     */
    private String configKey;

    /**
     * 参数键值
     */
    private String configValue;

    /**
     * 系统内置（1是 0否）
     */
    private String configType;

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
     * 删除标记
     */
    @TableLogic
    private String delFlag;
}
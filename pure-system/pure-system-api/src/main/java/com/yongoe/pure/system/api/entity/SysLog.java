package com.yongoe.pure.system.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.yongoe.pure.system.api.dto.SysLogDto;
import com.yongoe.pure.system.api.query.SysLogQuery;
import com.yongoe.pure.system.api.vo.SysLogVo;
import io.github.linpeilie.annotations.AutoMapper;
import io.github.linpeilie.annotations.AutoMappers;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 日志管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@AutoMappers({
        @AutoMapper(target = SysLogDto.class),
        @AutoMapper(target = SysLogVo.class),
        @AutoMapper(target = SysLogQuery.class)
})
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_log")
public class SysLog {

    /**
     * 编号
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 日志类型(0正常 1异常)
     */
    private String logType;

    /**
     * 日志标题
     */
    private String title;
    /**
     * IP地址
     */
    private String ip;
    /**
     * 操作地址
     */
    private String address;
    /**
     * 设备
     */
    private String os;

    /**
     * 请求方法
     */
    private String method;
    /**
     * 请求人
     */
    private String username;
    /**
     * 请求参数
     */
    private String params;

    /**
     * 执行时间(ms)
     */
    private Long time;

    /**
     * 异常信息
     */
    private String exception;

    /**
     * 创建人
     */
    @TableField(fill = FieldFill.INSERT)
    private String createBy;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 修改人
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
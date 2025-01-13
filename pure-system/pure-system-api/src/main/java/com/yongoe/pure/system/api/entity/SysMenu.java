package com.yongoe.pure.system.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.yongoe.pure.system.api.dto.SysMenuDto;
import com.yongoe.pure.system.api.query.SysMenuQuery;
import com.yongoe.pure.system.api.vo.SysMenuVo;
import io.github.linpeilie.annotations.AutoMapper;
import io.github.linpeilie.annotations.AutoMappers;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 菜单管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@AutoMappers({
        @AutoMapper(target = SysMenuDto.class),
        @AutoMapper(target = SysMenuVo.class),
        @AutoMapper(target = SysMenuQuery.class)
})
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_menu")
public class SysMenu {

    /**
     * 菜单ID
     */
    @TableId(type = IdType.AUTO)
    private Long menuId;

    /**
     * 父菜单ID
     */
    private Long parentId;

    /**
     * 菜单名称
     */
    private String name;

    /**
     * 权限标识
     */
    private String permission;

    /**
     * 路由地址
     */
    private String path;

    /**
     * 组件路径
     */
    private String component;

    /**
     * 路由参数
     */
    private String query;

    /**
     * 是否为外链（0否 1是）
     */
    private String embedded;

    /**
     * 是否缓存（0否 1是）
     */
    private String keepAlive;

    /**
     * 菜单类型（0目录，1菜单，2按钮）
     */
    private String menuType;

    /**
     * 是否可见（0否 1是）
     */
    private String visible;

    /**
     * 菜单状态（0禁用 1可用）
     */
    private String status;

    /**
     * 菜单图标
     */
    private String icon;

    /**
     * 显示顺序
     */
    private Integer orderNum;

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
package com.yongoe.pure.system.api.vo;

import lombok.Data;

/**
 * 菜单管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysMenuVo {

    /**
     * 菜单ID
     */
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
}
package com.yongoe.pure.system.api.query;

import lombok.Data;

/**
 * 菜单管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysMenuQuery {
    /**
     * 菜单名称
     */
    private String name;
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
}
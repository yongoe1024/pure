package com.yongoe.pure.system.api.query;

import lombok.Data;

/**
 * 角色管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysRoleQuery {
    /**
     * 角色名称
     */
    private String roleName;
    /**
     * 角色权限字符
     */
    private String roleCode;
    /**
     * 数据范围(默认0 全部数据)
     */
    private String dataScope;
}
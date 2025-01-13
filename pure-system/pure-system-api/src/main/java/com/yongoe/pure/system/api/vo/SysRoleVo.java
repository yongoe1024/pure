package com.yongoe.pure.system.api.vo;

import lombok.Data;

import java.util.List;

/**
 * 角色管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysRoleVo {
    /**
     * 角色拥有的权限字符串，数据权限拦截器使用，如"user:list,user:create"
     */
    private List<String> permissions;
    /**
     * 角色拥有的菜单ID，角色管理中使用
     */
    private List<Long> menuIds;
    /**
     * 角色拥有的数据权限的部门ID，用于自定义数据权限，角色管理中使用
     */
    private List<Long> deptIds;

    /**
     * 角色ID
     */
    private Long roleId;
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
    /**
     * 备注
     */
    private String remark;

}
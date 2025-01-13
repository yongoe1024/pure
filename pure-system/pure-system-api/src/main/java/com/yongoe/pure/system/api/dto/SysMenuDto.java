package com.yongoe.pure.system.api.dto;

import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.annotation.Update;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Null;
import jakarta.validation.constraints.Pattern;
import lombok.Data;


/**
 * 菜单管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Data
public class SysMenuDto {

    /**
     * 菜单ID
     */
    @Null(groups = {Create.class})
    @NotNull(groups = {Update.class})
    private Long menuId;

    /**
     * 父菜单ID
     */
    @NotNull
    private Long parentId;

    /**
     * 菜单名称
     */
    @NotBlank
    private String name;

    /**
     * 菜单类型（0目录，1菜单，2按钮）
     */
    @NotBlank
    @Pattern(regexp = "^[012]$", message = "只能是0,1")
    private String menuType;

    /**
     * 菜单状态（0禁用 1可用）
     */
    @NotBlank
    @Pattern(regexp = "^[01]$", message = "只能是0,1")
    private String status;

    /**
     * 显示顺序
     */
    @NotNull
    private Integer orderNum;

    /**
     * 权限标识 --仅页面、按钮需要
     */
    private String permission;

    /**
     * 路由地址 --仅页面需要
     */
    private String path;

    /**
     * 组件路径 --仅页面需要
     */
    private String component;

    /**
     * 路由参数 --仅页面需要
     */
    private String query;

    /**
     * 是否为外链（0否 1是） --仅页面需要
     */
    private String embedded;

    /**
     * 是否缓存（0否 1是） --仅页面需要
     */
    private String keepAlive;

    /**
     * 是否可见（0否 1是） --仅页面需要
     */
    private String visible;

    /**
     * 菜单图标 --仅页面需要
     */
    private String icon;


    /**
     * 备注
     */
    private String remark;

}
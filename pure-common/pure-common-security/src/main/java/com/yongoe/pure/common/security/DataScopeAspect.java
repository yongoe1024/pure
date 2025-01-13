package com.yongoe.pure.common.security;

import com.yongoe.pure.common.core.utils.DataScopeThreadLocal;
import com.yongoe.pure.system.api.vo.SysRoleVo;
import com.yongoe.pure.system.api.vo.UserInfo;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * 数据权限切面
 *
 * @author yongoe
 * @since 2024/7/29
 */
@Aspect
@Component
public class DataScopeAspect {

    /**
     * 过滤sql片段放入ThreadLocal中，{}为占位符，在mybatis的数据权限拦截器中替换
     */
    @Around("@annotation(dataScope)")
    public Object check(ProceedingJoinPoint point, DataScope dataScope) throws Throwable {
        String permission = dataScope.value();
        // 因为只在这一处地方用到，就没在拦截器中设置，而是直接在这里设置，下面直接set到ThreadLocal中
        DataScopeThreadLocal.init();
        UserInfo userInfo = UserUtils.getUserInfo();
        if (userInfo == null) {
            throw new RuntimeException("用户未登录,无法数据权限");
        }
        String sql = getSql(userInfo, permission);
        DataScopeThreadLocal.put("dataScope", sql);
        Object proceed = point.proceed();
        // 防止内存溢出
        DataScopeThreadLocal.remove();
        return proceed;
    }

    /**
     * 0 全部数据权限
     * 1 本部门数据权限
     * 2 本部门及以下数据权限
     * 3 仅本人
     * 4 自定义
     */
    private String getSql(UserInfo userInfo, String permission) {
        String sql = "";
        List<SysRoleVo> roles = userInfo.getRoles();
        //拥有接口权限的角色
        List<Integer> dataScopeList = new ArrayList<>();
        List<SysRoleVo> roleList = roles.stream().filter(role -> {
            for (String rolePermission : role.getPermissions()) {
                if (rolePermission.equals(permission)) {
                    dataScopeList.add(Integer.valueOf(role.getDataScope()));
                    return true;
                }
            }
            return false;
        }).toList();
        if (roleList.isEmpty()) {
            return null;
        }
        // 先把dataScope转为int,选出最小的那个role
        Optional<SysRoleVo> min = roleList.stream().min((o1, o2) -> {
            int dataScope1 = Integer.parseInt(o1.getDataScope());
            int dataScope2 = Integer.parseInt(o2.getDataScope());
            return Integer.compare(dataScope1, dataScope2);
        });
        // 取出最小的role（数据权限最大）
        SysRoleVo sysRole = min.get();
        int dataScope = Integer.parseInt(sysRole.getDataScope());
        // 全都是自定义权限4
        if (isAll4DataScope(dataScopeList)) {
            sql = String.format("{}.dept_id IN ( SELECT dept_id FROM sys_role_dept WHERE role_id in (%s))",
                    getRoleIdFor4(roleList));
            return sql;
        }
        if (dataScope == 0) {
            // 全部数据权限
            return null;
        } else if (dataScope == 1) {
            sql = String.format("{}.dept_id = %d ", userInfo.getDeptId());
        } else if (dataScope == 2) {
            // 本部门及以下数据权限
            sql = String.format("{}.dept_id IN ( SELECT dept_id FROM sys_dept WHERE dept_id = %d or find_in_set( %d , ancestors ) ) ",
                    userInfo.getDeptId(), userInfo.getDeptId());
        } else if (dataScope == 3) {
            // 仅本人
            sql = String.format("{}.user_id = %d ", userInfo.getUserId());
        }
        // 自定义权限与上面sql拼接
        if (dataScopeList.contains(4)) {
            //自定义权限
            String fourSql = String.format("{}.dept_id IN ( SELECT dept_id FROM sys_role_dept WHERE role_id in (%s))",
                    getRoleIdFor4(roleList));
            return String.format("%s OR %s", sql, fourSql);
        }

        return sql;
    }

    private boolean isAll4DataScope(List<Integer> dataScopeList) {
        for (Integer dataScope : dataScopeList) {
            if (dataScope != 4) {
                return false;
            }
        }
        return true;
    }

    private String getRoleIdFor4(List<SysRoleVo> list) {
        List<Long> roleIds = new ArrayList<Long>();
        for (SysRoleVo roleVo : list) {
            if (roleVo.getDataScope().equals("4")) {
                roleIds.add(roleVo.getRoleId());
            }
        }
        //roleIds 逗号分隔
        return String.join(",", roleIds.toString());
    }

}
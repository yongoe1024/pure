package com.yongoe.pure.common.security;

import cn.dev33.satoken.stp.StpInterface;
import com.yongoe.pure.system.api.vo.SysRoleVo;
import com.yongoe.pure.system.api.vo.UserInfo;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * satoken注解鉴权实现类
 *
 * @author yongoe
 * @since 2024/7/4
 */
@Component
public class StpInterfaceImpl implements StpInterface {

    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        UserInfo userInfo = UserUtils.getUserInfo();
        if (userInfo == null || CollectionUtils.isEmpty(userInfo.getRoles())) {
            return new ArrayList<>();
        }
        Set<String> permissions = new HashSet<>();
        userInfo.getRoles().forEach(role -> {
            if (CollectionUtils.isEmpty(role.getPermissions())) {
                return;
            }
            permissions.addAll(role.getPermissions());
        });
        return new ArrayList<>(permissions);
    }

    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        UserInfo userInfo = UserUtils.getUserInfo();
        if (userInfo == null || CollectionUtils.isEmpty(userInfo.getRoles())) {
            return new ArrayList<>();
        }
        return userInfo.getRoles().stream().map(SysRoleVo::getRoleCode).toList();
    }

}

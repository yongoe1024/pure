package com.yongoe.pure.common.security;

import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.stp.StpUtil;
import com.yongoe.pure.common.core.entity.R;
import com.yongoe.pure.common.core.utils.SpringContextHolder;
import com.yongoe.pure.system.api.feign.RemoteUserService;
import com.yongoe.pure.system.api.vo.UserInfo;

/**
 * 用户工具类-SaToken
 *
 * @author yongoe
 * @since 2024/7/4
 */
public class UserUtils {

    /**
     * 设置当前登录用户信息-redis-token缓存
     */
    public static void setUserInfo(UserInfo value) {
        // 获取当前会话的 Token-Session
        SaSession session = StpUtil.getTokenSession();
        // 从 Token-Session 中读取、写入数据
        session.set("user", value);
    }

    /**
     * 获取当前登录用户信息-redis-token缓存
     */
    public static UserInfo getUserInfo() {
        // 获取当前会话的 Token-Session
        SaSession session = StpUtil.getTokenSession();
        return (UserInfo) session.get("user");
    }

    /**
     * 获取当前登录用户username
     */
    public static String getUsername() {
        return (String) StpUtil.getLoginId();
    }

    /**
     * 根据username 更新当户信息-redis-token缓存,未登录不操作
     */
    public static void updateUserInfoByUsername(String username) {
        if (StpUtil.isLogin(username)) {
            RemoteUserService service = SpringContextHolder.getBean(RemoteUserService.class);
            R<UserInfo> userInfo = service.getUserInfo(username);
            SaSession session = StpUtil.getSessionByLoginId(username);
            String token = session.getToken();
            SaSession tokenSession = StpUtil.getTokenSessionByToken(token);
            tokenSession.set("user", userInfo.getData());
        }
    }

    /**
     * 获取token的键名
     */
    public static String getTokenName() {
        return StpUtil.getTokenInfo().tokenName;
    }

    /**
     * 获取token的键值
     */
    public static String getTokenValue() {
        return StpUtil.getTokenInfo().tokenValue;
    }

}
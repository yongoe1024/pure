package com.yongoe.pure.system.api.feign;

import com.yongoe.pure.common.core.constants.ServiceName;
import com.yongoe.pure.common.core.entity.R;
import com.yongoe.pure.system.api.dto.LoginDto;
import com.yongoe.pure.system.api.dto.RegisterDto;
import com.yongoe.pure.system.api.vo.UserInfo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * feign接口
 *
 * @author yongoe
 * @since 2024/07/04
 */
@FeignClient(contextId = "RemoteSystemService", name = ServiceName.PURE_SYSTEM_BIZ,path = "/system")
public interface RemoteSystemService {

    /**
     * 注册用户信息
     */
    @PostMapping("/register")
    R<Void> register(@RequestBody RegisterDto dto);

    /**
     * 登录，成功后返回token
     * @return tokenKey+value
     */
    @PostMapping("/login")
    R<String> login(@RequestBody LoginDto dto);

    /**
     * 通过用户名查询用户信息
     */
    @GetMapping("/user/getUserInfo")
    R<UserInfo> getUserInfo(@RequestParam String username);


}

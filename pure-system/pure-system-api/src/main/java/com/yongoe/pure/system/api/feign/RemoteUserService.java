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

import java.util.Map;

/**
 * 用户模块feign接口
 *
 * @author yongoe
 * @since 2024/07/04
 */
@FeignClient(contextId = "RemoteUserService", name = ServiceName.PURE_SYSTEM_BIZ,path = "/system/user")
public interface RemoteUserService {

    /**
     * 通过用户名查询用户信息
     */
    @GetMapping("/getUserInfo")
    R<UserInfo> getUserInfo(@RequestParam String username);

}

package com.yongoe.pure.system.api.feign;

import com.yongoe.pure.common.core.constants.ServiceName;
import com.yongoe.pure.common.core.entity.R;
import com.yongoe.pure.system.api.dto.SysLogDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * 日志模块feign接口
 *
 * @author yongoe
 * @since 2024/07/04
 */
@FeignClient(contextId = "RemoteLogService", name = ServiceName.PURE_SYSTEM_BIZ, path = "/system/log")
public interface RemoteLogService {

    /**
     * 保存日志
     */
    @PostMapping("/add")
    R<Void> add(@RequestBody SysLogDto dto);

}

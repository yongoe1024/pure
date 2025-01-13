package com.yongoe.pure.common.core.feign;

import com.yongoe.pure.common.core.utils.ServletUtils;
import com.yongoe.pure.common.core.utils.StringUtils;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Component;

/**
 * feign 请求拦截器
 *
 * @author yongoe
 * @since 2024/7/5
 */
@Component
public class FeignRequestInterceptor implements RequestInterceptor {

    @Override
    public void apply(RequestTemplate template) {
        HttpServletRequest request = ServletUtils.getRequest();
        if (request != null) {
            template.header("X-Forwarded-For", request.getHeader("X-Forwarded-For"));
            String satoken = request.getHeader("satoken");
            if (StringUtils.isNotEmpty(satoken)) {
                template.header("satoken", satoken);
            }
        }
        template.header("from", "inner");
    }
}
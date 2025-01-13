package com.yongoe.pure.common.core.feign;

import com.yongoe.pure.common.core.utils.ServletUtils;
import jakarta.servlet.http.HttpServletRequest;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

/**
 * 只能feign调用的权限验证切面
 *
 * @author yongoe
 * @since 2024/7/5
 */
@Aspect
@Component
public class InnerAuthAspect {

    @Around("@annotation(innerAuth)")
    public Object around(ProceedingJoinPoint point, InnerAuth innerAuth) throws Throwable {
        HttpServletRequest request = ServletUtils.getRequest();
        String header = null;
        if (request != null) {
            header = request.getHeader("from");
        }
        // 内部请求验证
        if (!"inner".equals(header)) {
            String className = point.getTarget().getClass().getName();
            String methodName = point.getSignature().getName();
            throw new RuntimeException(className + "." + methodName + "没有内部访问权限，不允许访问");
        }
        return point.proceed();
    }

}

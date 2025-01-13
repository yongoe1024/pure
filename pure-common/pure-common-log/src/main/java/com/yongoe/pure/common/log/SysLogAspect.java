package com.yongoe.pure.common.log;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.yongoe.pure.common.core.utils.IPUtils;
import com.yongoe.pure.common.core.utils.ServletUtils;
import com.yongoe.pure.common.security.UserUtils;
import com.yongoe.pure.system.api.dto.SysLogDto;
import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.UserAgent;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.StandardReflectionParameterNameDiscoverer;
import org.springframework.core.annotation.Order;
import org.springframework.expression.EvaluationContext;
import org.springframework.expression.Expression;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.Arrays;

/**
 * 操作日志注解aop
 *
 * @author yongoe
 * @since 2024/7/4
 */
@Aspect
@Component
@Order(100)
public class SysLogAspect {
    private static final Logger log = LoggerFactory.getLogger(SysLogAspect.class);
    private static final ObjectMapper mapper = new ObjectMapper();
    @Resource
    private LogSaveService logSaveService;

    static {
        mapper.configure(SerializationFeature.INDENT_OUTPUT, true);
    }

    @Around("@annotation(sysLog)")
    public Object around(ProceedingJoinPoint point, Log sysLog) throws Throwable {
        String className = point.getTarget().getClass().getName();
        String methodName = point.getSignature().getName();
        String value = sysLog.value();
        String expression = sysLog.spel();
        // 当前表达式存在 SPEL，会覆盖 value 的值
        if (expression != null && !expression.isEmpty()) {
            // 解析SPEL
            MethodSignature signature = (MethodSignature) point.getSignature();
            EvaluationContext context = getContext(point.getArgs(), signature.getMethod());
            try {
                value = getValue(context, expression, String.class);
            } catch (Exception e) {
                // SPEL 表达式异常，获取 value 的值
                log.error("@Log 解析SPEL {} 异常", expression);
            }
        }
        // 开始计算日志
        SysLogDto sysLogDto = new SysLogDto();
        sysLogDto.setLogType("0");
        sysLogDto.setTitle(value);
        sysLogDto.setMethod(className + "." + methodName);
        Long startTime = System.currentTimeMillis();
        Object obj;
        try {
            obj = point.proceed();
        } catch (Exception e) {
            sysLogDto.setLogType("1");
            sysLogDto.setException(e.getMessage());
            throw e;
        } finally {
            Long endTime = System.currentTimeMillis();
            sysLogDto.setTime(endTime - startTime);
            this.initSysLog(sysLogDto, point);
            logSaveService.saveLog(sysLogDto);
        }
        return obj;
    }


    public void initSysLog(SysLogDto sysLogDto, ProceedingJoinPoint point) {
        HttpServletRequest request = ServletUtils.getRequest();
        Object[] args = point.getArgs();
        ObjectNode objectNode = mapper.createObjectNode();
        try {
            // 判断
            sysLogDto.setUsername(UserUtils.getUsername());
        } catch (Exception ignored) {
        }
        objectNode.put("请求参数", Arrays.toString(args));
        if (request != null) {
            String userAgent = request.getHeader("User-Agent");
            sysLogDto.setOs(getOS(userAgent));
            objectNode.put("请求类型", request.getMethod());
            objectNode.put("请求地址", request.getRequestURI());
            objectNode.put("浏览器", userAgent);
            sysLogDto.setIp(IPUtils.getClientIP(request));
        }
        try {
            sysLogDto.setParams(mapper.writeValueAsString(objectNode));
        } catch (JsonProcessingException ignored) {
        }
    }

    /**
     * 获取操作系统
     */
    public String getOS(String str) {
        UserAgent userAgent = UserAgent.parseUserAgentString(str);
        Browser browser = userAgent.getBrowser();
        return browser.getName();
    }

    /**
     * 获取spel 定义的参数值
     *
     * @param context 参数容器
     * @param key     key
     * @param clazz   需要返回的类型
     * @param <T>     返回泛型
     * @return 参数值
     */
    public <T> T getValue(EvaluationContext context, String key, Class<T> clazz) {
        SpelExpressionParser spelExpressionParser = new SpelExpressionParser();
        Expression expression = spelExpressionParser.parseExpression(key);
        return expression.getValue(context, clazz);
    }

    /**
     * 获取参数容器
     *
     * @param arguments       方法的参数列表
     * @param signatureMethod 被执行的方法体
     * @return 装载参数的容器
     */
    public EvaluationContext getContext(Object[] arguments, Method signatureMethod) {
        String[] parameterNames = new StandardReflectionParameterNameDiscoverer().getParameterNames(signatureMethod);
        EvaluationContext context = new StandardEvaluationContext();
        if (parameterNames == null) {
            return context;
        }
        for (int i = 0; i < arguments.length; i++) {
            context.setVariable(parameterNames[i], arguments[i]);
        }
        return context;
    }

}

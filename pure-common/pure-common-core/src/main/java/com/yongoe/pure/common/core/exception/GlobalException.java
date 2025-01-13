package com.yongoe.pure.common.core.exception;

import cn.dev33.satoken.exception.NotLoginException;
import com.yongoe.pure.common.core.entity.R;
import feign.codec.DecodeException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.HashMap;
import java.util.Map;

/**
 * 全局异常
 *
 * @author yongoe
 * @since 2023/1/1
 */
@Slf4j
@RestControllerAdvice
public class GlobalException {

    // 处理数据校验异常
    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    public R handleVaildException(MethodArgumentNotValidException e) {
        BindingResult bindingResult = e.getBindingResult();
        Map<String, String> errorMap = new HashMap<>();
        bindingResult.getFieldErrors().forEach((fieldError) ->
                errorMap.put(fieldError.getField(), fieldError.getDefaultMessage()));
        return R.error(errorMap.toString());
    }

    @ExceptionHandler(value = feign.FeignException.ServiceUnavailable.class)
    public R feign(Throwable throwable) {
        log.error("错误:", throwable);
        return R.error("feign: 服务调用失败");
    }

    @ExceptionHandler(value = DecodeException.class)
    public R feignDecodeException(DecodeException throwable) {
        log.error("错误:", throwable);
        return R.error("feign: " + throwable.getMessage());
    }

    @ExceptionHandler(value = SQLIntegrityConstraintViolationException.class)
    public R sql(SQLIntegrityConstraintViolationException throwable) {
        log.error("错误:", throwable);
        return R.error("SQL完整性约束违规");
    }

    @ExceptionHandler(value = HttpMessageNotReadableException.class)
    public R valueException(HttpMessageNotReadableException throwable) {
        log.error("错误:", throwable);
        return R.error("数据格式有误");
    }

    @ExceptionHandler(value = DataIntegrityViolationException.class)
    public R vdataLongException(DataIntegrityViolationException throwable) {
        log.error("错误:", throwable);
        return R.error("数据完整性违规");
    }

    @ExceptionHandler(value = {BadSqlGrammarException.class})
    public R sqlException(BadSqlGrammarException throwable) {
        log.error("错误:", throwable);
        return R.error("SQL执行错误");
    }

    @ExceptionHandler(value = NotLoginException.class)
    public R handleNotLoginException(NotLoginException throwable) {
        switch (throwable.getCode()) {
            case 11011:
                return R.error(401, "请先登录");
            case 11014:
                return R.error(401, "被顶下线，请重新登录");
            default:
                return R.error(401,"登录错误，" + throwable.getMessage());

        }
    }

    @ExceptionHandler(value = Throwable.class)
    public R handleException(Throwable throwable) {
        log.error("错误:", throwable);
        return R.error("请求失败，" + throwable.getMessage());
    }
}

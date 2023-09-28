package com.grays2.system.config;

import com.grays2.system.tools.R;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolationException;
import java.util.Objects;

/**
 * 全局异常拦截
 *
 * @author sndshun
 * @since 2023-09-27 09:48:00
 */
@RestControllerAdvice
public class ExceptionController {

    //    @ExceptionHandler(Exception.class)
//    public R<?> exception(HttpServletRequest request, Exception e) {
//        return R.error(ResultCode.ERROR).data(e);
//    }
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public R<?> handle(HttpServletRequest request, MethodArgumentNotValidException e) {
        String defaultMessage = Objects.requireNonNull(e.getFieldError()).getDefaultMessage();
        return R.error(ResultCode.PARAM_IS_INVALID, defaultMessage);
    }

    @ExceptionHandler(ConstraintViolationException.class)
    public R<?> handle(HttpServletRequest request, ConstraintViolationException e) {
        return R.error(ResultCode.PARAM_IS_INVALID,e.getMessage());
    }

    @ExceptionHandler(HttpMessageNotReadableException.class)
    public R<?> handle() {
        return R.error("未知请求，请检查参数是否正确");
    }
}

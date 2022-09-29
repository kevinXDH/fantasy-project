package com.jay.fantasy.common;

import com.mysql.cj.jdbc.exceptions.MysqlDataTruncation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 全局异常处理器
 */
@RestControllerAdvice(annotations = {RestController.class, Controller.class})
@Slf4j
public class GlobalExceptionHandler {
    /**
     * 处理自定义异常
     */
    @ExceptionHandler(BusinessException.class)
    public Response<String> businessException(BusinessException e) {
        log.error(e.getMessage());
        return Response.error(e.getMessage());
    }

    @ExceptionHandler(MysqlDataTruncation.class)
    public Response<String> MysqlDataTruncation(MysqlDataTruncation exception){
        if (exception.getMessage().contains("Data too long for column 'phone' at row 1")){
            return Response.error("电话号码不能超过11位");
        }
        return Response.error("服务器异常");
    }
}

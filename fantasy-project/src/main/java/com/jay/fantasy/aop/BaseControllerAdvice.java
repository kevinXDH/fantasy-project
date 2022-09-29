package com.jay.fantasy.aop;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

//@ControllerAdvice("com.jay.fantasy.controller")
public class BaseControllerAdvice {

    /**
     * 统一校验前端传给后端的日期格式是否为 yyyy-MM-dd
     * @param binder
     */
    @InitBinder
    public void InitBinder(WebDataBinder binder) {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        CustomDateEditor dateEditor = new CustomDateEditor(df, true);
        binder.registerCustomEditor(Date.class, dateEditor);
    }

}



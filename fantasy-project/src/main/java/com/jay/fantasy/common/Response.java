package com.jay.fantasy.common;

import lombok.Data;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * 通用响应结果
 */
@Data
public class Response<T> implements Serializable {
    private Integer code;

    private String msg;

    private T data;

    private static final Integer SUCCESS_CODE = 20000;

    private static final Integer ERROR_CODE = 50000;

    private Map map = new HashMap();

    public static <T> Response<T> success(T object) {
        Response<T> response = new Response<>();
        response.data = object;
        response.code = SUCCESS_CODE;
        return response;
    }

    public static <T> Response<T> error(String msg) {
        Response response = new Response();
        response.msg = msg;
        response.code = ERROR_CODE;
        return response;
    }

    public Response<T> add(String key, Object value) {
        this.map.put(key, value);
        return this;
    }

}

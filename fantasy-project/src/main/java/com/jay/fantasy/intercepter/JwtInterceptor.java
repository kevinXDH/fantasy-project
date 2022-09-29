package com.jay.fantasy.intercepter;

import com.auth0.jwt.exceptions.SignatureVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.jay.fantasy.common.BusinessException;
import com.jay.fantasy.utils.jwt.JwtUtil;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * JWT拦截器
 */
public class JwtInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        String token = request.getHeader("token");
        System.err.println(token);
        if (!StringUtils.hasText(token)){
            throw new BusinessException("身份验证失败");
        }
        try{
            JwtUtil.verifyToken(token);
            return true;
        }catch (SignatureVerificationException e){
            e.printStackTrace();
            throw new BusinessException("身份验证失败");
        }catch (TokenExpiredException e){
            e.printStackTrace();
            throw new BusinessException("身份信息过期,请重新登录");
        }catch (Exception e){
            e.printStackTrace();
            throw new BusinessException("身份验证失败");
        }
    }
}

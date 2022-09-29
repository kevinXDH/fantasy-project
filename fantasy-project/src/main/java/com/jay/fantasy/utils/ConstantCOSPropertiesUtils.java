package com.jay.fantasy.utils;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * 在主启动类启动时初始化配置文件中的内容
 */
@Component
public class ConstantCOSPropertiesUtils implements InitializingBean {
    @Value("${tencent.yun.secretid}")
    private String secretId;
    @Value("${tencent.yun.secretkey}")
    private String secretKey;

    public static String Tencent_secretId;
    public static String Tencent_secretKey;

    @Override
    public void afterPropertiesSet() throws Exception {
        Tencent_secretId = secretId;
        Tencent_secretKey = secretKey;
    }
}


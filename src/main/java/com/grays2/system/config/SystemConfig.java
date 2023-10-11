package com.grays2.system.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;

/**
 * @Author sndshun
 * @Date 2023/10/9 16:34
 * @Version 1.0
 * @Description: TODO
 */
@Configuration
public class SystemConfig {
    public static Long jwtExpireTime;
    public static String jwtSecret;
    public static String tokenHeader;
    public static Long tokenExpireTime;

    @Value("${custom.jwt.expire-time}")
    public void setJwtExpireTime(Long param) {
        jwtExpireTime = param;
    }
    @Value("${custom.jwt.secret}")
    public void setJwtSecret(String param) {
        jwtSecret = param;
    }

    @Value("${custom.token.token-header}")
    public void setTokenHeader(String param) {
        tokenHeader = param;
    }

    @Value("${custom.token.expire-time}")
    public void setTokenExpireTime(Long param) {
        tokenExpireTime = param;
    }
}

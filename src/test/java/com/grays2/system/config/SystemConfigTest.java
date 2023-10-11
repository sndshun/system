package com.grays2.system.config;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;

import javax.annotation.Resource;

/**
 * @Author sndshun
 * @Date 2023/10/9 16:50
 * @Version 1.0
 * @Description: TODO
 */
@SpringBootTest
class SystemConfigTest {
    @Test
    public void getInfo() {
        System.out.println(SystemConfig.tokenHeader);
        System.out.println(SystemConfig.tokenExpireTime);
    }

}
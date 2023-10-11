package com.grays2.system.tools;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

import static org.junit.jupiter.api.Assertions.*;

/**
 * @Author sndshun
 * @Date 2023/10/9 22:11
 * @Version 1.0
 * @Description: TODO
 */
@SpringBootTest
class JsonUtilTest {

    @Resource
    private JsonUtil jsonUtil;
    @Test
    public void test() {
        System.out.println(jsonUtil);
    }
}
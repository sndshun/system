package com.grays2.system.config;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * MybatisPlus配置类
 * @author sndshun
 * @since 2023-09-26 03:36:21
 */
@Configuration
public class MybatisPlusConfig {
   @Bean
   public MybatisPlusInterceptor mybatisPlusInterceptor(){
      MybatisPlusInterceptor interceptor=new MybatisPlusInterceptor();
      interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
      return interceptor;
   }
}

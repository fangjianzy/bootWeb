package com.jimmy.framework.core;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.transaction.annotation.EnableTransactionManagement;
/**
 * 项目启动入口程序
 * @author fangjian
 *
 */
@EnableAutoConfiguration(exclude = {
        org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class
})
@EnableTransactionManagement
@ServletComponentScan
@MapperScan("com.jimmy.framework.core.*.dao")
@SpringBootApplication
@EnableCaching
public class BootWebApplication {
	
	public static void main(String[] args) {
        SpringApplication.run(BootWebApplication.class, args);
    }
	
	
}

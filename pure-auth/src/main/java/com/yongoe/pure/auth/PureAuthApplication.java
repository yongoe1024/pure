package com.yongoe.pure.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableDiscoveryClient
@SpringBootApplication(scanBasePackages = {"com.yongoe.pure"})
@EnableFeignClients(basePackages = {"com.yongoe.pure"})
public class PureAuthApplication {

    public static void main(String[] args) {
        SpringApplication.run(PureAuthApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  pure-auth 启动成功   \n");
    }

}

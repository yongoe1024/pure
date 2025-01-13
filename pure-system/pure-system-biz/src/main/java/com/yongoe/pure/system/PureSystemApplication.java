package com.yongoe.pure.system;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableFeignClients(basePackages = {"com.yongoe.pure"})
@EnableDiscoveryClient
@SpringBootApplication(scanBasePackages = {"com.yongoe.pure"})
public class PureSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(PureSystemApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  pure-system 启动成功   \n");
    }

}

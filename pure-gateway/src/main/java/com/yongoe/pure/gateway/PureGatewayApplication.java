package com.yongoe.pure.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication(scanBasePackages = {"com.yongoe.pure"})
public class PureGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(PureGatewayApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  pure-gateway 启动成功  ლ(´ڡ`ლ)ﾞ  \n");
    }

}

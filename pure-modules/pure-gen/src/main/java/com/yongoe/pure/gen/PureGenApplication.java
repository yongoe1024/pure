package com.yongoe.pure.gen;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableDiscoveryClient
@EnableFeignClients(basePackages = {"com.yongoe.pure"})
@SpringBootApplication(scanBasePackages = {"com.yongoe.pure"})
public class PureGenApplication {

    public static void main(String[] args) {
        SpringApplication.run(PureGenApplication.class, args);
    }

}

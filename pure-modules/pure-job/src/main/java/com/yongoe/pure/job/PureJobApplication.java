package com.yongoe.pure.job;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication(scanBasePackages = {"com.yongoe.pure"})
public class PureJobApplication {

    public static void main(String[] args) {
        SpringApplication.run(PureJobApplication.class, args);
    }

}

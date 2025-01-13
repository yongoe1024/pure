package com.yongoe.pure.file;

import org.dromara.x.file.storage.spring.EnableFileStorage;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableFileStorage
@EnableDiscoveryClient
@SpringBootApplication(scanBasePackages = {"com.yongoe.pure"}, exclude = {DataSourceAutoConfiguration.class})
public class PureFileApplication {

    public static void main(String[] args) {
        SpringApplication.run(PureFileApplication.class, args);
    }

}

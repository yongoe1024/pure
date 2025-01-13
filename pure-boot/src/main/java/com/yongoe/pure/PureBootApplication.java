package com.yongoe.pure;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.cloud.openfeign.PureFeignClientsRegistrar;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.Import;

/**
 * boot启动器
 *
 * @author yongoe
 * @since 2024/7/4
 */
@ComponentScan(excludeFilters = {@ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE, classes = {com.yongoe.pure.common.security.SaTokenConfigure.class})})
@EnableFeignClients(basePackages = {"com.yongoe.pure"})
@Import(PureFeignClientsRegistrar.class)
@SpringBootApplication(scanBasePackages = {"com.yongoe.pure"})
public class PureBootApplication {
    public static void main(String[] args) {
        SpringApplication.run(PureBootApplication.class, args);
    }
}
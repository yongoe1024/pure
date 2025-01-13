package com.yongoe.pure.common.log;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.Executor;

/**
 * 异步保存日志线程池
 *
 * @author yongoe
 * @since 2024/7/4
 */
@Configuration
@EnableAsync
public class ThreadPoolConfig {
    /**
     * 获取当前机器的核数, 不一定准确 请根据实际场景 CPU密集 || IO 密集
     */
    public static final int cpuNum = Runtime.getRuntime().availableProcessors();

    @Bean("logSaveExecutor")
    public Executor asyncServiceExecutor() {
        // 线程池任务执行类
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        // 设置核心线程数
        executor.setCorePoolSize(cpuNum);
        // 设置最大线程数
        executor.setMaxPoolSize(cpuNum * 2);
        //配置队列大小
        executor.setQueueCapacity(Integer.MAX_VALUE);
        // 设置线程活跃时间（秒）
        executor.setKeepAliveSeconds(60);
        // 设置默认线程名称
        executor.setThreadNamePrefix("log-save-executor");
        // 等待所有任务结束后再关闭线程池
        executor.setWaitForTasksToCompleteOnShutdown(true);
        //执行初始化
        executor.initialize();
        return executor;
    }
}
package com.yongoe.pure.gen.t;

import com.yongoe.pure.gen.entity.MavenModule;
import com.yongoe.pure.gen.service.GenModuleService;
import com.yongoe.pure.gen.service.GenTableService;
import jakarta.annotation.Resource;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * s
 *
 * @author yongoe
 * @since 2024/8/1
 */
@SpringBootTest
public class Tee {

    @Resource
    private GenTableService genTableService;

    @Test
    public void removeTable() {
    }

    /**
     * 添加表
     */
    @Test
    public void addTable() {
        genTableService.addTable("sys_user", "用户表");
    }

    /**
     * 生成模块结构
     */
    @Test
    public void addModule() {
        MavenModule build = MavenModule.builder()
                .port("8080")
                .mavenModuleName("pure-emp")
                .description("员工模块")
                .genModuleType("multiple")
//                .genModuleType("single")
                .packageName("com.yongoe.pure.emp")
                .moduleName("emp")
                .build();
        GenModuleService.gen(build);
    }

    /**
     * 生成代码
     */
    @Test
    public void genCode() {
        genTableService.gen(1L);
    }
}
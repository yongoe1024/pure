package com.yongoe.pure.gen.service;

import com.yongoe.pure.common.core.utils.StringUtils;
import com.yongoe.pure.gen.constant.GenConstant;
import com.yongoe.pure.gen.entity.MavenModule;
import com.yongoe.pure.gen.utils.GenUtils;
import com.yongoe.pure.gen.utils.MavenUtils;

import java.util.List;
import java.util.Map;

/**
 * 生成新模块的业务逻辑
 *
 * @author yongoe
 * @since 2024/7/31
 */
public class GenModuleService {
    public static String rootPath = null;

    /**
     * 生成pom模块
     * 1. 简单结构
     * 2. 多结构（两层结构）
     */
    public static void gen(MavenModule module) {
        if (rootPath == null)
            throw new RuntimeException("请设置rootPath");
        String type = module.getGenModuleType();
        if (GenConstant.single.equals(type)) {
            genSingle(module);
        } else if (GenConstant.multiple.equals(type)) {
            genMultiple(module);
        }
    }

    /**
     * 生成新pom模块-简单结构
     */
    private static void genSingle(MavenModule module) {
        // pom根文件路径
        String pomRootPath = rootPath + "/" + "/pom.xml";
        // 模块根路径
        String pomModulePath = rootPath + "/" + module.getMavenModuleName() + "/";
        // 基础包路径
        String basePackagePath = module.getPackageName().replace(".", "/");
        // 启动类名称
        String applicationName = "Pure" + StringUtils.firstLetterUpperCase(module.getModuleName()) + "Application";
        List<String> arr = List.of(
                pomModulePath,
                pomModulePath + "src/main/java/" + basePackagePath,
                pomModulePath + "src/test/java/" + basePackagePath,
                pomModulePath + "src/main/resources/",
                pomModulePath + "src/main/java/" + basePackagePath + "/" + "controller",
                pomModulePath + "src/main/java/" + basePackagePath + "/" + "service",
                pomModulePath + "src/main/java/" + basePackagePath + "/" + "mapper",
                pomModulePath + "src/main/java/" + basePackagePath + "/" + "entity"
        );
        GenUtils.createFolder(arr);

        Map<String, Object> dataMap = Map.of(
                "applicationName", applicationName,
                "basePackage", module.getPackageName(),
                "port", module.getPort(),
                "artifactId", module.getMavenModuleName(),
                "description", module.getDescription());
        GenUtils genUtils = new GenUtils(dataMap, "templates-module");
        genUtils.generatorFile("simple-pom.xml.x", pomModulePath + "pom.xml");
        genUtils.generatorFile("application.yml.x", pomModulePath + "src/main/resources/application.yml");
        genUtils.generatorFile("application.java.x", pomModulePath + "src/main/java/" + basePackagePath + "/" + applicationName + ".java");
        GenUtils.copyFile("logback-spring.xml", pomModulePath + "src/main/resources/logback-spring.xml");
        MavenUtils.updatePomModule(module.getMavenModuleName(), pomRootPath);
    }

    /**
     * 生成pom模块-默认结构
     */
    private static void genMultiple(MavenModule module) {
        // pom根文件路径
        String pomRootPath = rootPath + "/" + "/pom.xml";
        // 模块根路径
        String pomModulePath = rootPath + "/" + module.getMavenModuleName() + "/";
        // api模块名称
        String apiModuleName = module.getMavenModuleName() + "-api";
        // biz模块名称
        String bizModuleName = module.getMavenModuleName() + "-biz";
        // API根路径
        String apiRootPath = pomModulePath + apiModuleName + "/";
        // BIZ根路径
        String bizRootPath = pomModulePath + bizModuleName + "/";
        // 基础包路径 & BIZ包路径
        String basePackagePath = module.getPackageName().replace(".", "/");
        // API包路径
        String apiPackagePath = basePackagePath + "/api";
        // 启动类名称
        String applicationName = "Pure" + StringUtils.firstLetterUpperCase(module.getModuleName()) + "Application";
        List<String> arr = List.of(
                pomModulePath,
                apiRootPath,
                bizRootPath,
                apiRootPath + "src/main/java/" + apiPackagePath,
                bizRootPath + "src/main/java/" + basePackagePath,
                bizRootPath + "src/test/java/" + basePackagePath,
                apiRootPath + "src/main/resources/",
                bizRootPath + "src/main/resources/",
                apiRootPath + "src/main/java/" + apiPackagePath + "/" + "dto",
                apiRootPath + "src/main/java/" + apiPackagePath + "/" + "entity",
                apiRootPath + "src/main/java/" + apiPackagePath + "/" + "feign",
                apiRootPath + "src/main/java/" + apiPackagePath + "/" + "query",
                apiRootPath + "src/main/java/" + apiPackagePath + "/" + "vo",
                bizRootPath + "src/main/java/" + basePackagePath + "/" + "controller",
                bizRootPath + "src/main/java/" + basePackagePath + "/" + "service",
                bizRootPath + "src/main/java/" + basePackagePath + "/" + "mapper"
        );
        GenUtils.createFolder(arr);
        Map<String, Object> dataMap = Map.of(
                "applicationName", applicationName,
                "basePackage", module.getPackageName(),
                "apiPackage", apiPackagePath,
                "port", module.getPort(),
                "artifactId", module.getMavenModuleName(),
                "description", module.getDescription());
        GenUtils genUtils = new GenUtils(dataMap, "templates-module");
        // pom 生成
        genUtils.generatorFile("pom.xml.x", pomModulePath + "pom.xml");
        genUtils.generatorFile("api-pom.xml.x", apiRootPath + "pom.xml");
        genUtils.generatorFile("biz-pom.xml.x", bizRootPath + "pom.xml");
        // application 生成
        genUtils.generatorFile("application.yml.x", bizRootPath + "src/main/resources/application.yml");
        genUtils.generatorFile("application.java.x", bizRootPath + "src/main/java/" + basePackagePath + "/" + applicationName + ".java");
        // 配置文件 生成
        GenUtils.copyFile("logback-spring.xml", bizRootPath + "src/main/resources/logback-spring.xml");
        MavenUtils.updatePomModule(module.getMavenModuleName(), pomRootPath);
        MavenUtils.updateDependency(apiModuleName, pomRootPath);
    }
}
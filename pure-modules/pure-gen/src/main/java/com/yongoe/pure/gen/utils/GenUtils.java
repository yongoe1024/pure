package com.yongoe.pure.gen.utils;

import freemarker.cache.FileTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.ResourceUtils;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;

/**
 * 生成工具
 *
 * @author yongoe
 * @since 2024/8/2
 */
@Slf4j
public class GenUtils {
    private final Map<String, Object> dataMap;
    private final Configuration configuration;
    //是否覆盖
    public static boolean isCover = false;

    public GenUtils(Map<String, Object> dataMap, String templateFolder) {
        this.dataMap = dataMap;
        this.configuration = new Configuration(Configuration.DEFAULT_INCOMPATIBLE_IMPROVEMENTS);
        try {
            FileTemplateLoader fileTemplateLoader = new FileTemplateLoader(
                    ResourceUtils.getFile("classpath:" + templateFolder + "/"));
            configuration.setTemplateLoader(fileTemplateLoader);
        } catch (IOException e) {
            log.error(">>>>>>> error: 初始化模版失败：{}", e.getMessage());
        }
    }

    /**
     * 生成文件
     *
     * @param fileName 模版文件名
     * @param target   目标全路径
     */
    public void generatorFile(String fileName, String target) {
        try {
            if (!isCover && Files.exists(Path.of(target))) {
                log.warn(">>>>>>> fail: 生成目标文件失败：已存在{}", target);
                return;
            }
            // 保证目录存在
            Path folder = Path.of(target).getParent();
            Files.createDirectories(folder);
            // 生成文件
            Template template = configuration.getTemplate(fileName);
            File poFile = new File(target);
            Writer poWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(poFile), StandardCharsets.UTF_8));
            template.process(dataMap, poWriter);
            poWriter.close();
            log.info(">>>>>>> success: 生成模板文件成功：{}", target);
        } catch (Exception e) {
            log.error(">>>>>>> error: 生成模板文件失败：{}", e.getMessage());
        }
    }

    /**
     * 批量创建文件夹
     */
    public static void createFolder(List<String> folderList) {
        try {
            for (String folder : folderList) {
                // 检查目录是否已存在（可选）
                if (!isCover && Files.exists(Path.of(folder))) {
                    log.warn(">>>>>>> fail: 创建文件夹失败：已存在{}", folder);
                } else {
                    Files.createDirectories(Path.of(folder));
                    log.info(">>>>>>> success: 创建文件夹成功：{}", folder);
                }
            }
        } catch (IOException e) {
            log.error(">>>>>>> error: 创建文件夹失败：{}", e.getMessage());
        }
    }

    /**
     * 复制文件-从static中
     *
     * @param fileName 要复制的文件名
     * @param target   目标全路径
     */
    public static void copyFile(String fileName, String target) {
        try {
            File file = ResourceUtils.getFile(
                    "classpath:static/" + fileName);
            Files.copy(Path.of(file.getPath()), Path.of(target));
            log.info(">>>>>>> success: 复制文件成功：{} -> {}", file.getPath(), target);
        } catch (Exception e) {
            log.warn(">>>>>>> fail: 复制文件失败：已存在{}", e.getMessage());
        }
    }

}
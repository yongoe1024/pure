package com.yongoe.pure.gen.config;

import com.yongoe.pure.common.core.utils.StringUtils;
import com.yongoe.pure.gen.constant.GenConstant;
import com.yongoe.pure.gen.service.GenCodeService;
import com.yongoe.pure.gen.service.GenModuleService;
import com.yongoe.pure.gen.utils.GenUtils;
import lombok.Data;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

/**
 * 生成器配置
 *
 * @author yongoe
 * @since 2024/8/1
 */
@Data
@Component
@ConfigurationProperties(prefix = "gen")
public class GenConfig {

    private Boolean isCover;

    private String url;

    private String username;

    private String password;

    private String author;

    private String rootPath;

    private String uiSrcPath;

    private MavenModuleConfig[] module;

    @EventListener(ApplicationReadyEvent.class)
    public void handleApplicationReadyEvent(ApplicationReadyEvent event) {
        GenCodeService.rootPath = rootPath;
        GenCodeService.uiSrcPath = uiSrcPath;
        GenModuleService.rootPath = rootPath;
        GenUtils.isCover = isCover;
        assert StringUtils.isNotBlank(url);
        assert StringUtils.isNotBlank(username);
        assert StringUtils.isNotBlank(password);
        assert StringUtils.isNotBlank(author);
        assert StringUtils.isNotBlank(rootPath);
        assert StringUtils.isNotBlank(uiSrcPath);
        assert module != null;
        for (MavenModuleConfig pomModuleConfig : module) {
            String moduleName = pomModuleConfig.getModuleName();
            String packageName = pomModuleConfig.getPackageName();
            String mavenModuleName = pomModuleConfig.getMavenModuleName();
            String genModuleType = pomModuleConfig.getGenModuleType();
            assert StringUtils.isNotBlank(moduleName);
            assert StringUtils.isNotBlank(packageName);
            assert StringUtils.isNotBlank(mavenModuleName);
            assert StringUtils.isNotBlank(genModuleType);
            if (!GenConstant.multiple.equals(genModuleType) && !GenConstant.single.equals(genModuleType)) {
                throw new RuntimeException("yml配置错误: genModuleType不是指定类型");
            }
            if (!packageName.endsWith(moduleName)) {
                throw new RuntimeException("yml配置错误: packageName必须以模块名结尾！");
            }
        }
    }

    @Data
    public static class MavenModuleConfig {

        /**
         * maven模块
         */
        private String mavenModuleName;

        /**
         * 生成maven模块类型（single、multiple）
         * single：单模块
         * multiple：api+biz模块
         */
        private String genModuleType;

        /**
         * 模块名
         */
        private String moduleName;

        /**
         * 完整包路径 例：com.yongoe.pure.emp，结尾必须是moduleName
         */
        private String packageName;
    }
}
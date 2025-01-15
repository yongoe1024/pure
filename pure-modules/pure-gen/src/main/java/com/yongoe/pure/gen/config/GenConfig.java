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
    /**
     * 是否覆盖已存在的文件
     */
    private Boolean isCover;
    /**
     * 数据库连接url
     */
    private String url;
    /**
     * 数据库用户名
     */
    private String username;
    /**
     * 数据库密码
     */
    private String password;
    /**
     * 作者
     */
    private String author;
    /**
     * 生成根路径
     */
    private String rootPath;
    /**
     * 前端生成根路径
     */
    private String uiSrcPath;

    /**
     * 生成目标模块预置信息
     */
    private MavenModuleConfig[] module;

    /**
     * 启动初始化
     */
    @EventListener(ApplicationReadyEvent.class)
    public void handleApplicationReadyEvent(ApplicationReadyEvent event) {
        GenCodeService.rootPath = rootPath;
        GenCodeService.uiSrcPath = uiSrcPath;
        GenModuleService.rootPath = rootPath;
        GenUtils.isCover = isCover;
        // 校验配置，断言
        assert StringUtils.isNotBlank(url);
        assert StringUtils.isNotBlank(username);
        assert StringUtils.isNotBlank(password);
        assert StringUtils.isNotBlank(author);
        assert StringUtils.isNotBlank(rootPath);
        assert StringUtils.isNotBlank(uiSrcPath);
        assert module != null;
        for (MavenModuleConfig item : module) {
            String moduleName = item.getModuleName();
            String packageName = item.getPackageName();
            String mavenModuleName = item.getMavenModuleName();
            String genModuleType = item.getGenModuleType();
            // 断言
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
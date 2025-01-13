package com.yongoe.pure.gen.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yongoe.pure.common.core.utils.StringUtils;
import com.yongoe.pure.gen.constant.GenConstant;
import com.yongoe.pure.gen.entity.GenTable;
import com.yongoe.pure.gen.entity.GenTableColumn;
import com.yongoe.pure.gen.utils.GenUtils;
import lombok.extern.slf4j.Slf4j;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 生成代码的业务逻辑
 *
 * @author yongoe
 * @since 2024/7/31
 */
@Slf4j
public class GenCodeService {
    static ObjectMapper mapper = new ObjectMapper();

    public static String rootPath = null;
    public static String uiSrcPath = null;

    /**
     * 生成代码
     */
    public static void gen(GenTable genTable, List<GenTableColumn> columnList) {
        check(genTable, columnList);
        String type = genTable.getGenModuleType();
        if (type.equals(GenConstant.single)) {
            genSingle(genTable, columnList);
        } else if (type.equals(GenConstant.multiple)) {
            genMultiple(genTable, columnList);
        }
    }


    /**
     * 生成代码-单模块
     */
    private static void genSingle(GenTable genTable, List<GenTableColumn> columnList) {
        Map<String, Object> data = createData(genTable, columnList);
        GenUtils genUtils = new GenUtils(data, "templates-single");
        // 模块根路径
        String pomModulePath = rootPath + "/" + genTable.getMavenModuleName() + "/";
        // 基础包路径
        String basePackagePath = genTable.getPackageName().replace(".", "/");
        // 前端src路径
        String indexPath = uiSrcPath + "/views/" + genTable.getModuleName() + "/" + genTable.getBusinessName() + "/";
        String controller = pomModulePath + "src/main/java/" + basePackagePath + "/controller/";
        String service = pomModulePath + "src/main/java/" + basePackagePath + "/service/";
        String serviceImlp = pomModulePath + "src/main/java/" + basePackagePath + "/service/impl/";
        String mapper = pomModulePath + "src/main/java/" + basePackagePath + "/mapper/";
        String mapperXml = pomModulePath + "src/main/resources/mapper/";
        String entity = pomModulePath + "src/main/java/" + basePackagePath + "/entity/";

        genUtils.generatorFile("controller.java.x", controller + genTable.getEntityName() + "Controller.java");
        genUtils.generatorFile("service.java.x", service + genTable.getEntityName() + "Service.java");
        genUtils.generatorFile("serviceImpl.java.x", serviceImlp + genTable.getEntityName() + "Service.java");
        genUtils.generatorFile("mapper.java.x", mapper + genTable.getEntityName() + "Mapper.java");
        genUtils.generatorFile("mapper.xml.x", mapperXml + genTable.getEntityName() + "Mapper.xml");
        genUtils.generatorFile("entity.java.x", entity + genTable.getEntityName() + ".java");

        genUtils.generatorFile("index.vue.x", indexPath + "index.vue");
        genUtils.generatorFile("api.js.x", indexPath + "api.js");
        genUtils.generatorFile("index.sql.x", indexPath + genTable.getBusinessName() + ".sql");
    }

    /**
     * 生成代码-api&biz
     */
    private static void genMultiple(GenTable genTable, List<GenTableColumn> columnList) {
        Map<String, Object> data = createData(genTable, columnList);
        GenUtils genUtils = new GenUtils(data, "templates-multiple");
        // 模块根路径
        String pomModulePath = rootPath + "/" + genTable.getMavenModuleName() + "/";
        // 前端src路径
        String indexPath = uiSrcPath + "/views/" + genTable.getModuleName() + "/" + genTable.getBusinessName() + "/";
        // 基础包路径
        String basePackagePath = genTable.getPackageName().replace(".", "/");
        // API包路径
        String apiPackagePath = basePackagePath + "/api";
        // api模块名称
        String apiModuleName = genTable.getMavenModuleName() + "-api";
        // biz模块名称
        String bizModuleName = genTable.getMavenModuleName() + "-biz";
        // API根路径
        String apiRootPath = pomModulePath + apiModuleName + "/";
        // BIZ根路径
        String bizRootPath = pomModulePath + bizModuleName + "/";

        String controller = bizRootPath + "src/main/java/" + basePackagePath + "/controller/";
        String service = bizRootPath + "src/main/java/" + basePackagePath + "/service/";
        String serviceImlp = bizRootPath + "src/main/java/" + basePackagePath + "/service/impl/";
        String mapper = bizRootPath + "src/main/java/" + basePackagePath + "/mapper/";
        String mapperXml = bizRootPath + "src/main/resources/mapper/";
        String entity = apiRootPath + "src/main/java/" + apiPackagePath + "/entity/";
        String dto = apiRootPath + "src/main/java/" + apiPackagePath + "/dto/";
        String vo = apiRootPath + "src/main/java/" + apiPackagePath + "/vo/";
        String query = apiRootPath + "src/main/java/" + apiPackagePath + "/query/";

        genUtils.generatorFile("controller.java.x", controller + genTable.getEntityName() + "Controller.java");
        genUtils.generatorFile("service.java.x", service + genTable.getEntityName() + "Service.java");
        genUtils.generatorFile("serviceImpl.java.x", serviceImlp + genTable.getEntityName() + "Service.java");
        genUtils.generatorFile("mapper.java.x", mapper + genTable.getEntityName() + "Mapper.java");
        genUtils.generatorFile("mapper.xml.x", mapperXml + genTable.getEntityName() + "Mapper.xml");
        genUtils.generatorFile("entity.java.x", entity + genTable.getEntityName() + ".java");
        genUtils.generatorFile("dto.java.x", dto + genTable.getEntityName() + "Dto.java");
        genUtils.generatorFile("query.java.x", query + genTable.getEntityName() + "Query.java");
        genUtils.generatorFile("vo.java.x", vo + genTable.getEntityName() + "Vo.java");

        genUtils.generatorFile("index.vue.x", indexPath + "index.vue");
        genUtils.generatorFile("api.js.x", indexPath + "api.js");
        genUtils.generatorFile("index.sql.x", indexPath + genTable.getBusinessName() + ".sql");
    }


    /**
     * 创建数据
     */
    private static Map<String, Object> createData(GenTable genTable, List<GenTableColumn> columnList) {
        Map<String, Object> map = new HashMap<>();
        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        List<String> javaImport = new ArrayList<>();
        for (GenTableColumn column : columnList) {
            if (column.getJavaImport() != null && !column.getJavaImport().trim().isEmpty())
                javaImport.add(column.getJavaImport());
        }
        String packageName = genTable.getPackageName();
        // 实体类模块
        String apiPackageName = genTable.getGenModuleType().equals(GenConstant.single) ? packageName + ".api" : packageName;
        // options反序列化
        if (genTable.getGenCategory().equals(GenConstant.TREE)) {
            try {
                String options = genTable.getOptions();
                Map opMap = mapper.readValue(options, Map.class);
                String parentId = (String) opMap.get("parentId");
                String id = (String) opMap.get("id");
                String name = (String) opMap.get("name");
                map.put("treeParentId", parentId);
                map.put("treeId", id);
                map.put("treeName", name);
            } catch (Exception e) {
                throw new RuntimeException("options反序列化错误");
            }
        }
        // 父菜单
        map.put("menuParentId", genTable.getMenuParentId());
        // 生成日期
        map.put("date", sdf.format(now));
        // 作者
        map.put("author", genTable.getAuthor());
        // java包导入路径
        map.put("javaImport", javaImport);
        // 包名
        map.put("packageName", genTable.getPackageName());
        // api模块包名
        map.put("apiPackageName", apiPackageName);
        // 实体类
        map.put("Entity", genTable.getEntityName());
        map.put("entity", StringUtils.firstLetterLowerCase(genTable.getEntityName()));
        // 业务名中文
        map.put("comment", genTable.getBusinessNameZh());
        map.put("tableName", genTable.getTableName());
        map.put("table", genTable);
        // 字段列表
        map.put("columns", columnList);
        // vue组件路径
        map.put("component", genTable.getModuleName() + "/" + genTable.getBusinessName() + "/index");
        return map;
    }


    /**
     * 检查环境 & 检查参数
     */
    private static void check(GenTable genTable, List<GenTableColumn> columnList) {
        if (StringUtils.isBlank(rootPath) || StringUtils.isBlank(uiSrcPath))
            throw new RuntimeException("请设置参数：rootPath、uiSrcPath");
        String mavenModuleName = genTable.getMavenModuleName();
        String genModuleType = genTable.getGenModuleType();
        String packageName = genTable.getPackageName();
        String moduleName = genTable.getModuleName();
        String tableComment = genTable.getTableComment();
        Long menuParenId = genTable.getMenuParentId();
        // 检测参数 必须在页面配置一次
        if (mavenModuleName == null ||
                genModuleType == null ||
                menuParenId == null ||
                tableComment == null ||
                moduleName == null ||
                packageName == null)
            throw new RuntimeException("参数不能为空");
        if (!packageName.endsWith(moduleName))
            throw new RuntimeException("包名与模块名不相符");
        // 检测 树形结构表 options 配置
        if (genTable.getGenCategory().equals(GenConstant.TREE)) {
            String options = genTable.getOptions();
            if (StringUtils.isBlank(options))
                throw new RuntimeException("树形结构表必须配置options");
            try {
                Map map = mapper.readValue(options, Map.class);
                String parentId = (String) map.get("parentId");
                String id = (String) map.get("id");
                String name = (String) map.get("name");
                if (StringUtils.isBlank(parentId) || StringUtils.isBlank(id) || StringUtils.isBlank(name))
                    throw new RuntimeException("options 参数错误");
            } catch (Exception e) {
                throw new RuntimeException("options反序列化错误");
            }
        }
    }
}
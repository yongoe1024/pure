package com.yongoe.pure.gen.utils;

import lombok.extern.slf4j.Slf4j;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.File;

/**
 * maven工具
 *
 * @author yongoe
 * @since 2024/8/26
 */
@Slf4j
public class MavenUtils {
    /**
     * 更新pom.xml文件,添加modules模块
     *
     * @param tagName     要添加的模块名
     * @param pomFilePath pom.xml文件路径
     */
    public static void updatePomModule(String tagName, String pomFilePath) {
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            File file = new File(pomFilePath);

            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(file);
            // 获取<modules>标签
            NodeList list = doc.getElementsByTagName("modules");
            if (list.getLength() == 1) {
                Element modulesElement = (Element) list.item(0);
                // 检查<module>pure-auth</module>是否已经存在
                NodeList moduleNodes = modulesElement.getElementsByTagName("module");
                for (int i = 0; i < moduleNodes.getLength(); i++) {
                    Element moduleElement = (Element) moduleNodes.item(i);
                    if (tagName.equals(moduleElement.getTextContent().trim())) {
                        log.warn(">>>>>>> fail: pom.xml文件中 modules节点已存在{}模块", tagName);
                        return;
                    }
                }
                // 添加新节点
                Element newModule = doc.createElement("module");
                newModule.setTextContent(tagName);
                modulesElement.appendChild(newModule);
                // 保存更改
                TransformerFactory transformerFactory = TransformerFactory.newInstance();
                Transformer transformer = transformerFactory.newTransformer();
                DOMSource source = new DOMSource(doc);
                StreamResult result = new StreamResult(pomFilePath);
                transformer.transform(source, result);
                log.info(">>>>>>> success: 更新pom.xml文件,添加模块：{}", tagName);
            } else {
                log.warn(">>>>>>> fail: pom.xml文件中 modules节点异常");
            }
        } catch (Exception e) {
            log.error(">>>>>>> error: 更新pom.xml文件失败：{}", e.getMessage());
        }
    }

    /**
     * 更新pom.xml文件,添加dependencyManagement依赖api模块
     *
     * @param apiModule   要添加的模块名
     * @param pomFilePath pom.xml文件路径
     */
    public static void updateDependency(String apiModule, String pomFilePath) {
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            File file = new File(pomFilePath);
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(file);
            // 获取<dependencyManagement>标签
            NodeList dependencyManagementList = doc.getElementsByTagName("dependencyManagement");
            if (dependencyManagementList.getLength() == 1) {
                // 获取<dependencyManagement>标签
                Element dependencyManagement = (Element) dependencyManagementList.item(0);
                NodeList dependenciesList = dependencyManagement.getElementsByTagName("dependencies");
                if (dependenciesList.getLength() == 1) {
                    // 获取<dependencies>标签
                    Element dependencies = (Element) dependenciesList.item(0);
                    NodeList dependency = dependencies.getChildNodes();
                    if (dependency.getLength() != 0) {
                        // 检查<dependency>pure-auth</dependency>是否已经存在
                        for (int i = 0; i < dependency.getLength(); i++) {
                            Node item = dependency.item(i);
                            if (item.getNodeName().equals("dependency")) {
                                NodeList childNodes = item.getChildNodes();
                                for (int j = 0; j < childNodes.getLength(); j++) {
                                    Node item1 = childNodes.item(j);
                                    if (item1.getNodeName().equals("artifactId") && item1.getTextContent().equals(apiModule)) {
                                        log.warn(">>>>>>> fail: pom.xml文件中 dependencyManagement节点已存在{}依赖", apiModule);
                                        return;
                                    }
                                }
                            }
                        }
                        createNode(doc, apiModule, dependencies);
                        // 保存更改
                        TransformerFactory transformerFactory = TransformerFactory.newInstance();
                        Transformer transformer = transformerFactory.newTransformer();
                        DOMSource source = new DOMSource(doc);
                        StreamResult result = new StreamResult(pomFilePath);
                        transformer.transform(source, result);
                        log.info(">>>>>>> success: 更新pom.xml文件,添加dependencyManagement依赖模块：{}", apiModule);
                    } else {
                        log.warn(">>>>>>> fail: pom.xml文件中 dependencyManagement-dependencies节点没有子节点，怎么可能？！");
                    }
                } else {
                    log.warn(">>>>>>> fail: pom.xml文件中 dependencyManagement-dependencies节点异常");
                }
            } else {
                log.warn(">>>>>>> fail: pom.xml文件中 dependencyManagement节点异常");
            }
        } catch (Exception e) {
            log.error(">>>>>>> error: 更新pom.xml文件dependency失败：{}", e.getMessage());
        }
    }

    /**
     * 创建dependency节点,并添加到dependencyManagement节点中
     *
     * @param document  xml文档
     * @param apiModule 依赖模块名
     * @param parent    添加的父节点
     */
    private static void createNode(Document document, String apiModule, Element parent) {
        Element dependency = document.createElement("dependency");
        Element groupId = document.createElement("groupId");
        groupId.setTextContent("com.yongoe");
        Element artifactId = document.createElement("artifactId");
        artifactId.setTextContent(apiModule);
        Element version = document.createElement("version");
        version.setTextContent("${revision}");
        // 构建节点属性
        dependency.appendChild(document.createTextNode("\n"));
        dependency.appendChild(groupId);
        dependency.appendChild(document.createTextNode("\n"));
        dependency.appendChild(artifactId);
        dependency.appendChild(document.createTextNode("\n"));
        dependency.appendChild(version);
        dependency.appendChild(document.createTextNode("\n"));
        // 添加到父节点
        parent.appendChild(dependency);
        parent.appendChild(document.createTextNode("\n"));
    }
}
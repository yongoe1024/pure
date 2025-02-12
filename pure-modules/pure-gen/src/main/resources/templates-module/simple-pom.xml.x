<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>com.yongoe</groupId>
        <artifactId>pure</artifactId>
        <version>${r"${revision}"}</version>
    </parent>

    <artifactId>${artifactId}</artifactId>
    <description>${description}</description>

    <dependencies>
        <dependency>
            <groupId>com.yongoe</groupId>
            <artifactId>pure-common-log</artifactId>
        </dependency>
        <dependency>
            <groupId>com.yongoe</groupId>
            <artifactId>pure-common-security</artifactId>
        </dependency>
        <dependency>
            <groupId>com.yongoe</groupId>
            <artifactId>pure-common-core</artifactId>
        </dependency>
        <!--undertow容器，性能强于tomcat-->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-undertow</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
            <exclusions>
                <exclusion>
                    <artifactId>spring-boot-starter-tomcat</artifactId>
                    <groupId>org.springframework.boot</groupId>
                </exclusion>
            </exclusions>
        </dependency>
        <!--注册中心客户端-->
        <dependency>
            <groupId>com.alibaba.cloud</groupId>
            <artifactId>spring-cloud-starter-alibaba-nacos-discovery</artifactId>
        </dependency>
        <!--配置中心客户端-->
        <dependency>
            <groupId>com.alibaba.cloud</groupId>
            <artifactId>spring-cloud-starter-alibaba-nacos-config</artifactId>
        </dependency>
    </dependencies>

</project>
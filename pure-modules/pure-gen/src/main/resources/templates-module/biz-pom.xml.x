<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>com.yongoe</groupId>
        <artifactId>${artifactId}</artifactId>
        <version>${r"${revision}"}</version>
    </parent>

    <artifactId>${artifactId}-biz</artifactId>
    <description>${description}-业务</description>

    <dependencies>
        <!--日志-->
        <dependency>
            <groupId>com.yongoe</groupId>
            <artifactId>pure-common-log</artifactId>
        </dependency>
        <!--        ${description}模块API-->
        <dependency>
            <groupId>com.yongoe</groupId>
            <artifactId>${artifactId}-api</artifactId>
        </dependency>
        <!--        项目核心模块-->
        <dependency>
            <groupId>com.yongoe</groupId>
            <artifactId>pure-common-core</artifactId>
        </dependency>
        <!--        数据、访问权限模块-->
        <dependency>
            <groupId>com.yongoe</groupId>
            <artifactId>pure-common-security</artifactId>
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
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>
</project>
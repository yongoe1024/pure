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

    <artifactId>${artifactId}-api</artifactId>
    <description>${description}-api</description>

    <dependencies>
        <dependency>
            <groupId>com.yongoe</groupId>
            <artifactId>pure-common-core</artifactId>
        </dependency>
    </dependencies>

</project>
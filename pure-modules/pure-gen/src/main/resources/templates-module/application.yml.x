server:
  port: ${port}

spring:
  application:
    name: @artifactId@
  cloud:
    nacos:
      username: @nacos.username@
      password: @nacos.password@
      discovery:
        server-addr: @nacos.addr@
        namespace: @nacos.namespace@
        group: @nacos.group@
      config:
        server-addr: @nacos.addr@
        namespace: @nacos.namespace@
        group: @nacos.group@
  config:
    import:
      - nacos:${r"${spring.application.name}.yml"}
      - nacos:application.yml
      - nacos:sa-token.yml
      - nacos:redis.yml
      - nacos:datasource.yml


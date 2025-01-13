package com.yongoe.pure.common.log;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yongoe.pure.common.core.utils.IPUtils;
import com.yongoe.pure.common.core.utils.StringUtils;
import com.yongoe.pure.system.api.dto.SysLogDto;
import com.yongoe.pure.system.api.feign.RemoteLogService;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * log异步保存
 *
 * @author yongoe
 * @since 2024/7/8
 */
@Service
@Slf4j
public class LogSaveService {
    static ObjectMapper mapper = new ObjectMapper();
    @Resource
    private RemoteLogService remoteLogService;

    /**
     * 异步保存日志
     */
    @Async("logSaveExecutor")
    public void saveLog(SysLogDto sysLogDto) {
        // 判断是否内网ip
        if (IPUtils.isInnerIPV4(sysLogDto.getIp()) || IPUtils.isInnerIPV6(sysLogDto.getIp())) {
            sysLogDto.setAddress("内网IP");
        } else {
            String removeAddress = getAddressByHttp(sysLogDto.getIp());
            sysLogDto.setAddress(removeAddress);
        }
        remoteLogService.add(sysLogDto);
    }

    /**
     * 通过http请求获取地理位置
     */
    private String getAddressByHttp(String ip) {
        String address = "未知地址";
        try {
            String result = getRequest(ip);
            JsonNode jsonNode = mapper.readTree(result);
            String pro = jsonNode.get("pro").asText();
            String city = jsonNode.get("city").asText();
            String addr = jsonNode.get("addr").asText();
            String format = String.format("%s %s", pro, city);
            if (StringUtils.isBlank(format)) {
                address = addr;
            } else {
                address = format;
            }
        } catch (Exception e) {
            log.error("获取地理位置异常 ", e);
        }
        return address;
    }


    private String getRequest(String ip) throws IOException {
        // 目标URL
        String url = String.format("http://whois.pconline.com.cn/ipJson.jsp?json=true&ip=%s", ip);
        // 创建一个URL对象
        URL myUrl = new URL(url);
        // 打开一个到URL的连接
        HttpURLConnection conn = (HttpURLConnection) myUrl.openConnection();
        // 设置请求方法为GET
        conn.setRequestMethod("GET");
        // 读取响应内容
        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String inputLine;
        StringBuilder response = new StringBuilder();
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();
        // 关闭连接
        conn.disconnect();
        return response.toString();
    }
}
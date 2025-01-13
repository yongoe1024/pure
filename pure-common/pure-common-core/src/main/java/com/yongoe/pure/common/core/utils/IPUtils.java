package com.yongoe.pure.common.core.utils;

import jakarta.servlet.http.HttpServletRequest;

import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * ip 工具
 *
 * @author yongoe
 * @since 2024/7/8
 */
public class IPUtils {

    /**
     * 获取客户端IP地址
     *
     * @param request 请求对象
     * @return IP地址
     */
    public static String getClientIP(HttpServletRequest request) {
        String[] headers = new String[]{"X-Forwarded-For", "X-Real-IP", "Proxy-Client-IP", "WL-Proxy-Client-IP", "HTTP_CLIENT_IP", "HTTP_X_FORWARDED_FOR"};
        for (String header : headers) {
            String ip = request.getHeader(header);
            if (!isUnknown(ip)) {
                return IPUtils.getMultistageReverseProxyIp(ip);
            }
        }
        return IPUtils.getMultistageReverseProxyIp(request.getRemoteAddr());
    }

    /**
     * 判定是否为内网IPv6
     * 检查前两个字节是否为0xFD
     */
    public static boolean isInnerIPV6(String ip) {
        try {
            Inet6Address address = (Inet6Address) Inet6Address.getByName(ip);
            byte[] bytes = address.getAddress();
            // 检查前两个字节（即fd）
            return (bytes[0] & 0xFF) == 0xFD;
        } catch (Exception e) {
            // 如果地址无效，返回false
            return false;
        }
    }

    /**
     * 判定是否为内网IPv4 私有IP：
     * A类 10.0.0.0-10.255.255.255
     * B类 172.16.0.0-172.31.255.255
     * C类 192.168.0.0-192.168.255.255
     * 127.0.0.1
     */
    public static boolean isInnerIPV4(String ipAddress) {
        if ("127.0.0.1".equals(ipAddress))
            return true;
        try {
            byte[] ipAddressInByte = InetAddress.getByName(ipAddress).getAddress();
            // 检查10.0.0.0/8
            if (ipAddressInByte[0] == 10) {
                return true;
            }
            // 检查172.16.0.0/12
            if (ipAddressInByte[0] == 172 && (ipAddressInByte[1] & 0xF0) == 16) {
                return true;
            }
            // 检查192.168.0.0/16
            if (ipAddressInByte[0] == 192 && ipAddressInByte[1] == 168) {
                return true;
            }
            // 如果都不匹配，则不是私有IP
            return false;
        } catch (UnknownHostException e) {
            return false;
        }

    }


    /**
     * 从多级反向代理中获得第一个非unknown IP地址
     */
    private static String getMultistageReverseProxyIp(String ip) {
        // 多级反向代理检测
        if (ip != null && ip.indexOf(ip, ',') > 0) {
            final List<String> ips = IPUtils.splitAndTrim(ip, ",");
            for (final String subIp : ips) {
                if (!isUnknown(subIp)) {
                    ip = subIp;
                    break;
                }
            }
        }
        return ip;
    }

    private static boolean isUnknown(String checkString) {
        return StringUtils.isBlank(checkString) || "unknown".equalsIgnoreCase(checkString);
    }

    /**
     * 切分字符串，去除切分后每个元素两边的空白符，去除空白项
     */
    private static List<String> splitAndTrim(String str, String separator) {
        if (StringUtils.isBlank(str)) {
            return new ArrayList<>();
        }
        String[] split = str.split(separator);
        return Arrays.stream(split).filter(StringUtils::isBlank).toList();
    }

}
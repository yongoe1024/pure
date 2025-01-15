package com.yongoe.pure.common.core.utils;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.read.listener.ReadListener;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * excel工具类
 *
 * @author yongoe
 * @since 2023/1/1
 */
public class ExcelUtils {

    /**
     * 导入excel
     * 不安全，一次性读到list中，容易造成内存溢出
     *
     * @param file      文件流
     * @param classname 实体类名
     */
    public static <T> List<T> read(MultipartFile file, Class<T> classname) throws IOException {
        List<T> list = new ArrayList<>();
        EasyExcel.read(file.getInputStream(), classname, new ReadListener<T>() {
            @Override
            public void invoke(T o, AnalysisContext analysisContext) {
                list.add(o);
            }

            @Override
            public void doAfterAllAnalysed(AnalysisContext analysisContext) {

            }
        }).sheet().doRead();
        return list;
    }

    /**
     * 导出excel
     *
     * @param response  响应流
     * @param list      实体类集合
     * @param classname 实体类名
     */
    public static <T> void export(HttpServletResponse response, List<T> list, Class<T> classname) throws IOException {
        // 这里注意 有同学反应使用swagger 会导致各种问题，请直接用浏览器或者用postman
        response.setContentType("application/octet-stream");
        response.setCharacterEncoding("utf-8");
        // 这里URLEncoder.encode可以防止中文乱码 当然和easyexcel没有关系
        String fileName = UUID.randomUUID().toString();
        response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");
        EasyExcel.write(response.getOutputStream(), classname).sheet("sheet1").doWrite(list);
    }

    /**
     * 导出excel+文件名
     *
     * @param response  响应流
     * @param list      实体类集合
     * @param classname 实体类名
     * @param fileName  文件名
     */
    public static <T> void export(HttpServletResponse response, List<T> list, Class<T> classname, String fileName) throws IOException {
        // 这里注意 有同学反应使用swagger 会导致各种问题，请直接用浏览器或者用postman
        response.setContentType("application/octet-stream");
        response.setCharacterEncoding("utf-8");
        // 这里URLEncoder.encode可以防止中文乱码 当然和easyexcel没有关系
        String name = URLEncoder.encode(fileName, StandardCharsets.UTF_8).replaceAll("\\+", "%20");
        response.setHeader("Content-disposition", "attachment;filename=" + name + ".xlsx");
        EasyExcel.write(response.getOutputStream(), classname).sheet("sheet1").doWrite(list);
    }
}

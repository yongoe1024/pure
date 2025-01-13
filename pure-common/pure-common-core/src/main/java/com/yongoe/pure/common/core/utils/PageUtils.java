package com.yongoe.pure.common.core.utils;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.github.linpeilie.Converter;
import jakarta.servlet.http.HttpServletRequest;
import lombok.Data;

import java.util.List;

/**
 * page工具类
 *
 * @author yongoe
 * @since 2023/1/1
 */
@Data
public class PageUtils {
    /**
     * 总记录数
     */
    private int total;
    /**
     * 每页记录数
     */
    private int size;
    /**
     * 当前页数
     */
    private int current;
    /**
     * 总页数
     */
    private int pages;
    /**
     * 列表数据
     */
    private List<?> list;

    /**
     * 分页
     */
    public PageUtils(List<?> list, long total, long size, long current, long pages) {
        this.list = list;
        this.total = (int) total;
        this.size = (int) size;
        this.current = (int) current;
        this.pages = (int) pages;
    }

    /**
     * 分页
     */
    public PageUtils(IPage<?> page) {
        this.list = page.getRecords();
        this.total = (int) page.getTotal();
        this.size = (int) page.getSize();
        this.current = (int) page.getCurrent();
        this.pages = (int) page.getPages();
    }

    /**
     * 分页,直接把IPage<Entity> 转为 IPage<VO>
     */
    public <S, T> PageUtils(IPage<S> page, Class<T> cls) {
        this.total = (int) page.getTotal();
        this.size = (int) page.getSize();
        this.current = (int) page.getCurrent();
        this.pages = (int) page.getPages();
        Converter converter = SpringContextHolder.getBean(Converter.class);
        List<S> records = page.getRecords();
        this.list = converter.convert(records, cls);
    }

    /**
     * 从HttpServletRequest获取分页参数
     */
    public static Page<?> getPage() {
        HttpServletRequest request = ServletUtils.getRequest();
        Page page;
        try {
            long current = Long.parseLong(request.getParameter("current"));
            long size = Long.parseLong(request.getParameter("size"));
            page = Page.of(current, size);
        } catch (Exception e) {
            page = Page.of(1, 10);
        }
        return page;
    }

}

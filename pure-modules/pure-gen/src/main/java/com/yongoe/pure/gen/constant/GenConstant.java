package com.yongoe.pure.gen.constant;

/**
 * 常量
 *
 * @author yongoe
 * @since 2024/8/26
 */
public interface GenConstant {

    /**
     * 字段查询类型，默认EQ，更新的接口也做了正则判断
     */
    String EQ = "=";
    String GT = ">";
    String LT = "<";
    String GTE = ">=";
    String LTE = "<=";
    String LIKE = "LIKE";
    String BETWEEN = "BETWEEN";

    /**
     * 是否
     */
    String YES = "1";
    String NO = "0";

    /**
     * 表单显示类型，默认input，更新的接口也做了正则判断
     */
    String input = "文本框";
    String textarea = "文本域";
    String select = "下拉框";
    String checkbox = "复选框";
    String radio = "单选框";
    String date = "日期";
    String datetime = "日期时间";
    String time = "时间";
    String imageUpload = "图片上传";
    String fileUpload = "文件上传";
    String editor = "富文本";

    /**
     * 普通结构
     */
    String CRUD = "crud";
    /**
     * 树形结构
     */
    String TREE = "tree";

    /**
     * 生成项目结构
     */
    String single = "single";
    String multiple = "multiple";

}

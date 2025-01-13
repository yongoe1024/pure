package com.yongoe.pure.gen.constant;

/**
 * 特殊字段的预设信息
 *
 * @author yongoe
 * @since 2024/8/1
 */
public enum ColumnInfo {

    a("createBy", "String", "0", "0", "0", "0", "0"),
    b("createTime", "LocalDateTime", "0", "0", "0", "0", "0"),
    c("updateBy", "String", "0", "0", "0", "0", "0"),
    d("updateTime", "LocalDateTime", "0", "0", "0", "0", "0"),
    e("delFlag", "String", "0", "0", "0", "0", "0"),
    f("remark", "String", "0", "1", "1", "1", "1");


    /**
     * java字段名
     */
    public final String javaFieldName;

    /**
     * java类型
     */
    public final String javaType;
    /**
     * 是否必填
     */
    public final String isRequired;
    /**
     * 是否插入
     */
    public final String isInsert;
    /**
     * 是否编辑
     */
    public final String isEdit;
    /**
     * 是否列表
     */
    public final String isList;
    /**
     * 是否查询
     */
    public final String isQuery;

    ColumnInfo(String javaFieldName, String javaType, String isRequired, String isInsert, String isEdit, String isList, String isQuery) {
        this.javaFieldName = javaFieldName;
        this.javaType = javaType;
        this.isRequired = isRequired;
        this.isInsert = isInsert;
        this.isEdit = isEdit;
        this.isList = isList;
        this.isQuery = isQuery;
    }

    public static ColumnInfo findByFieldName(String javaFieldName) {
        for (ColumnInfo myEnum : ColumnInfo.values()) {
            if (myEnum.javaFieldName.equals(javaFieldName)) {
                return myEnum;
            }
        }
        return null;
    }
}
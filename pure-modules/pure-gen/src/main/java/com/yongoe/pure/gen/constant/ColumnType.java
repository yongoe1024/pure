package com.yongoe.pure.gen.constant;

/**
 * JDBC类型与Java类型映射
 * 用于覆盖默认的JDBC类型与Java类型映射
 *
 * @author yongoe
 * @since 2024/8/1
 */
public enum ColumnType {

    /**
     * 示例: VARCHAR默认就使用String，不需要额外配置
     * 带长度的优先级高于不带长度的
     */
    test1("VARCHAR", "String", null),
    test2("VARCHAR(100)", "String", null);


    public final String sqlType;
    public final String javaType;
    public final String javaImport;

    ColumnType(String sqlType, String javaType, String javaImport) {
        this.sqlType = sqlType;
        this.javaType = javaType;
        this.javaImport = javaImport;
    }

    /**
     * 根据sqlType获取javaType，带长度优先
     *
     * @param sqlType sqlType
     * @return javaType
     */
    public static ColumnType findByType(String sqlType) {
        for (ColumnType myEnum : ColumnType.values()) {
            if (sqlType.equals(myEnum.sqlType) && myEnum.javaType != null) {
                return myEnum;
            }
        }
        for (ColumnType myEnum : ColumnType.values()) {
            String[] split = myEnum.sqlType.split("\\(");
            if (split.length == 1 && sqlType.equals(split[0]) && myEnum.javaType != null) {
                return myEnum;
            }
        }
        return null;
    }

}

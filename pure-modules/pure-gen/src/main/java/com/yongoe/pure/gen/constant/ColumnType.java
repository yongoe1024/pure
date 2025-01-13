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
    test2("VARCHAR(100)", "String", null),

    /**
     * 全部类型，需要什么加什么
     */
    INSTANCE1("ARRAY", null, null),
    INSTANCE2("BIT", null, null),
    INSTANCE3("TINYINT", null, null),
    INSTANCE4("SMALLINT", null, null),
    INSTANCE5("INTEGER", null, null),
    INSTANCE6("BIGINT", null, null),
    INSTANCE7("FLOAT", null, null),
    INSTANCE8("REAL", null, null),
    INSTANCE9("DOUBLE", null, null),
    INSTANCE10("NUMERIC", null, null),
    INSTANCE11("DECIMAL", null, null),
    INSTANCE12("CHAR", null, null),
    INSTANCE13("VARCHAR", null, null),
    INSTANCE14("LONGVARCHAR", null, null),
    INSTANCE15("DATE", null, null),
    INSTANCE16("TIME", null, null),
    INSTANCE17("TIMESTAMP", null, null),
    INSTANCE18("BINARY", null, null),
    INSTANCE19("VARBINARY", null, null),
    INSTANCE20("LONGVARBINARY", null, null),
    INSTANCE21("NULL", null, null),
    INSTANCE22("OTHER", null, null),
    INSTANCE23("BLOB", null, null),
    INSTANCE24("CLOB", null, null),
    INSTANCE25("BOOLEAN", null, null),
    INSTANCE26("CURSOR", null, null),
    INSTANCE27("UNDEFINED", null, null),
    INSTANCE28("NVARCHAR", null, null),
    INSTANCE29("NCHAR", null, null),
    INSTANCE30("NCLOB", null, null),
    INSTANCE31("STRUCT", null, null),
    INSTANCE32("JAVA_OBJECT", null, null),
    INSTANCE33("DISTINCT", null, null),
    INSTANCE34("REF", null, null),
    INSTANCE35("DATALINK", null, null),
    INSTANCE36("ROWID", null, null),
    INSTANCE37("LONGNVARCHAR", null, null),
    INSTANCE38("SQLXML", null, null),
    INSTANCE39("DATETIMEOFFSET", null, null),
    INSTANCE40("TIME_WITH_TIMEZONE", null, null),
    INSTANCE41("TIMESTAMP_WITH_TIMEZONE", null, null);


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

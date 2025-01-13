package com.yongoe.pure.common.core.mybatis;

import com.baomidou.mybatisplus.extension.plugins.handler.MultiDataPermissionHandler;
import com.yongoe.pure.common.core.utils.DataScopeThreadLocal;
import com.yongoe.pure.common.core.utils.StringUtils;
import lombok.extern.slf4j.Slf4j;
import net.sf.jsqlparser.JSQLParserException;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.parser.CCJSqlParserUtil;
import net.sf.jsqlparser.schema.Table;

/**
 * 数据权限
 *
 * @author yongoe
 * @since 2023/1/1
 */
@Slf4j
public class CustomDataPermissionHandler implements MultiDataPermissionHandler {

    @Override
    public Expression getSqlSegment(Table table, Expression where, String mappedStatementId) {
        // 在此处编写自定义数据权限逻辑
        try {
            // 从线程变量中获取数据权限的sql片段
            String dataScope = (String) DataScopeThreadLocal.get("dataScope");
            if (StringUtils.isBlank(dataScope))
                return null;
            String replace = dataScope.replace("{}", table.getAlias().getName());
            return CCJSqlParserUtil.parseCondExpression(replace);
        } catch (JSQLParserException e) {
            log.error("解析数据权限SQL片段失败", e);
            return null;
        }
    }
}
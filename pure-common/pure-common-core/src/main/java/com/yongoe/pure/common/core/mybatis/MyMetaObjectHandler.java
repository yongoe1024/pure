package com.yongoe.pure.common.core.mybatis;

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;


/**
 * mybatis-plus插入时间字段
 *
 * @author yongoe
 * @since 2023/1/1
 */
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    @Override
    public void insertFill(MetaObject metaObject) {
        if (StpUtil.isLogin()) {
            this.setFieldValByName("createTime", LocalDateTime.now(), metaObject);
            this.setFieldValByName("createBy", StpUtil.getLoginIdAsString(), metaObject);
        } else {
            this.setFieldValByName("createTime", LocalDateTime.now(), metaObject);
        }
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        if (StpUtil.isLogin()) {
            this.setFieldValByName("updateTime", LocalDateTime.now(), metaObject);
            this.setFieldValByName("updateBy", StpUtil.getLoginIdAsString(), metaObject);
        } else {
            this.setFieldValByName("updateTime", LocalDateTime.now(), metaObject);
        }
    }
}


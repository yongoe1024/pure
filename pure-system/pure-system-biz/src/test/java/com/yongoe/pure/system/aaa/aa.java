package com.yongoe.pure.system.aaa;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.pure.system.api.vo.SysRoleVo;
import com.yongoe.pure.system.api.vo.SysUserVo;
import com.yongoe.pure.system.mapper.SysRoleMapper;
import com.yongoe.pure.system.service.SysUserService;
import jakarta.annotation.Resource;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * @author yongoe
 * @since 2024/7/6
 */
@SpringBootTest
public class aa {

    @Resource
    private SysRoleMapper sysRoleMapper;
    @Resource
    SysUserService sysUserService;

    @Test
    public void test() {
        SysRoleVo sysRoleVo = sysRoleMapper.selectRoleByUserId(1L);
        System.out.println(sysRoleVo);
    }

}
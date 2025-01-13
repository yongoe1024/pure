package com.yongoe.pure.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yongoe.pure.system.api.entity.SysDict;
import com.yongoe.pure.system.api.entity.SysDictItem;
import com.yongoe.pure.system.api.vo.SysDictItemVo;
import com.yongoe.pure.system.api.vo.SysDictVo;
import com.yongoe.pure.system.mapper.SysDictMapper;
import com.yongoe.pure.system.service.SysDictItemService;
import com.yongoe.pure.system.service.SysDictService;
import jakarta.annotation.PostConstruct;
import jakarta.annotation.Resource;
import org.springframework.cache.CacheManager;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 字典管理
 *
 * @author yongoe
 * @since 2024/07/04
 */
@Service
public class SysDictServiceImpl extends ServiceImpl<SysDictMapper, SysDict> implements SysDictService {
    @Resource
    private CacheManager cacheManager;
    @Resource
    private SysDictItemService sysDictItemService;

    @PostConstruct
    public void loadConfigsIntoCache() {
        init();
    }

    @Override
    public IPage<SysDictVo> selectByPage(IPage page, SysDict sysDict) {
        IPage<SysDictVo> sysDictVoPage = baseMapper.selectByPage(page, sysDict);
        for (SysDictVo sysDictVo : sysDictVoPage.getRecords()) {
            SysDictItem sysDictItem = new SysDictItem();
            sysDictItem.setDictId(sysDictVo.getDictId());
            IPage<SysDictItemVo> item = sysDictItemService.selectByPage(Page.of(-1, -1), sysDictItem);
            sysDictVo.setDictItemList(item.getRecords());
        }
        return sysDictVoPage;
    }

    @Override
    public void resetDictCache() {
        init();
    }

    /**
     * 将SysDictItemVo转化为Map
     * 字典是系统重要功能，转换为Map可以公用
     */
    private List<Map<String, Object>> toMap(List<SysDictItemVo> list) {
        List<Map<String, Object>> resultList = new ArrayList<>();
        for (SysDictItemVo entity : list) {
            HashMap<String, Object> resultMap = new HashMap<>();
            resultMap.put("id", entity.getId());
            resultMap.put("dictId", entity.getDictId());
            resultMap.put("dictLabel", entity.getDictLabel());
            resultMap.put("dictValue", entity.getDictValue());
            resultMap.put("style", entity.getStyle());
            resultMap.put("orderNum", entity.getOrderNum());
            resultMap.put("remark", entity.getRemark());
            resultList.add(resultMap);
        }
        return resultList;
    }


    private void init() {
        cacheManager.getCache("sys_dict").clear();
        selectByPage(Page.of(-1, -1), new SysDict()).getRecords().forEach(sysDict -> {
            List<SysDictItemVo> dictItemList = sysDict.getDictItemList();
            List<Map<String, Object>> map = toMap(dictItemList);
            cacheManager.getCache("sys_dict").put(sysDict.getDictCode(), map);
        });
    }


}

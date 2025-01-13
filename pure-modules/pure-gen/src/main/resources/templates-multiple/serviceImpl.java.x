package ${packageName}.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import ${apiPackageName}.entity.SysDept;
import ${apiPackageName}.vo.SysDeptVo;
import ${packageName}.mapper.SysDeptMapper;
import ${packageName}.service.SysDeptService;
import org.springframework.stereotype.Service;

/**
 * ${comment}
 *
 * @author ${author}
 * @since ${date}
 */
@Service
public class ${Entity}ServiceImpl extends ServiceImpl<${Entity}Mapper, ${Entity}> implements ${Entity}Service {

    @Override
    public IPage<${Entity}Vo> selectByPage(IPage page, ${Entity} ${entity}) {
        return baseMapper.selectByPage(page, ${entity});
    }

}

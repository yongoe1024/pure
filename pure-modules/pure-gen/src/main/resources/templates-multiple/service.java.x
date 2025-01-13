package ${packageName}.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import ${apiPackageName}.entity.${Entity};
import ${apiPackageName}.vo.${Entity}Vo;

/**
 * ${comment}
 *
 * @author ${author}
 * @since ${date}
 */
public interface ${Entity}Service extends IService<${Entity}> {

    IPage<${Entity}Vo> selectByPage(IPage page, ${Entity} ${entity});

}

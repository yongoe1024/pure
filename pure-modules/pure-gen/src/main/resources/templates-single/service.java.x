package ${packageName}.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import ${packageName}.entity.${Entity};

/**
 * ${comment}
 *
 * @author ${author}
 * @since ${date}
 */
public interface ${Entity}Service extends IService<${Entity}> {

    IPage<${Entity}> selectByPage(IPage page, ${Entity} ${entity});

}

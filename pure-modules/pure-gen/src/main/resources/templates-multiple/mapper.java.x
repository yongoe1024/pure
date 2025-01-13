package ${packageName}.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import ${apiPackageName}.entity.${Entity};
import ${apiPackageName}.vo.${Entity}Vo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * ${comment}
 *
 * @author ${author}
 * @since ${date}
 */
@Mapper
public interface ${Entity}Mapper extends BaseMapper<${Entity}> {

    IPage<${Entity}Vo> selectByPage(IPage page, @Param("${entity}") ${Entity} ${entity});

}

package ${packageName}.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import ${packageName}.entity.${Entity};
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

    IPage<${Entity}> selectByPage(IPage page, @Param("${entity}") ${Entity} ${entity});

}

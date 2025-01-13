package ${packageName}.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.conditions.entity.LambdaWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yongoe.pure.common.core.annotation.Create;
import com.yongoe.pure.common.core.annotation.Update;
import com.yongoe.pure.common.core.entity.R;
import com.yongoe.pure.common.core.utils.ExcelUtils;
import com.yongoe.pure.common.core.utils.PageUtils;
import com.yongoe.pure.common.log.Log;
import ${packageName}.entity.${Entity};
import ${packageName}.service.${Entity}Service;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * ${comment}
 *
 * @author ${author}
 * @since ${date}
 */
@RestController
@RequestMapping("/${table.moduleName}/${table.businessName}")
public class ${Entity}Controller {
    @Resource
    private ${Entity}Service ${entity}Service;

<#if table.genCategory == "tree">
    /**
     * 全部查询，前端组装结构
     */
    @SaCheckPermission("${table.moduleName}:${table.businessName}:query")
    @GetMapping("/list")
    public R page(${Entity} entity) {
        IPage<${Entity}> page = ${entity}Service.selectByPage(Page.of(-1,-1), entity);
        return R.success(null, page.getRecords());
<#elseif table.genCategory == "crud">
    /**
     * 分页查询
     */
    @SaCheckPermission("${table.moduleName}:${table.businessName}:query")
    @GetMapping("/page")
    public R page(${Entity} entity) {
        IPage<${Entity}> page = ${entity}Service.selectByPage(PageUtils.getPage(), entity);
        return R.success(null, new PageUtils(page));
</#if>
    }

    /**
     * 添加
     */
    @Log("添加${comment}")
    @SaCheckPermission("${table.moduleName}:${table.businessName}:add")
    @PostMapping("/add")
    public R add(@Validated(Create.class) @RequestBody ${Entity} entity) {
        ${entity}Service.save(entity);
        return R.success("添加成功");
    }

    /**
     * 修改
     */
    @Log("修改${comment}")
    @SaCheckPermission("${table.moduleName}:${table.businessName}:update")
    @PutMapping("/update")
    public R update(@Validated(Update.class) @RequestBody ${Entity} entity) {
        ${entity}Service.updateById(entity);
        return R.success("修改成功");
    }

    /**
     * 删除
     */
    @Log("删除${comment}")
    @SaCheckPermission("${table.moduleName}:${table.businessName}:delete")
    @DeleteMapping("/delete/{ids}")
    public R delete(@PathVariable List<Long> ids) {
        ${entity}Service.removeByIds(ids);
        return R.success("删除成功");
    }

    /**
     * 导入数据
     */
    @Log("导入数据-${comment}")
    @SaCheckPermission("${table.moduleName}:${table.businessName}:upload")
    @PostMapping("/upload")
    public R upload(MultipartFile file) {
        List<${entity}> excelList = ExcelUtils.read(file, ${entity}.class);
        ${entity}Service.saveBatch(list);
        return R.success("导入成功");
    }

    /**
     * 导出数据
     */
    @Log("导出数据-${comment}")
    @SaCheckPermission("${table.moduleName}:${table.businessName}:export")
    @GetMapping("/export")
    public void export(${Entity} entity, HttpServletResponse response) throws IOException {
        Page<${Entity}> page = ${entity}Service.selectByPage(Page.of(-1,-1), entity);
        ExcelUtils.export(response, list, ${Entity}.class);
    }
}

package com.xiaoji.device.controller;

import java.util.List;

import com.xiaoji.common.core.web.controller.BaseController;
import com.xiaoji.common.core.web.domain.AjaxResult;
import com.xiaoji.common.core.web.page.TableDataInfo;
import com.xiaoji.common.log.annotation.Log;
import com.xiaoji.common.log.enums.BusinessType;
import com.xiaoji.common.security.annotation.RequiresPermissions;
import com.xiaoji.device.domain.IotCategory;
import com.xiaoji.device.service.IIotCategoryService;
import com.xiaoji.device.util.ExcelUtil;
import com.xiaoji.system.api.domain.SysOperLog;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;


/**
 * 设备分类Controller
 *
 */
@Api(value = "设备分类", tags = "设备分类")
@RestController
@RequestMapping("/category")
public class IotCategoryController extends BaseController {
    @Autowired
    private IIotCategoryService iotCategoryService;

    /**
     * 查询设备分类列表
     */
    @ApiOperation(value = "分类列表", notes = "分类列表")
    @PreAuthorize("@ss.hasPermi('device:category:list')")
    @GetMapping("/list")
    public TableDataInfo list(IotCategory iotCategory) {
        startPage();
        List<IotCategory> list = iotCategoryService.selectIotCategoryList(iotCategory);
        return getDataTable(list);
    }

    /**
     * 导出设备分类列表
     */
    @ApiOperation(value = "导出分类列表", notes = "导出分类列表")
    @RequiresPermissions("device:category:export")
    @Log(title = "设备分类", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(IotCategory iotCategory) {
        List<IotCategory> list = iotCategoryService.selectIotCategoryList(iotCategory);
        ExcelUtil<IotCategory> util = new ExcelUtil<IotCategory>(IotCategory.class);
        return util.exportExcel(list, "category");
    }

    /**
     * 获取设备分类详细信息
     */
    @ApiOperation(value = "获取分类详情", notes = "获取分类详情")
    @PreAuthorize("@ss.hasPermi('device:category:query')")
    @GetMapping(value = "/{categoryId}")
    public AjaxResult getInfo(@PathVariable("categoryId") Long categoryId) {
        return AjaxResult.success(iotCategoryService.selectIotCategoryById(categoryId));
    }

    /**
     * 新增设备分类
     */
    @ApiOperation(value = "新增分类", notes = "新增分类")
    @PreAuthorize("@ss.hasPermi('device:category:add')")
    @Log(title = "设备分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody IotCategory iotCategory) {
        return toAjax(iotCategoryService.insertIotCategory(iotCategory));
    }

    /**
     * 修改设备分类
     */
    @ApiOperation(value = "修改分类", notes = "修改分类")
    @PreAuthorize("@ss.hasPermi('device:category:edit')")
    @Log(title = "设备分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody IotCategory iotCategory) {
        return toAjax(iotCategoryService.updateIotCategory(iotCategory));
    }

    /**
     * 删除设备分类
     */
    @ApiOperation(value = "删除分类", notes = "删除分类")
    @PreAuthorize("@ss.hasPermi('device:category:remove')")
    @Log(title = "设备分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{categoryIds}")
    public AjaxResult remove(@PathVariable Long[] categoryIds) {
        return toAjax(iotCategoryService.deleteIotCategoryByIds(categoryIds));
    }
}

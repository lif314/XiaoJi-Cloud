package com.xiaoji.device.controller;

import java.util.List;

import com.xiaoji.common.core.web.controller.BaseController;
import com.xiaoji.common.core.web.domain.AjaxResult;
import com.xiaoji.common.core.web.page.TableDataInfo;
import com.xiaoji.common.log.annotation.Log;
import com.xiaoji.common.log.enums.BusinessType;
import com.xiaoji.common.security.annotation.RequiresPermissions;
import com.xiaoji.device.domain.IotDeviceUserRelation;
import com.xiaoji.device.service.IIotDeviceUserRelationService;
import com.xiaoji.device.util.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * 【请填写功能名称】Controller
 *
 */
@RestController
@RequestMapping("/relation")
public class IotDeviceUserRelationController extends BaseController {
    @Autowired
    private IIotDeviceUserRelationService iotDeviceUserRelationService;

    /**
    * 查询【请填写功能名称】列表
    */
    @RequiresPermissions("device:relation:list")
    @GetMapping("/list")
    public TableDataInfo list(IotDeviceUserRelation iotDeviceUserRelation) {
        startPage();
        List<IotDeviceUserRelation> list = iotDeviceUserRelationService.selectIotDeviceUserRelationList(iotDeviceUserRelation);
        return getDataTable(list);
    }
    
    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("device:relation:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(IotDeviceUserRelation iotDeviceUserRelation) {
        List<IotDeviceUserRelation> list = iotDeviceUserRelationService.selectIotDeviceUserRelationList(iotDeviceUserRelation);
        ExcelUtil<IotDeviceUserRelation> util = new ExcelUtil<IotDeviceUserRelation>(IotDeviceUserRelation.class);
        return util.exportExcel(list, "relation");
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @RequiresPermissions("device:relation:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(iotDeviceUserRelationService.selectIotDeviceUserRelationById(id));
    }

    /**
     * 新增【请填写功能名称】
     */
    @RequiresPermissions("device:relation:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody IotDeviceUserRelation iotDeviceUserRelation) {
        return toAjax(iotDeviceUserRelationService.insertIotDeviceUserRelation(iotDeviceUserRelation));
    }

    /**
     * 修改【请填写功能名称】
     */
    @RequiresPermissions("device:relation:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody IotDeviceUserRelation iotDeviceUserRelation) {
        return toAjax(iotDeviceUserRelationService.updateIotDeviceUserRelation(iotDeviceUserRelation));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("device:relation:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(iotDeviceUserRelationService.deleteIotDeviceUserRelationByIds(ids));
    }
}

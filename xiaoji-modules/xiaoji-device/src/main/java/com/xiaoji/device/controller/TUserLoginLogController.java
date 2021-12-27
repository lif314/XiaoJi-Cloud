package com.xiaoji.device.controller;

import java.util.List;

import com.xiaoji.common.core.web.controller.BaseController;
import com.xiaoji.common.security.annotation.RequiresPermissions;
import com.xiaoji.device.domain.TUserLoginLog;
import com.xiaoji.device.service.ITUserLoginLogService;
import com.xiaoji.common.core.web.domain.AjaxResult;
import com.xiaoji.common.core.web.page.TableDataInfo;
import com.xiaoji.device.util.ExcelUtil;
import com.xiaoji.common.log.enums.BusinessType;
import com.xiaoji.common.log.annotation.Log;
import org.springframework.security.access.prepost.PreAuthorize;
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
 */
@RestController
@RequestMapping("/log")
public class TUserLoginLogController extends BaseController {
    @Autowired
    private ITUserLoginLogService tUserLoginLogService;

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("device:log:list")
    @GetMapping("/list")
    public TableDataInfo list(TUserLoginLog tUserLoginLog) {
        startPage();
        List<TUserLoginLog> list = tUserLoginLogService.selectTUserLoginLogList(tUserLoginLog);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("device:log:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(TUserLoginLog tUserLoginLog) {
        List<TUserLoginLog> list = tUserLoginLogService.selectTUserLoginLogList(tUserLoginLog);
        ExcelUtil<TUserLoginLog> util = new ExcelUtil<>(TUserLoginLog.class);
        return util.exportExcel(list, "log");
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @RequiresPermissions("device:log:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(tUserLoginLogService.selectTUserLoginLogById(id));
    }

    /**
     * 新增【请填写功能名称】
     */
    @RequiresPermissions("device:log:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TUserLoginLog tUserLoginLog) {
        return toAjax(tUserLoginLogService.insertTUserLoginLog(tUserLoginLog));
    }

    /**
     * 修改【请填写功能名称】
     */
    @RequiresPermissions("device:log:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TUserLoginLog tUserLoginLog) {
        return toAjax(tUserLoginLogService.updateTUserLoginLog(tUserLoginLog));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("device:log:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(tUserLoginLogService.deleteTUserLoginLogByIds(ids));
    }
}

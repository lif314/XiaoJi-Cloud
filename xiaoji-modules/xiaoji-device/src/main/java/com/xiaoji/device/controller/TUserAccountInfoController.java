package com.xiaoji.device.controller;

import java.util.List;

import com.xiaoji.common.core.utils.poi.ExcelUtil;
import com.xiaoji.common.core.web.controller.BaseController;
import com.xiaoji.common.security.annotation.RequiresPermissions;
import com.xiaoji.device.domain.TUserAccountInfo;
import com.xiaoji.device.service.ITUserAccountInfoService;
import com.xiaoji.common.core.web.page.TableDataInfo;
import com.xiaoji.common.log.enums.BusinessType;
import com.xiaoji.common.core.web.domain.AjaxResult;
import com.xiaoji.common.log.annotation.Log;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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

import javax.servlet.http.HttpServletResponse;

/**
 * 小程序用户Controller
 *
 */
@Api(value = "小程序用户管理", tags = "小程序用户管理")
@RestController
@RequestMapping("/info")
public class TUserAccountInfoController extends BaseController {
    @Autowired
    private ITUserAccountInfoService tUserAccountInfoService;

    /**
     * 查询小程序用户列表
     */
    @ApiOperation(value = "查询小程序用户列表", notes = "查询小程序用户列表")
    @RequiresPermissions("device:info:list")
    @GetMapping("/list")
    public TableDataInfo list(TUserAccountInfo tUserAccountInfo) {
        startPage();
        List<TUserAccountInfo> list = tUserAccountInfoService.selectTUserAccountInfoList(tUserAccountInfo);
        return getDataTable(list);
    }

    /**
     * 导出小程序用户列表
     */
    @ApiOperation(value = "导出小程序用户列表", notes = "导出小程序用户列表")
    @RequiresPermissions("device:info:export")
    @Log(title = "小程序用户", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public void export(HttpServletResponse response, TUserAccountInfo tUserAccountInfo) {
        List<TUserAccountInfo> list = tUserAccountInfoService.selectTUserAccountInfoList(tUserAccountInfo);
        ExcelUtil<TUserAccountInfo> util = new ExcelUtil<TUserAccountInfo>(TUserAccountInfo.class);
        util.exportExcel( response ,list, "info");
    }

    /**
     * 获取小程序用户详细信息
     */
    @ApiOperation(value = "获取小程序用户详细信息", notes = "获取小程序用户详细信息")
    @RequiresPermissions("device:info:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(tUserAccountInfoService.selectTUserAccountInfoById(id));
    }

    /**
     * 新增小程序用户
     */
    @ApiOperation(value = "新增小程序用户", notes = "新增小程序用户")
    @RequiresPermissions("device:info:add")
    @Log(title = "小程序用户", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TUserAccountInfo tUserAccountInfo) {
        return toAjax(tUserAccountInfoService.insertTUserAccountInfo(tUserAccountInfo));
    }

    /**
     * 修改小程序用户
     */
    @ApiOperation(value = "修改小程序用户", notes = "修改小程序用户")
    @RequiresPermissions("device:info:edit")
    @Log(title = "小程序用户", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TUserAccountInfo tUserAccountInfo) {
        return toAjax(tUserAccountInfoService.updateTUserAccountInfo(tUserAccountInfo));
    }

    /**
     * 删除小程序用户
     */
    @ApiOperation(value = "删除小程序用户", notes = "删除小程序用户")
    @RequiresPermissions("device:info:remove")
    @Log(title = "小程序用户", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(tUserAccountInfoService.deleteTUserAccountInfoByIds(ids));
    }
}

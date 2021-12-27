
package com.xiaoji.device.controller;

import java.util.List;

import com.xiaoji.common.core.utils.StringUtils;
import com.xiaoji.common.core.web.controller.BaseController;
import com.xiaoji.common.core.web.domain.AjaxResult;
import com.xiaoji.common.core.web.page.TableDataInfo;
import com.xiaoji.common.log.annotation.Log;
import com.xiaoji.common.log.enums.BusinessType;
import com.xiaoji.common.security.annotation.RequiresPermissions;
import com.xiaoji.device.domain.IotDevice;
import com.xiaoji.device.domain.vo.DeviceControlCMD;
import com.xiaoji.device.domain.vo.IotDeviceListDto;
import com.xiaoji.device.service.IIotDeviceService;
import com.xiaoji.device.util.ExcelUtil;
import com.xiaoji.device.util.exception.CustomException;
import com.xiaoji.system.api.model.LoginUser;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;


/**
 * 设备Controller
 */
@Api(value = "设备", tags = "设备")
@RestController
@RequestMapping("/device")
public class IotDeviceController extends BaseController {
    @Autowired
    private IIotDeviceService iotDeviceService;

    /**
     * 查询设备列表
     */
    @ApiOperation(value = "设备列表", notes = "设备列表")
    @RequiresPermissions("device:device:list")
    @GetMapping("/list")
    public TableDataInfo list(IotDevice iotDevice) {
        startPage();
        LoginUser user = (LoginUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        iotDevice.setOwnerId(user.getUserid().toString());
        List<IotDeviceListDto> list = iotDeviceService.selectIotDeviceList(iotDevice);
        return getDataTable(list);
    }


    /**
     * 导出设备列表
     */
    @ApiOperation(value = "导出设备列表", notes = "导出设备列表")
    @RequiresPermissions("device:device:export")
    @Log(title = "设备", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(IotDevice iotDevice) {
        List<IotDeviceListDto> list = iotDeviceService.selectIotDeviceList(iotDevice);
        ExcelUtil<IotDeviceListDto> util = new ExcelUtil<IotDeviceListDto>(IotDeviceListDto.class);
        return util.exportExcel(list, "device");
    }

    /**
     * 获取设备详细信息
     */
    @ApiOperation(value = "获取设备详情", notes = "获取设备详情")
    @RequiresPermissions("device:device:query")
    @GetMapping(value = "/{deviceId}")
    public AjaxResult getInfo(@PathVariable("deviceId") Long deviceId) {
        return AjaxResult.success(iotDeviceService.selectIotDeviceById(deviceId));
    }

    /**
     * 根据设备编号获取设备详细信息
     */
    @ApiOperation(value = "根据设备编号获取设备详情", notes = "根据设备编号获取设备详情")
    @RequiresPermissions("device:device:query")
    @GetMapping(value = "/getByNum/{deviceNum}")
    public AjaxResult getInfoByNum(@PathVariable("deviceNum") String deviceNum) {
        return AjaxResult.success(iotDeviceService.selectIotDeviceByNum(deviceNum));
    }

    /**
     * 新增设备
     */
    @ApiOperation(value = "新增设备", notes = "新增设备")
    @RequiresPermissions("device:device:add")
    @Log(title = "设备", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody IotDevice iotDevice) {
        LoginUser user = (LoginUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        iotDevice.setOwnerId(user.getUserid().toString());
        iotDevice.setStatus("未绑定");
        IotDevice device = iotDeviceService.selectIotDeviceByNum(iotDevice.getDeviceNum());
        if (device != null) {
            return AjaxResult.error("设备编号已存在，请重新填写");
        }
        return toAjax(iotDeviceService.insertIotDevice(iotDevice));
    }

    /**
     * 修改设备
     */
    @ApiOperation(value = "修改设备", notes = "修改设备")
    @RequiresPermissions("device:device:edit")
    @Log(title = "设备", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody IotDevice iotDevice) {
        return toAjax(iotDeviceService.updateIotDevice(iotDevice));
    }

    /**
     * 删除设备
     */
    @ApiOperation(value = "删除设备", notes = "删除设备")
    @RequiresPermissions("device:device:remove")
    @Log(title = "设备", businessType = BusinessType.DELETE)
    @DeleteMapping("/{deviceIds}")
    public AjaxResult remove(@PathVariable Long[] deviceIds) {
        return toAjax(iotDeviceService.deleteIotDeviceByIds(deviceIds));
    }


    @ApiOperation(value = "绑定设备", notes = "绑定设备")
    @Log(title = "设备", businessType = BusinessType.UPDATE)
    @PostMapping("/bindDevice")
    public AjaxResult bindDevice(@RequestBody IotDevice iotDevice) {
        LoginUser user = (LoginUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Long userId = user.getUserid();
        String username = user.getUsername();
        String deviceNum = iotDevice.getDeviceNum();
        String deviceName = iotDevice.getDeviceName();
        Long categoryId = iotDevice.getCategoryId();
        String remark = iotDevice.getRemark();
        return AjaxResult.success(iotDeviceService.bindDevice(userId,username,deviceNum,deviceName,categoryId, remark));
    }

    @ApiOperation(value = "控制设备", notes = "控制设备")
    @RequiresPermissions("device:device:control")
    @Log(title = "设备", businessType = BusinessType.UPDATE)
    @PostMapping("/control")
    public AjaxResult control(@RequestBody DeviceControlCMD deviceControlCMD) {
        String deviceNum = deviceControlCMD.getDeviceNum();
        String cmd = deviceControlCMD.getCmd();
        if(StringUtils.isBlank(deviceNum)) {
            throw new CustomException("设备编号不能为空");
        }
        if(StringUtils.isBlank(cmd)) {
            throw new CustomException("控制指令不能为空");
        }
        return toAjax(iotDeviceService.controlDeviceByNum(deviceNum,cmd));
    }



    @ApiOperation(value = "小程序设备列表", notes = "小程序设备列表")
    @RequiresPermissions("device:device:list")
    @GetMapping("/listDevice")
    public TableDataInfo listDevice(IotDevice iotDevice) {
        startPage();
        LoginUser user = (LoginUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        iotDevice.setOwnerId(user.getUserid().toString());
        List<IotDeviceListDto> list = iotDeviceService.selectMpIotDeviceList(iotDevice);
        return getDataTable(list);
    }

    @ApiOperation(value = "修改设备名称和备注", notes = "修改设备名称和备注")
    @Log(title = "设备", businessType = BusinessType.UPDATE)
    @PostMapping("/updateDeviceInfo")
    public AjaxResult updateDeviceInfo(@RequestBody IotDevice iotDevice) {
        Long deviceId = iotDevice.getDeviceId();
        String deviceName = iotDevice.getDeviceName();
        String remark = iotDevice.getRemark();
        LoginUser user = (LoginUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Long userId = user.getUserid();
         String nickName = user.getUsername();
        return AjaxResult.success(iotDeviceService.updateDeviceInfo( userId,  nickName,  deviceId,  deviceName,  remark));
    }

    @ApiOperation(value = "根据用户设备编号获取设备详情", notes = "根据设备编号获取设备详情")
    @GetMapping(value = "/getByUserAndNum/{deviceNum}")
    public AjaxResult getInfoByUserAndNum(@PathVariable("deviceNum") String deviceNum) {
        LoginUser user = (LoginUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Long userId = user.getUserid();
        return AjaxResult.success(iotDeviceService.selectIotDeviceByUserAndNum(userId,deviceNum));
    }

    @ApiOperation(value = "解除绑定设备", notes = "解除绑定设备")
    @Log(title = "设备", businessType = BusinessType.UPDATE)
    @PostMapping("/unBindDevice")
    public AjaxResult unBindDevice(@RequestBody IotDevice iotDevice) {
        LoginUser user = (LoginUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Long userId = user.getUserid();
        String username = user.getUsername();
        Long deviceId = iotDevice.getDeviceId();
        return AjaxResult.success(iotDeviceService.unBindDevice(userId,username,deviceId));
    }

    @ApiOperation(value = "根据设备编号查询设备信息", notes = "根据设备编号查询设备信息")
    @Log(title = "设备", businessType = BusinessType.UPDATE)
    @GetMapping("/getDeviceInfoByDeviceNum")
    public AjaxResult getDeviceInfoByDeviceNum(@RequestParam String deviceNum ) {
        LoginUser user = (LoginUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Long userId = user.getUserid();
        String username = user.getUsername();
        return AjaxResult.success(iotDeviceService.getDeviceInfoByDeviceNum(userId,username,deviceNum));
    }

    @ApiOperation(value = "根据设备编号查询设备信息", notes = "根据设备编号查询设备信息")
    @Log(title = "设备", businessType = BusinessType.UPDATE)
    @GetMapping("/getDeviceInfoByDeviceId")
    public AjaxResult getDeviceInfoByDeviceId(@RequestParam Long deviceId ) {
        LoginUser user = (LoginUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Long userId = user.getUserid();
        String username = user.getUsername();
        return AjaxResult.success(iotDeviceService.getDeviceInfoByDeviceId(userId,username,deviceId));
    }

}

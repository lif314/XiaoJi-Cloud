
package com.xiaoji.device.controller;

import java.math.BigDecimal;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.xiaoji.common.core.utils.poi.ExcelUtil;
import com.xiaoji.common.core.web.controller.BaseController;
import com.xiaoji.common.core.web.domain.AjaxResult;
import com.xiaoji.common.core.web.page.TableDataInfo;
import com.xiaoji.common.security.annotation.RequiresPermissions;
import com.xiaoji.device.config.MqttPushClient;
import com.xiaoji.device.domain.IotDevice;
import com.xiaoji.device.domain.IotDeviceStatus;
import com.xiaoji.device.service.IIotDeviceService;
import com.xiaoji.device.service.IIotDeviceStatusService;
import com.xiaoji.common.log.enums.BusinessType;
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
 * 设备状态Controller
 */
@Api(value = "设备状态", tags = "设备状态")
@RestController
@RequestMapping("/status")
public class IotDeviceStatusController extends BaseController {
    @Autowired
    private IIotDeviceStatusService iotDeviceStatusService;
    @Autowired
    private IIotDeviceService iotDeviceService;

    @Autowired
    private MqttPushClient mqttPushClient;

    /**
     * 查询设备状态列表
     */
    @ApiOperation(value = "查询设备状态列表", notes = "查询设备状态列表")
    @RequiresPermissions("device:status:list")
    @GetMapping("/list")
    public TableDataInfo list(IotDeviceStatus iotDeviceStatus) {
        startPage();
        List<IotDeviceStatus> list = iotDeviceStatusService.selectIotDeviceStatusList(iotDeviceStatus);
        return getDataTable(list);
    }

    /**
     * 导出设备状态列表
     */
    @ApiOperation(value = "导出设备状态列表", notes = "导出设备状态列表")
    @RequiresPermissions("device:status:export")
    @Log(title = "设备状态", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public void export(HttpServletResponse response, IotDeviceStatus iotDeviceStatus) {
        List<IotDeviceStatus> list = iotDeviceStatusService.selectIotDeviceStatusList(iotDeviceStatus);
        ExcelUtil<IotDeviceStatus> util = new ExcelUtil<IotDeviceStatus>(IotDeviceStatus.class);
        util.exportExcel( response,list, "status");
    }

    /**
     * 获取设备状态详细信息
     */
    @ApiOperation(value = "获取设备状态详情", notes = "获取设备状态详情")
    @RequiresPermissions("device:status:query")
    @GetMapping(value = "/{deviceStatusId}")
    public AjaxResult getInfo(@PathVariable("deviceStatusId") Long deviceStatusId) {
        return AjaxResult.success(iotDeviceStatusService.selectIotDeviceStatusById(deviceStatusId));
    }

    /**
     * 根据设备编号获取设备状态
     */
    @ApiOperation(value = "根据设备编号获取最新设备状态", notes = "根据设备编号获取最新设备状态")
    @RequiresPermissions("device:status:query")
    @GetMapping(value = "/newByNum/{deviceNum}")
    public AjaxResult getNewStatus(@PathVariable("deviceNum") String deviceNum) {
        return AjaxResult.success(iotDeviceStatusService.selectIotDeviceStatusByDeviceNum(deviceNum));
    }

    /**
     * 获取最新设备状态详细信息
     */
    @ApiOperation(value = "获取最新设备状态详情", notes = "获取最新设备状态详情")
    @RequiresPermissions("device:status:query")
    @GetMapping(value = "/new/{deviceId}")
    public AjaxResult getNewInfo(@PathVariable("deviceId") Long deviceId) {
        IotDeviceStatus status = iotDeviceStatusService.selectIotDeviceStatusByDeviceId(deviceId);
        if (status == null) {
            // 构建默认数据
            IotDevice device = iotDeviceService.selectIotDeviceById(deviceId);
            if (device != null) {
                status = new IotDeviceStatus();
                status.setDeviceId(device.getDeviceId());
                status.setDeviceNum(device.getDeviceNum());
                status.setRelayStatus(0);
                status.setLightStatus(0);
                status.setLightMode(0);
                status.setBrightness(100);
                status.setLightInterval(500);
                status.setFadeTime(300);
                status.setRed(255L);
                status.setBlue(255L);
                status.setGreen(255L);
                status.setAirTemperature(BigDecimal.valueOf(0));
                status.setAirHumidity(BigDecimal.valueOf(0));
                status.setDeviceTemperature(BigDecimal.valueOf(0));
            }
        }
        return AjaxResult.success(status);
    }

    /**
     * 新增设备状态
     */
    @ApiOperation(value = "新增设备状态", notes = "新增设备状态")
    @RequiresPermissions("device:status:add")
    @Log(title = "设备状态", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody IotDeviceStatus iotDeviceStatus) {
        return toAjax(iotDeviceStatusService.insertIotDeviceStatus(iotDeviceStatus));
    }

    /**
     * 修改设备状态
     */
    @ApiOperation(value = "修改设备状态", notes = "修改设备状态")
    @RequiresPermissions("device:status:edit")
    @Log(title = "设备状态", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody IotDeviceStatus iotDeviceStatus) {
        IotDeviceStatus status = iotDeviceStatusService.selectIotDeviceStatusByDeviceId(iotDeviceStatus.getDeviceId());
        if (status == null || status.getIsOnline() == 0) {
            return AjaxResult.error("设备已离线，不能更新状态。");
        }
        // 存储
        iotDeviceStatusService.updateIotDeviceStatus(iotDeviceStatus);

        // mqtt发布
        if (iotDeviceStatus.getRelayStatus() != null) {
            status.setRelayStatus(iotDeviceStatus.getRelayStatus());
        }
        if (iotDeviceStatus.getLightStatus() != null) {
            status.setLightStatus(iotDeviceStatus.getLightStatus());
        }
        if (iotDeviceStatus.getLightMode() != null) {
            status.setLightMode(iotDeviceStatus.getLightMode());
        }
        if (iotDeviceStatus.getLightInterval() != null) {
            status.setLightInterval(iotDeviceStatus.getLightInterval());
        }
        if (iotDeviceStatus.getFadeTime() != null) {
            status.setFadeTime(iotDeviceStatus.getFadeTime());
        }
        if (iotDeviceStatus.getBrightness() != null) {
            status.setBrightness(iotDeviceStatus.getBrightness());
        }
        if (iotDeviceStatus.getRed() != null) {
            status.setRed(iotDeviceStatus.getRed());
        }
        if (iotDeviceStatus.getGreen() != null) {
            status.setGreen(iotDeviceStatus.getGreen());
        }
        if (iotDeviceStatus.getBlue() != null) {
            status.setBlue(iotDeviceStatus.getBlue());
        }
        String content = JSON.toJSONString(status);
        boolean isSuccess = mqttPushClient.publish(1, true, "status/set/" + status.getDeviceNum(), content);
        if (isSuccess) {
            return AjaxResult.success("mqtt 发布成功");
        }

        return AjaxResult.error("mqtt 发布失败。");
    }

    @ApiOperation(value = "mqtt获取设备状态", notes = "mqtt获取设备状态")
    @GetMapping(value = "/getStatus/{deviceNum}")
    public AjaxResult getStatus(@PathVariable("deviceNum") String deviceNum) {
        boolean isSuccess = mqttPushClient.publish(0, true, "status/get/" + deviceNum, "wumei.live");
        if (isSuccess) {
            return AjaxResult.success("mqtt 发布成功");
        }
        return AjaxResult.error("mqtt 发布失败。");
    }

    /**
     * 删除设备状态
     */
    @ApiOperation(value = "删除设备状态", notes = "删除设备状态")
    @RequiresPermissions("device:status:remove")
    @Log(title = "设备状态", businessType = BusinessType.DELETE)
    @DeleteMapping("/{deviceStatusIds}")
    public AjaxResult remove(@PathVariable Long[] deviceStatusIds) {
        return toAjax(iotDeviceStatusService.deleteIotDeviceStatusByIds(deviceStatusIds));
    }
}

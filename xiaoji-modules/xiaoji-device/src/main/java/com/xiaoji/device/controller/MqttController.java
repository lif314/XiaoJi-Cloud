
package com.xiaoji.device.controller;

import com.alibaba.fastjson.JSON;
import com.xiaoji.common.core.web.controller.BaseController;
import com.xiaoji.common.core.web.domain.AjaxResult;
import com.xiaoji.device.config.MqttPushClient;
import com.xiaoji.device.domain.IotDeviceSet;
import com.xiaoji.device.domain.IotDeviceStatus;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import com.xiaoji.common.log.annotation.Log;


/**
 * mqtt接口
 */
@Api(value = "mqtt消息发布", tags = "mqtt消息发布")
@RestController
@RequestMapping("/mqtt")
public class MqttController extends BaseController {
    @Autowired
    private MqttPushClient mqttPushClient;

    @ApiOperation(value = "更新设备状态", notes = "更新设备状态")
    @PostMapping(value = "/updateStatus")
    public AjaxResult updateStatus(@RequestBody IotDeviceStatus iotDeviceStatus){
        String content = JSON.toJSONString(iotDeviceStatus);
        boolean isSuccess=mqttPushClient.publish(1,false,"status/set/"+iotDeviceStatus.getDeviceNum(),content);
        if(isSuccess){return AjaxResult.success();}
        return AjaxResult.error("mqtt 发布失败。");
    }

    @ApiOperation(value = "获取设备状态", notes = "获取设备状态")
    @GetMapping(value = "/getStatus/{deviceNum}")
    public AjaxResult getStatus(@PathVariable("deviceNum") String deviceNum){
        boolean isSuccess=mqttPushClient.publish(0,false,"status/get/"+deviceNum,"wumei.live");
        if(isSuccess){return AjaxResult.success();}
        return AjaxResult.error("mqtt 发布失败。");
    }

    @ApiOperation(value = "更新设备配置", notes = "更新设备配置")
    @PostMapping(value = "/updateSetting")
    public AjaxResult updateSetting(@RequestBody IotDeviceSet iotDeviceSet){
        String content = JSON.toJSONString(iotDeviceSet);
        boolean isSuccess=mqttPushClient.publish(0,false,"setting/set/"+iotDeviceSet.getDeviceNum(),content);
        if(isSuccess){return AjaxResult.success();}
        return AjaxResult.error("mqtt 发布失败。");
    }

    @ApiOperation(value = "获取设备配置", notes = "获取设备配置")
    @GetMapping(value = "/getSetting/{deviceNum}")
    public AjaxResult getSetting(@PathVariable("deviceNum") String deviceNum){
        boolean isSuccess=mqttPushClient.publish(0,false,"setting/get/"+deviceNum,"wumei.lie");
        if(isSuccess){return AjaxResult.success();}
        return AjaxResult.error("mqtt 发布失败。");
    }
}


package com.xiaoji.device.domain.vo;

import lombok.Data;

/**
 * 类名: DeviceControlCMD
 * 描述: 设备控制指令参数
 * 开发人: xiaoji
 */
@Data
public class DeviceControlCMD {
   private Long deviceId;
    String deviceNum;
    String cmd;
}

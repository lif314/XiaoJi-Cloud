package com.xiaoji.system.api;

import com.xiaoji.common.core.constant.ServiceNameConstants;
import com.xiaoji.common.core.domain.R;
import com.xiaoji.system.api.domain.IotDeviceStatus;
import com.xiaoji.system.api.factory.RemoteDeviceFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * 设备管理服务
 *
 * @author xiaoji
 */

@FeignClient(contextId = "remoteDeviceService", value = ServiceNameConstants.DEVICE_SERVICE, fallbackFactory = RemoteDeviceFallbackFactory.class)
public interface RemoteDeviceService {

    /**
     * 修改设备状态
     * @return
     */
    @PutMapping("/status")
    public R<Object> edit(@RequestBody IotDeviceStatus iotDeviceStatus);
}

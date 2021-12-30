package com.xiaoji.system.api.factory;

import com.xiaoji.common.core.domain.R;
import com.xiaoji.system.api.RemoteDeviceService;
import com.xiaoji.system.api.domain.IotDeviceStatus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * 设备管理服务降级处理
 *
 * @author xiaoji
 *
 */
@Component
public class RemoteDeviceFallbackFactory implements FallbackFactory<RemoteDeviceService> {
    private static final Logger log = LoggerFactory.getLogger(RemoteDeviceFallbackFactory.class);

    @Override
    public RemoteDeviceService create(Throwable throwable)
    {
        log.error("设备管理服务调用失败:{}", throwable.getMessage());
        return new RemoteDeviceService() {
            /**
             * 修改设备状态
             *
             * @param iotDeviceStatus 设备状态
             */
            @Override
            public R<Object> edit(IotDeviceStatus iotDeviceStatus) {
                return R.fail("设备状态修改失败" + throwable.getMessage());
            }
        };
    }
}

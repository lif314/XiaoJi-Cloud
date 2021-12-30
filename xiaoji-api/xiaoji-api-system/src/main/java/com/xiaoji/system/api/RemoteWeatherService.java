package com.xiaoji.system.api;

import com.xiaoji.common.core.constant.ServiceNameConstants;
import com.xiaoji.system.api.factory.RemoteWeatherFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;


/**
 * 天气调控服务
 *
 * @author xiaoji
 */

@FeignClient(contextId = "remoteWeatherService", value = ServiceNameConstants.WEATHER_SERVICE, fallbackFactory = RemoteWeatherFallbackFactory.class)
public interface RemoteWeatherService {
    /**
     * 调用AutoChangeService获取最适宜温度光强，通过TemperatureService和CdService改变id=0的温度和光照
     */
    @GetMapping("/autochange")
    public List<Integer> autoChange();
}

package com.xiaoji.system.api.factory;

import com.xiaoji.system.api.RemoteWeatherService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 智能天气服务降级处理
 *
 * @author xiaoji
 *
 */
@Component
public class RemoteWeatherFallbackFactory implements FallbackFactory<RemoteWeatherService> {

    private static final Logger log = LoggerFactory.getLogger(RemoteWeatherFallbackFactory.class);

    @Override
    public RemoteWeatherService create(Throwable throwable)
    {
        log.error("智能天气服务调用失败:{}", throwable.getMessage());
        return new RemoteWeatherService()
        {
            /**
             * 调用AutoChangeService获取最适宜温度光强，通过TemperatureService和CdService改变id=0的温度和光照
             */
            @Override
            public List<Integer> autoChange() {
                return null;
            }
        };
    }

}

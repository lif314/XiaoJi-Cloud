package com.xiaoji.system.api.factory;

import com.xiaoji.common.core.utils.result.Result;
import com.xiaoji.common.core.utils.result.ResultFactory;
import com.xiaoji.system.api.RemoteMusicService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * 智能音乐服务降级处理
 *
 * @author xiaoji
 *
 */
@Component
public class RemoteMusicFallbackFactory implements FallbackFactory<RemoteMusicService> {
    private static final Logger log = LoggerFactory.getLogger(RemoteMusicFallbackFactory.class);

    @Override
    public RemoteMusicService create(Throwable throwable) {
        log.error("智能音乐服务调用失败:{}", throwable.getMessage());
        return new RemoteMusicService() {
            @Override
            public Result getMusicByEmo(String faceBase64) {
                return ResultFactory.buildFailResult("智能音乐调用失败" + throwable.getMessage());
            }
        };
    }
}

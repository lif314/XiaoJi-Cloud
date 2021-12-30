package com.xiaoji.system.api.factory;

import com.xiaoji.common.core.domain.R;
import com.xiaoji.system.api.RemoteEmotionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * 情绪检测服务降级处理
 *
 * @author xiaoji
 *
 */
@Component
public class RemoteEmotionFallbackFactory implements FallbackFactory<RemoteEmotionService> {
    private static final Logger log = LoggerFactory.getLogger(RemoteEmotionFallbackFactory.class);

    @Override
    public RemoteEmotionService create(Throwable throwable)
    {
        log.error("情绪检测服务调用失败:{}", throwable.getMessage());
        return new RemoteEmotionService()
        {
            /**
             * 情绪检测
             *
             * @param faceBase64 人脸图像编码
             * @return 结果
             */
            @Override
            public R<Object> emotionRecognition(String faceBase64) {
                return R.fail("情绪检测服务失败" + throwable.getMessage());
            }
        };
    }
}

package com.xiaoji.system.api;

import com.xiaoji.common.core.constant.ServiceNameConstants;
import com.xiaoji.common.core.domain.R;
import com.xiaoji.system.api.factory.RemoteEmotionFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 情绪检测服务
 *
 * @author xiaoji
 */
@FeignClient(contextId = "remoteEmotionService", value = ServiceNameConstants.EMOTION_SERVICE, fallbackFactory = RemoteEmotionFallbackFactory.class)
public interface RemoteEmotionService {
    /**
     * 情绪检测
     *
     * @param faceBase64 人脸图像编码
     * @return 结果
     */
    @PostMapping(value = "/emotion/get")
    public String emotionRecognition(@RequestParam String faceBase64);
}

package com.xiaoji.system.api;

import com.xiaoji.common.core.constant.ServiceNameConstants;
import com.xiaoji.system.api.factory.RemoteMakeupFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 虚拟化妆服务
 *
 * @author xiaoji
 */
@FeignClient(contextId = "remoteMakeupService", value = ServiceNameConstants.MAKEUP_SERVICE, fallbackFactory = RemoteMakeupFallbackFactory.class)
public interface RemoteMakeupService {

    /**
     * 虚拟化妆
     * @param faceBase64 人脸base64编码
     * @param type 口红型号
     * @return 返回化好妆的人脸base64(经过美颜)
     */
    @PostMapping("/makeup/lipstick")
    public String makeup(@RequestParam String faceBase64, @RequestParam String type);
}

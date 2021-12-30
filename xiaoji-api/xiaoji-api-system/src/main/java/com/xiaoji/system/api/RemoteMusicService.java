package com.xiaoji.system.api;

import com.xiaoji.common.core.constant.ServiceNameConstants;
import com.xiaoji.common.core.utils.result.Result;
import com.xiaoji.system.api.factory.RemoteMusicFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 智能音乐推荐服务
 *
 * @author xiaoji
 */
@FeignClient(contextId = "remoteMusicService", value = ServiceNameConstants.MUSIC_SERVICE, fallbackFactory = RemoteMusicFallbackFactory.class)
public interface RemoteMusicService {



    /**
     * 根据情绪智能推荐音乐
     * @param faceBase64 人脸凸显
     * @return music url
     */
    @GetMapping("/music/byemo")
    public Result getMusicByEmo(@RequestParam String faceBase64);
}

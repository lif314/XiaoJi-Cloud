package com.xiaoji.scene.controller;

import com.xiaoji.scene.dao.Scene;
import com.xiaoji.system.api.*;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 情景模式
 *
 * @author xiaoji
 */

@CrossOrigin
@RestController
@Api(tags = "情景模式")
@RequestMapping("/scene")
public class SceneController {

    /**
     * 智能天气服务
     */
    @Autowired
    private RemoteWeatherService remoteWeatherService;

    /**
     * 智能影院服务
     */
    @Autowired
    private RemoteMovieService remoteMovieService;

    /**
     * 虚拟化妆服务
     */
    @Autowired
    private RemoteMakeupService remoteMakeupService;

    /**
     * 情绪检测服务
     */
    @Autowired
    private RemoteEmotionService remoteEmotionService;

    /**
     * 智能设备管理服务
     */
    @Autowired
    private RemoteDeviceService remoteDeviceService;

    /**
     * 智能音乐服务
     */
    @Autowired
    private RemoteMusicService remoteMusicService;

    /**
     * 情景模式 要素控制
     * @param type 情景类型
     * @return 情景
     */
    @GetMapping("/pattern")
   public Scene recommendSceneFactorsByType(String type){
        List<Integer> integers = remoteWeatherService.autoChange();
        return null;
   }
}

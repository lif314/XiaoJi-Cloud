package com.xiaoji.scene.controller;

import com.xiaoji.scene.dao.Scene;
import com.xiaoji.system.api.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
     * @param scene_id 情景类型
     * @return 情景
     */
    @GetMapping("/pattern")
    @ApiOperation(value = "通过接收情景模式对应的id，返回该模式下的温度，光强，电影以及音乐", notes="id=1时休眠模式，id=2时奋斗模式，id=3时悠闲模式")
    @ApiImplicitParam(name="sceneid",value="情景模式的id",required=true,paramType="form",dataType="Integer")
    public Scene recommendSceneFactorsByType(@RequestParam("sceneid")Integer scene_id){
        Scene scene = new Scene();
        if (scene_id<1)
        {

            return null;
        }
        //假定sence_id=1表示睡眠模式
        else if(scene_id.equals(1))
        {
            //睡眠时改变温度为最适宜，光强为0
            List<Integer> suit_list=remoteWeatherService.autoChange();
            //调用xiaoji-device



            scene.setTemperature(suit_list.get(0));
            scene.setCd(0);

            //调用低音量音乐，舒缓音乐


            //调用视频


            return scene;
        }
        //假定sence_id=2表示奋斗模式
        else if(scene_id.equals(2))
        {
            //奋斗时改变温度光强
            List<Integer> suit_list=remoteWeatherService.autoChange();
            //调用xiaoji-device


            scene.setTemperature(suit_list.get(0)+2);
            scene.setCd(suit_list.get(1)+50);
            //调用音乐

            //调用视频
            return scene;
        }
        //假定sence_id=3表示悠闲模式
        else if(scene_id.equals(3))
        {
            List<Integer> suit_list=remoteWeatherService.autoChange();
            //调用xiaoji-device


            scene.setTemperature(suit_list.get(0));
            scene.setCd(suit_list.get(1)-50);
            //调用音乐

            //调用视频
            return null;
        }
        else{

            return null;
        }
    }
}

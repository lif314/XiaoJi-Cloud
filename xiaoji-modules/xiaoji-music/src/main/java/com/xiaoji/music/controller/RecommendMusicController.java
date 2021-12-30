package com.xiaoji.music.controller;


import com.xiaoji.common.core.domain.R;
import com.xiaoji.common.core.utils.result.Result;
import com.xiaoji.common.core.utils.result.ResultFactory;
import com.xiaoji.music.service.IRecommendMusicService;
import com.xiaoji.music.utils.EmotionJson;
import com.xiaoji.system.api.RemoteEmotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 智能推荐音乐模块
 *
 * @author xiaoji
 *
 */

@CrossOrigin
@RestController
@RequestMapping("/music")
public class RecommendMusicController {

    /**
     * 智能音乐推荐服务
     */
    @Autowired
    private IRecommendMusicService recommendMusicService;

    /**
     * 获取用户情绪信息
     */
    @Autowired
    private RemoteEmotionService remoteEmotionService;

    /**
     * 根据情绪智能推荐音乐
     * @param faceBase64 人脸凸显
     * @return music url
     */
    @GetMapping("/byemo")
    public Result getMusicByEmo(@RequestParam String faceBase64){
        String emotion = remoteEmotionService.emotionRecognition(faceBase64);
        String emoType = EmotionJson.getHighestEmoType(emotion);
        return ResultFactory.buildSuccessResult(recommendMusicService.getMusicByEmo(emoType));
    }
}

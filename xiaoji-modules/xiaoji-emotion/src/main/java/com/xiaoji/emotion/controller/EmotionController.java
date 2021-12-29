package com.xiaoji.emotion.controller;



import com.xiaoji.emotion.service.IEmotionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@CrossOrigin
@Controller
@RequestMapping(path = "/emotion")
@Api(tags = "情绪检测")
public class EmotionController {

    @Autowired
    public IEmotionService emotionService;

    @ApiOperation(value = "faceBase64",  notes = "人脸图像，base64格式，去除加密头")
    @PostMapping(path = "/get")
    public @ResponseBody
    String emotionRecognition(@RequestParam String faceBase64){
         return emotionService.emotionRecognition(faceBase64);
    }
}
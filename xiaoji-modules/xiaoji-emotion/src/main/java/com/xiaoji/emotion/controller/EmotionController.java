package com.xiaoji.emotion.controller;



import com.xiaoji.emotion.service.IEmotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@CrossOrigin
@Controller
@RequestMapping(path = "/emotion")
public class EmotionController {

    @Autowired
    public IEmotionService emotionService;

    @PostMapping(path = "/get")
    public @ResponseBody
    String emotionRecognition(@RequestParam String faceBase64){
         return emotionService.emotionRecognition(faceBase64);
    }
}
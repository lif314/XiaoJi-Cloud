package com.xiaoji.makeup.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.xiaoji.makeup.service.IFaceBeautifyService;
import com.xiaoji.makeup.service.IMakeupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
public class MakeupController {

    @Autowired
    private IMakeupService makeupService;

    @Autowired
    private IFaceBeautifyService faceBeautifyService;

    /**
     * 虚拟化妆
     * @param faceBase64 人脸base64编码
     * @param type 口红型号
     * @return 返回化好妆的人脸base64(经过美颜)
     */
    @PostMapping("/lipstick")
    public @ResponseBody
    String makeup(@RequestParam String faceBase64, @RequestParam String type){
        String result = faceBeautifyService.faceBeautify(faceBase64);
        JSONObject json = JSON.parseObject(result);
        String face = json.getString("result");
        return makeupService.makeup(face, type);
    }
}

package com.xiaoji.makeup.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.xiaoji.makeup.service.IFaceBeautifyService;
import com.xiaoji.makeup.service.IMakeupService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
@Api(tags = "虚拟化妆")
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
    @ApiOperation(value = "虚拟化妆", notes = "美颜+口红化装")
    public @ResponseBody
    String makeup(@RequestParam String faceBase64, @RequestParam String type){
        String result = faceBeautifyService.faceBeautify(faceBase64);
        JSONObject json = JSON.parseObject(result);
        String face = json.getString("result");
        return makeupService.makeup(face, type);
    }
}

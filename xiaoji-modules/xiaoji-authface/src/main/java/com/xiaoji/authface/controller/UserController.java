package com.xiaoji.authface.controller;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.xiaoji.authface.repository.User;
import com.xiaoji.authface.service.IFaceService;
import com.xiaoji.authface.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * User test Controller
 */

@CrossOrigin
@Controller // This means that this class is a Controller
@RequestMapping("") // This means URL's start with / (after Application path)
public class UserController {

    @Autowired // 只有当接口和实现都添加@Service注解才生效
    public IUserService userService;

    @Autowired
    public IFaceService faceService;      // Spring Boot要求这里必须是public

    /**
     * @ PostMapping: Map ONLY POST Requests
     * @ ResponseBody: means the returned String is the response, not a view name
     * @ RequestParam: means it is a parameter from the GET or POST request
     */

    // 路由注解只需要在Controller中实现就可以了，在服务实现和接口不添加也不会有影响

    /**
     * 注册时需要是FaceService与UserService通信的实例
     * step: [1] 从前端返回的账号、密码和人脸图像数据需要分开处理
     *       [2] 账号、密码和图像需要存入数据库中备份
     *       [3] 人脸数据单独注册到百度云的人脸库中
     * @param name 账号名称
     * @param password 密码
     * @param faceBase64 人脸图像信息 Base64格式
     * @return 返回注册结果提示消息
     */
    @PostMapping(path="/register")
    public @ResponseBody
    String addUser(@RequestParam String name, @RequestParam String password, @RequestParam String faceBase64){
        User user = userService.register(name, password, faceBase64);  // 数据人脸存储备份

        String res = faceService.faceRegister(user.getId().toString(), name, faceBase64);  // 百度云人脸注册, id与数据库保持一致

        return  "{{" + user + "}" + "," + res + "}";
    }

    // 账号登录
    @JsonProperty
    @PostMapping(path = "/login")
    public @ResponseBody
    String accountLogin(@RequestParam String name, @RequestParam String password){
        return userService.accountLogin(name, password);
    }

    // 人脸识别登录
    @PostMapping(path = "/faceLogin")
    public @ResponseBody String faceLogin(@RequestParam String faceBase64){
        return faceService.faceLogin(faceBase64);
    }

}

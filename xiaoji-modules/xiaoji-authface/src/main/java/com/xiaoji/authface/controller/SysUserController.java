package com.xiaoji.authface.controller;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.xiaoji.authface.domain.SysUser;
import com.xiaoji.authface.domain.User;
import com.xiaoji.authface.service.IFaceService;
import com.xiaoji.authface.service.IUserService;
import com.xiaoji.authface.utils.UuidUtilsLong;
import com.xiaoji.common.core.utils.result.Result;
import com.xiaoji.common.core.utils.result.ResultFactory;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@CrossOrigin
@Controller // This means that this class is a Controller
@RequestMapping("/user") // This means URL's start with / (after Application path)
@Api(tags = "移动用户登录注册模块")
public class SysUserController {

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
     * @param user 账号名称
     * @param user 密码
     * @param user 人脸图像信息 Base64格式
     * @return 返回注册结果提示消息
     */
    @ApiOperation(value = "register", notes = "账号+昵称+密码+人脸注册")
    @PostMapping(path="/register")
    public @ResponseBody
    String register(@RequestBody User user){
        // 账号密码存储在数据库中
        SysUser sysUser = userService.register(user.getAccount(),user.getNickname(),user.getPassword());
        System.out.println(sysUser.getId());
        // 人脸库中进行注册 -- 用户ID和昵称
        String res = faceService.faceRegister(sysUser.getId().toString(), user.getNickname(), user.getFaceBase64());  // 百度云人脸注册, id与数据库保持一致

        return  "{{" + sysUser + "}" + "," + res + "}";
    }

    @ApiOperation(value = "register", notes = "账号+昵称+密码")
    @PostMapping(path="/sregister")
    public @ResponseBody
    String simpleRegister(@RequestParam String account,@RequestParam String nickname, @RequestParam String password){
        // 账号密码存储在数据库中
        SysUser sysUser = userService.register(account, nickname, password);
        return sysUser.toString();
    }

    // 账号登录
    @JsonProperty
    @ApiOperation(value = "login", notes = "账号密码登录")
    @PostMapping(path = "/login")
    public @ResponseBody
    Result accountLogin(@RequestParam String name, @RequestParam String password){
        return userService.accountLogin(name, password);
    }

    // 人脸识别登录
    @ApiOperation(value = "人脸登录", notes = "人脸登录")
    @PostMapping(path = "/facelogin")
    public @ResponseBody Result faceLogin(@RequestBody User user){
//        System.out.println(user.getFaceBase64());
        if(null!=faceService.faceLogin(user.getFaceBase64())){
            return ResultFactory.buildSuccessResult(faceService.faceLogin(user.getFaceBase64()));
        }else{
            return ResultFactory.buildFailResult("FAILED");
        }
    }

}

package com.xiaoji.authface.service;

import com.xiaoji.authface.domain.SysUser;
import org.springframework.stereotype.Service;

@Service
public interface IFaceService {

    // 人脸识别登录
    SysUser faceLogin(String faceBase64);

    // 人脸注册
    String faceRegister(String user_id, String nickname, String faceBase64);

}

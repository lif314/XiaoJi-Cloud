package com.xiaoji.authface.service;

import com.xiaoji.authface.domain.SysUser;
import org.springframework.stereotype.Service;


@Service
public interface IUserService {

    // 注册用户
    SysUser register(String name,String nickname, String password);

    // 查询用户--- 账号登录
    String accountLogin(String name, String password);
}

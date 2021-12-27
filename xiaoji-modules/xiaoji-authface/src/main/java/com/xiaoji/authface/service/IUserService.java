package com.xiaoji.authface.service;

import com.xiaoji.authface.repository.User;
import org.springframework.stereotype.Service;


@Service
public interface IUserService {

    // 注册用户
    User register(String name, String password, String photo);

    // 查询用户--- 账号登录
    String accountLogin(String name, String password);
}

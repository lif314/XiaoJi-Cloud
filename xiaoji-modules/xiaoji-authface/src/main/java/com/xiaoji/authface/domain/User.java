package com.xiaoji.authface.domain;

import lombok.Data;

/**
 * @Author Sir Lancelot
 */
@Data
public class User {
    private String account;
    private String nickname;
    private String password;
    private String faceBase64;
}

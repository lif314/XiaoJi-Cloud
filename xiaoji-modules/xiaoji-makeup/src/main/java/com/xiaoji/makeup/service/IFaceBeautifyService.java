package com.xiaoji.makeup.service;

import org.springframework.stereotype.Service;

@Service
public interface IFaceBeautifyService {
    String faceBeautify(String faceBase64);
}

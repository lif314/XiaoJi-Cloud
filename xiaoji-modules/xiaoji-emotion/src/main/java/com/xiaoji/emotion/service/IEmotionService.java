package com.xiaoji.emotion.service;

import org.springframework.stereotype.Service;

@Service
public interface IEmotionService {

    String emotionRecognition(String faceBase64);
}

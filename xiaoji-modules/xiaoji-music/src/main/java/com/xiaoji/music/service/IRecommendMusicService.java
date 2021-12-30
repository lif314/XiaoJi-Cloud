package com.xiaoji.music.service;

import org.springframework.stereotype.Service;

@Service
public interface IRecommendMusicService {

    /**
     * 根据情绪推荐音乐
     * @param emoType 情绪类型
     * @return 音乐播放的URL
     */
    public String getMusicByEmo(String emoType);

}

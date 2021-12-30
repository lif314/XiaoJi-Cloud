package com.xiaoji.music.service;

import org.springframework.stereotype.Service;

/**
 * 智能音乐推荐服务
 *
 * @author xiaoji
 */
@Service
public class RecommendMusicService implements IRecommendMusicService {
    /**
     * 根据情绪推荐音乐
     *
     * @param emoType 情绪类型
     * @return 音乐播放的URL
     */
    @Override
    public String getMusicByEmo(String emoType) {
        return "http://121.36.229.15:9000/xiaoji/happy.mp3";
    }
}

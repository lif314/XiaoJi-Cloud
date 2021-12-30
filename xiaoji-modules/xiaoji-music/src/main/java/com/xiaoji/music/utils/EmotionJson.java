package com.xiaoji.music.utils;


import com.alibaba.fastjson.JSONObject;

import java.util.HashMap;
import java.util.Iterator;

/**
 * 提取值最高的情绪
 */
public class EmotionJson {
    /**
     * "emotion"{
     *     "anger":0.004,
     *      disgust":0.004,
     *      "fear":0.016,
     *      "happiness":91.362,
     *      "neutral":8.600,
     *      "sadness":0.004,
     *      "surprise":0.010
     *  }
     */
    public static String getHighestEmoType(String emotion){

        /**
         * @TODO JSON字符串转换
         */
        HashMap<String, Double> emotionMap =  new HashMap<>();
        JSONObject jsonObject = JSONObject.parseObject(emotion);
        JSONObject emotionJson = jsonObject.getJSONObject("emotion");

        return "happy";

    }
}

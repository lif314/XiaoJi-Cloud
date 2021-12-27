package com.xiaoji.weather.service.impl;

import com.xiaoji.weather.service.IAutoChangeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class AutoChangeService implements IAutoChangeService {

    //调用定位以及天气service提供的接口
    @Autowired
    private WeatherService weatherService;

    @Autowired
    private LocationService locationService;

    //调用定位以及天气service提供的接口,实现最适温度和最适光照的计算
    @Override
    public List<Integer> getAutoChangeInfo() {
        //室内最适宜温度
        Integer most_suit_temper=25;
        Integer most_suit_cd=400;
        String city_name;
        String real_city_name;
        //今日最适宜温度和光强list
        List<Integer> suit_list=new ArrayList<>();
        int recommend_temperature;
        int recommend_cd;
        //定义两个变量，对调用定位api的得到的城市名字符串进行剪切，传入天气api接口获取当前温度，和当天天气类型
        city_name=locationService.getLocationInfo().getContent().getAddress_detail().getCity();
        real_city_name=city_name.substring(0,city_name.length()-1);
        int now_temperature=Integer.parseInt(weatherService.getWeatherInfo(real_city_name).getResult().getRealtime().getTemperature());
        String now_info=weatherService.getWeatherInfo(real_city_name).getResult().getRealtime().getInfo();
        //使用算法进行最适温度和光强的计算，并且返回最适宜光强，温度
        recommend_temperature=most_suit_temper;
        recommend_cd=most_suit_cd;
        //最适宜光强
        if(now_info.equals("阴")||now_info.equals("阴转多云")
                ||now_info.equals("多云转阴"))
        {
            recommend_cd=recommend_cd+20;
        }
        else if (now_info.equals("多云")||now_info.equals("多云转晴")
                ||now_info.equals("晴转多云")||now_info.equals("晴")){
            recommend_cd=recommend_cd-50;
        }
        else if (now_info.equals("小雨")||now_info.equals("小雨转阴")
                ||now_info.equals("阴转小雨") || now_info.equals("中雨")
                ||now_info.equals("中雨转小雨")||now_info.equals("小雨转中雨")){
            recommend_cd=recommend_cd+40;
        }
        else if (now_info.equals("大雨转中雨")||now_info.equals("大雨")||
                now_info.equals("中雨转大雨")||now_info.equals("暴雨")){
            recommend_cd=recommend_cd+60;
        }
        else{
            recommend_cd=recommend_cd+80;
        }
        //最适宜温度
        if(now_temperature==27)
        {
            recommend_temperature=recommend_temperature;
        }
        else if(now_temperature>35){
            recommend_temperature=recommend_temperature+2;
        }
        else if(now_temperature<=35&&now_temperature>27){
            recommend_temperature=recommend_temperature+1;
        }
        else if(now_temperature<10){
            recommend_temperature=recommend_temperature-2;
        }
        else{
            recommend_temperature=recommend_temperature-1;
        }
        //传递计算出的最适宜温度光照
        suit_list.add(recommend_temperature);
        suit_list.add(recommend_cd);
        return suit_list;
    }
}

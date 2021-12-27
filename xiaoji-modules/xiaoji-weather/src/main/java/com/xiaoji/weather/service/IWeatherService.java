package com.xiaoji.weather.service;


import com.xiaoji.weather.entity.Weather.Weather;

//定义获取天气服务接口
public interface IWeatherService {
    Weather getWeatherInfo (String cityName);
}

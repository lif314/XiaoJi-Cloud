package com.xiaoji.weather.service;


import com.xiaoji.weather.entity.Location.Location;

//定义获取定位接口
public interface ILocationService {
    Location getLocationInfo();
}

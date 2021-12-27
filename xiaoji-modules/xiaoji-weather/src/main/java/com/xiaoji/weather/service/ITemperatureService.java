package com.xiaoji.weather.service;

import com.xiaoji.weather.entity.Temperature;

import java.util.List;

//定义改变temperature的接口
public interface ITemperatureService {
    List<Temperature> findAll();
    boolean add(Integer temper);
    Temperature search(Integer id);
    Temperature change(Integer id,Integer temper);

}

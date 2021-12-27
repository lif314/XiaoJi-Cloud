package com.xiaoji.weather.service.impl;


import com.xiaoji.weather.entity.Temperature;
import com.xiaoji.weather.repository.TemperatureRepository;
import com.xiaoji.weather.service.ITemperatureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

//温度的service层，为controller提供四个接口的函数
@Service
public class TemperatureService implements ITemperatureService {

    @Autowired
    private TemperatureRepository temperatureRepository;

    //获取当前温度信息
    @Override
    public List<Temperature> findAll() {
        return temperatureRepository.findAll();
    }

    //插入新的模式温度信息
    @Override
    public boolean add(Integer temper) {
        Temperature temperature1=new Temperature();
        if (temper!=null)
        {
            temperature1.setTemperature(temper);
            temperatureRepository.save(temperature1);
            return true;
        }
        else{
            return false;
        }
    }

    //通过id查询模式温度
    @Override
    public Temperature search(Integer id) {
        return temperatureRepository.findById(id).orElse(null);
    }

    //通过id改变温度
    @Override
    public Temperature change(Integer id,Integer temper) {
        Optional<Temperature> optional=temperatureRepository.findById(id);
        Temperature temperature1;
        if (optional.isPresent()){
            temperature1= optional.get();
        }else{
            return null;
        }
        temperature1.setTemperature(temper);
        return temperatureRepository.save(temperature1);
    }
}

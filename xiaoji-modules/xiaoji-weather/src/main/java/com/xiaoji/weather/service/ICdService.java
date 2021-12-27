package com.xiaoji.weather.service;



import com.xiaoji.weather.entity.Cd;

import java.util.List;

//定义改变cd的接口
public interface ICdService {
    List<Cd> findAll();
    boolean add(Integer cd);
    Cd search(Integer id);
    Cd change(Integer id,Integer cd);
}

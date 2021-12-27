package com.xiaoji.weather.service;

import java.util.List;

//定义自动调节室温，光照接口
public interface IAutoChangeService {
    List<Integer> getAutoChangeInfo();
}

package com.xiaoji.weather.controller;


import com.xiaoji.weather.entity.Weather.Weather;
import com.xiaoji.weather.service.impl.LocationService;
import com.xiaoji.weather.service.impl.WeatherService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

//天气预报服务
@Controller
@Slf4j
@CrossOrigin
@Api(tags = "天气预报模块")
@RequestMapping("/weather")
public class WeatherController {

    //调用定位以及天气service提供的接口
    @Autowired
    private WeatherService weatherService;

    @Autowired
    private LocationService locationService;

    //请求第三方url
    @GetMapping("/get")
    @ResponseBody
    //返回json数据
    @ApiOperation(value = "通过调用第三方服务返回天气信息", notes="当前天气信息Json")
    public Weather getLocationInfo(){
        String city_name;
        String real_city_name;
        //定义两个变量，对调用定位api的得到的城市名字符串进行剪切，传入天气api接口获取数据
        city_name=locationService.getLocationInfo().getContent().getAddress_detail().getCity();
        real_city_name=city_name.substring(0,city_name.length()-1);
        return weatherService.getWeatherInfo(real_city_name);
    }
}
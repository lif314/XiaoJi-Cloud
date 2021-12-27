package com.xiaoji.weather.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xiaoji.weather.entity.Weather.Weather;
import com.xiaoji.weather.service.IWeatherService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

//调用第三方天气服务
@Service
@Slf4j
public class WeatherService implements IWeatherService {

    //调用聚合数据的天气预报接口，key=0851cfd47284c372d1e3857527e8172e
    private static final String WEATHER_URL="http://apis.juhe.cn/simpleWeather/query?key=0851cfd47284c372d1e3857527e8172e&city=";

    //调用restTemplate获取json映射为String类
    @Autowired
    private RestTemplate restTemplate;

    //详细实现天气接口服务
    @Override
    public Weather getWeatherInfo(String cityName){
        //调用restTemplate获取json映射为String类
        ResponseEntity<String> responseEntity = restTemplate.getForEntity(WEATHER_URL + cityName, String.class);
        String responseEntityBody=responseEntity.getBody();
        ObjectMapper objectMapper =new ObjectMapper();
        Weather weather=null;
        try{
            //将String类映射到Location类中解析出数据
            weather=objectMapper.readValue(responseEntityBody,Weather.class);
        }catch (JsonProcessingException e){
            //映射出错
            e.printStackTrace();
            log.info("string转换实体异常");
        }
        //返回定位的数据
        return weather;
    }

}

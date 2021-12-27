package com.xiaoji.weather.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xiaoji.weather.entity.Location.Location;
import com.xiaoji.weather.service.ILocationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

//调用第三方定位服务
@Service
@Slf4j
public class LocationService implements ILocationService {

    //调用百度定位IPv4的定位，ak=6RGVOFVi7WqLMhMQZxaxTRDPElD5OTsV
    private static final String LOCATION_URL="http://api.map.baidu.com/location/ip?ak=6RGVOFVi7WqLMhMQZxaxTRDPElD5OTsV";

    //调用restTemplate获取json映射为String类
    @Autowired
    private RestTemplate restTemplate;

    //详细实现定位接口服务
    @Override
    public Location getLocationInfo() {
        //调用restTemplate获取json映射为String类
        ResponseEntity<String> responseEntity = restTemplate.getForEntity(LOCATION_URL, String.class);
        String responseEntityBody=responseEntity.getBody();
        ObjectMapper objectMapper =new ObjectMapper();
        Location location=null;
        try{
            //将String类映射到Location类中解析出数据
            location=objectMapper.readValue(responseEntityBody,Location.class);
        }catch (JsonProcessingException e){
            //映射出错
            e.printStackTrace();
            log.info("string转换实体异常");
        }
        //返回定位的数据
        return location;
    }
}

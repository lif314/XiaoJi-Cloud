package com.xiaoji.weather.controller;

import com.xiaoji.weather.service.impl.AutoChangeService;
import com.xiaoji.weather.service.impl.CdService;
import com.xiaoji.weather.service.impl.TemperatureService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Slf4j
@CrossOrigin
@Api(tags = "自动更改室内温度，光强模块")
public class AutoChangeController {

    private static final Integer id = 1;

    @Autowired
    private AutoChangeService autoChangeService;

    @Autowired
    private TemperatureService temperatureService;

    @Autowired
    private CdService cdService;

    //调用AutoChangeService获取最适宜温度光强，通过TemperatureService和CdService改变id=0的温度和光照
    @GetMapping("/autochange")
    @ApiOperation(value = "通过调用第三方服务自动更改室内温度，光强", notes="返回当前最适宜温度，光强")
    public List<Integer> autoChange(){
        //接收今日最适宜温度以及光照
        List<Integer> suit_list=autoChangeService.getAutoChangeInfo();
        Integer suit_temperature=suit_list.get(0);
        Integer suit_cd=suit_list.get(1);
        //需要添加是否更改成功反馈

        //改变数据库内的值
        temperatureService.change(id,suit_temperature);
        cdService.change(id,suit_cd);
        return suit_list;
    }
}

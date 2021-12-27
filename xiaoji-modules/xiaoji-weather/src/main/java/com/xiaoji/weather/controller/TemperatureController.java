package com.xiaoji.weather.controller;

import com.xiaoji.weather.entity.Temperature;
import com.xiaoji.weather.service.impl.TemperatureService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@CrossOrigin
@Api(tags = "室内温度控制相关模块")
@RequestMapping("/temp")
public class TemperatureController {

    @Autowired
    private TemperatureService temperatureService;


    //获取当前温度信息
    @GetMapping("/get")
    @ApiOperation(value = "查看所有情景模式的温度", notes="第一个情景模式为当前最适宜温度")
    public List<Temperature> getTemperature(){
        return temperatureService.findAll();
    }


    //插入新的模式温度信息
    @PostMapping("/insert")
    @ApiOperation(value = "通过接收新的温度，插入新的模式温度", notes="温度id顺序编号")
    @ApiImplicitParam(name="temperature",value="新定义的温度",required=true,paramType="form",dataType="Integer")
    public boolean addTemperature(@RequestParam("temperature")Integer temperature){
        return temperatureService.add(temperature);
    }


    //通过id查询模式温度
    @GetMapping("/get/{id}")
    @ApiOperation(value = "通过接收id，查询当前模式的温度", notes="id与temperature一一对应")
    @ApiImplicitParam(name="id",value="模式对应的id",required=true,paramType="path",dataType="Integer")
    public Temperature findById(@PathVariable("id")Integer id){
        return temperatureService.search(id);
    }


    //通过id改变温度
    @PutMapping("/update/{id}")
    @ApiOperation(value = "通过接收id，以及当前模式的温度，更改当前模式温度", notes="id所对应的情景模式需已经存在")
    @ApiImplicitParams({
            @ApiImplicitParam(name="id",value="模式对应的id",required=true,paramType="path",dataType="Integer"),
            @ApiImplicitParam(name="temperature",value="新定义的温度",required=true,paramType="form",dataType="Integer")
    })
    public Temperature changeTemperature(@PathVariable("id")Integer id,@RequestParam("temperature")Integer temperature){
        return temperatureService.change(id, temperature);
    }
}

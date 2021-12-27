package com.xiaoji.weather.controller;


import com.xiaoji.weather.entity.Cd;
import com.xiaoji.weather.service.impl.CdService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@Api(tags = "室内光强控制相关模块")
@RequestMapping("/cd")
public class CdController {

    @Autowired
    private CdService cdService;

    //获取当前所有模式光强信息
    @GetMapping("/get")
    @ApiOperation(value = "查看所有情景模式的光照强度", notes="第一个情景模式为当前最适宜光强")
    public List<Cd> getCd(){
        return cdService.findAll();
    }


    //插入新的光强信息
    @PostMapping("/insert")
    @ApiOperation(value = "通过接收新的光照强度，插入新的模式光强", notes="光强id顺序编号")
    @ApiImplicitParam(name="cd",value="新定义的光照强度",required=true,paramType="form",dataType="Integer")
    public boolean addCd(@RequestParam("cd")Integer cd){
        return cdService.add(cd);
    }


    //通过id查找光强信息
    @GetMapping("/get/{id}")
    @ApiOperation(value = "通过接收id，查询当前模式的光照强度", notes="id与cd一一对应")
    @ApiImplicitParam(name="id",value="模式对应的id",required=true,paramType="path",dataType="Integer")
    public @ResponseBody Cd findById(@PathVariable("id")Integer id){
        return cdService.search(id);
    }


    //通过id改变光强(可以做为改变模式的光强，但觉得没必要)
    //@RequestParam(value="cd",required=false)Integer cd,这样参数不必须
    @PutMapping("/update/{id}")
    @ApiOperation(value = "通过接收id，以及当前模式的光照强度，更改当前模式光强", notes="id所对应的情景模式需已经存在")
    @ApiImplicitParams({
            @ApiImplicitParam(name="id",value="模式对应的id",required=true,paramType="path",dataType="Integer"),
            @ApiImplicitParam(name="cd",value="新定义的光照强度",required=true,paramType="form",dataType="Integer")
    })
    public Cd changeCd(@PathVariable("id")Integer id,@RequestParam("cd")Integer cd){
        return cdService.change(id, cd);
    }

}

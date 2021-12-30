package com.xiaoji.movie.controller;


import com.xiaoji.common.core.utils.result.Result;
import com.xiaoji.common.core.utils.result.ResultFactory;
import com.xiaoji.movie.service.VideoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Author Sir Lancelot
 * @Description 影院片单
 */

@RestController
@CrossOrigin
@Api("家庭电影")
@RequestMapping("/movie")
public class VideoController {

    @Autowired
    private VideoService videoService;

    @ApiOperation("展示影单")
    @GetMapping("/all")
    public @ResponseBody
    Result listAll() {
        return ResultFactory.buildSuccessResult(videoService.findAll());
    }

    @ApiOperation("查询")
    @GetMapping("/search")
    public @ResponseBody Result searchResult(@RequestParam("keywords") String keywords) {
        if ("".equals(keywords)) {
            return ResultFactory.buildSuccessResult(videoService.findAll());
        } else {
            return ResultFactory.buildSuccessResult(videoService.Search(keywords));
        }
    }

    @ApiOperation("分类展示")
    @GetMapping("/type/{type}")
    public @ResponseBody Result listByCategory(@PathVariable("type") String type) {
        if (!"全部".equals(type)) {
            return ResultFactory.buildSuccessResult(videoService.findByType(type));
        } else {
            return ResultFactory.buildSuccessResult(videoService.findAll());
        }
    }
}

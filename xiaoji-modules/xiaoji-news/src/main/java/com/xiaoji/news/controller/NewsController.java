package com.xiaoji.news.controller;

import com.xiaoji.news.bean.JsonRootBean;
import com.xiaoji.news.service.RequestUrlService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@CrossOrigin
@RequestMapping("/news")
public class NewsController {

    @Autowired
    private RequestUrlService requestUrlService;

    //请求第三方url
    @GetMapping("/type")
    public @ResponseBody JsonRootBean getJsonRootBeanBytype(@RequestParam("type") String type){
        //使用service层调用第三方接口
        return requestUrlService.getJsonRootBeanBytype(type);
    }
}

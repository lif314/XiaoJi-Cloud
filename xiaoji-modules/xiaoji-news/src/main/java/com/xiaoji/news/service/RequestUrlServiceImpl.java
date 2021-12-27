package com.xiaoji.news.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xiaoji.news.bean.JsonRootBean;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
@Slf4j
public class RequestUrlServiceImpl implements RequestUrlService {
    //type有了，现在需要提供网址
    private static final String NEWS_URL = "https://v.juhe.cn/toutiao/index?key=300d1c24cb3962d3e81e59889ef30d14&type=";
    @Autowired
    private RestTemplate restTemplate;

    @Override
    public JsonRootBean getJsonRootBeanBytype(String type) {
        log.info("请求第三方");
        ResponseEntity<String> responseEntity = restTemplate.getForEntity(NEWS_URL + type, String.class);
        log.info("responseEntity --- 是" + responseEntity);
        //获取请求body
        String responseEntityBody = responseEntity.getBody();
        //将responseEntityBody转化为Data类
        ObjectMapper objectMapper = new ObjectMapper();//实体类的映射提取
        JsonRootBean jsonRootBean = null;
        try {
            jsonRootBean = objectMapper.readValue(responseEntityBody, JsonRootBean.class);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            log.info("转换出现了异常");
        }
        return jsonRootBean;
    }
}

package com.xiaoji.news.service;


import com.xiaoji.news.bean.JsonRootBean;
import org.springframework.stereotype.Service;

@Service
public interface RequestUrlService {
    JsonRootBean getJsonRootBeanBytype(String type);
}

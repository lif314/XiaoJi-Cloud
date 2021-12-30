package com.xiaoji.system.api;

import com.xiaoji.common.core.constant.ServiceNameConstants;
import com.xiaoji.common.core.utils.result.Result;
import com.xiaoji.system.api.factory.RemoteMovieFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 家庭影院服务
 *
 * @author xiaoji
 */
@FeignClient(contextId = "remoteMovieService", value = ServiceNameConstants.MOVIE_SERVICE, fallbackFactory = RemoteMovieFallbackFactory.class)
public interface RemoteMovieService {
    /**
     * 展示影单
     */
    @GetMapping("/movie/all")
    public Result listAll();

    /**
     * 搜索影片
     * @param keywords 搜索关键词
     */
    @GetMapping("/movie/search")
    public @ResponseBody Result searchResult(@RequestParam("keywords") String keywords);

    /**
     * 分类查看影片
     * @param type 影片类型
     */
    @GetMapping("/movie/type/{type}")
    public @ResponseBody Result listByCategory(@PathVariable("type") String type);
}

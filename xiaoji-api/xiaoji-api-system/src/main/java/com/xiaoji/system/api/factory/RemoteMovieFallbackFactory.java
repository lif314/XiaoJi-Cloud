package com.xiaoji.system.api.factory;

import com.xiaoji.common.core.domain.R;
import com.xiaoji.common.core.utils.result.Result;
import com.xiaoji.common.core.utils.result.ResultFactory;
import com.xiaoji.system.api.RemoteMovieService;
import com.xiaoji.system.api.RemoteUserService;
import com.xiaoji.system.api.domain.SysUser;
import com.xiaoji.system.api.model.LoginUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * 智能影院服务降级处理
 *
 * @author xiaoji
 *
 */
@Component
public class RemoteMovieFallbackFactory  implements FallbackFactory<RemoteMovieService> {
    private static final Logger log = LoggerFactory.getLogger(RemoteMovieFallbackFactory.class);

    @Override
    public RemoteMovieService create(Throwable throwable)
    {
        log.error("智能影院服务调用失败:{}", throwable.getMessage());
        return new RemoteMovieService()
        {
            /**
             * 展示影单
             */
            @Override
            public Result listAll() {
                return ResultFactory.buildFailResult("展示影单失败" + throwable.getMessage());
            }

            /**
             * 搜索影片
             *
             * @param keywords 搜索关键词
             */
            @Override
            public Result searchResult(String keywords) {
                return ResultFactory.buildFailResult("搜索影片失败" + throwable.getMessage());
            }

            /**
             * 分类查看影片
             *
             * @param type 影片类型
             */
            @Override
            public Result listByCategory(String type) {
                return ResultFactory.buildFailResult("分类查看影片失败" + throwable.getMessage());
            }
        };
    }
}

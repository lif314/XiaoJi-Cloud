package com.xiaoji.system.api.factory;

import com.xiaoji.common.core.domain.R;
import com.xiaoji.system.api.RemoteMakeupService;
import com.xiaoji.system.api.RemoteUserService;
import com.xiaoji.system.api.domain.SysUser;
import com.xiaoji.system.api.model.LoginUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * 虚拟化妆服务降级处理
 *
 * @author xiaoji
 *
 */
@Component
public class RemoteMakeupFallbackFactory implements FallbackFactory<RemoteMakeupService> {
    private static final Logger log = LoggerFactory.getLogger(RemoteMakeupFallbackFactory.class);

    @Override
    public RemoteMakeupService create(Throwable throwable)
    {
        log.error("虚拟化妆服务调用失败:{}", throwable.getMessage());
        return new RemoteMakeupService()
        {
            /**
             * 虚拟化妆
             *
             * @param faceBase64 人脸base64编码
             * @param type       口红型号
             * @return 返回化好妆的人脸base64(经过美颜)
             */
            @Override
            public String makeup(String faceBase64, String type) {
                return R.fail("虚拟化妆失败:" + throwable.getMessage()).toString();
            }
        };
    }
}

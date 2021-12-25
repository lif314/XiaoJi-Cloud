package com.xiaoji.gateway.service;

import java.io.IOException;
import com.xiaoji.common.core.exception.CaptchaException;
import com.xiaoji.common.core.web.domain.AjaxResult;

/**
 * 验证码处理
 * 
 * @author xiaoji
 */
public interface ValidateCodeService
{
    /**
     * 生成验证码
     */
    public AjaxResult createCapcha() throws IOException, CaptchaException;

    /**
     * 校验验证码
     */
    public void checkCapcha(String key, String value) throws CaptchaException;
}

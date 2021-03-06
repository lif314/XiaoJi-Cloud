package com.xiaoji.authface;

import com.xiaoji.common.security.annotation.EnableCustomConfig;
import com.xiaoji.common.security.annotation.EnableRyFeignClients;
import com.xiaoji.common.swagger.annotation.EnableCustomSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 *移动用户认证模块
 * 
 * @author xiaoji
 */

@EnableCustomSwagger2
@SpringBootApplication
@EnableRyFeignClients
public class XiaoJiAuthfaceApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(XiaoJiAuthfaceApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  人脸认证模块启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                "   _  __                __          _____            \n" +
                "  | |/,'  ()  _   _    / /  ()     /_  _/  __  __  /7\n" +
                "  /  /   /7 ,'o|,'o|n_/ /  /7       / /  ,'o/,',' / \\\n" +
                ",'_n_\\  //  |_,7|_,'\\_,'  //       /_/   |_( \\_\\ /n_/\n" +
                "                                                     ");
    }
}

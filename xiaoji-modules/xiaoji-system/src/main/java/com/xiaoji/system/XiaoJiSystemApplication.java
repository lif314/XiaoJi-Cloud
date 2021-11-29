package com.xiaoji.system;

import com.xaioji.common.swagger.annotation.EnableCustomSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import com.xiaoji.common.security.annotation.EnableCustomConfig;
import com.xiaoji.common.security.annotation.EnableRyFeignClients;

/**
 * 系统模块
 * 
 * @author ruoyi
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class XiaoJiSystemApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(XiaoJiSystemApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  系统模块启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                "   _  __                __          _____            \n" +
                "  | |/,'  ()  _   _    / /  ()     /_  _/  __  __  /7\n" +
                "  /  /   /7 ,'o|,'o|n_/ /  /7       / /  ,'o/,',' / \\\n" +
                ",'_n_\\  //  |_,7|_,'\\_,'  //       /_/   |_( \\_\\ /n_/\n" +
                "                                                     ");
    }
}

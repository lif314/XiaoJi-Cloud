package com.xiaoji.job;

import com.xaioji.common.swagger.annotation.EnableCustomSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import com.xiaoji.common.security.annotation.EnableCustomConfig;
import com.xiaoji.common.security.annotation.EnableRyFeignClients;

/**
 * 定时任务
 * 
 * @author ruoyi
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class XiaoJiJobApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(XiaoJiJobApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  定时任务模块启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                "   _  __                __          _____            \n" +
                "  | |/,'  ()  _   _    / /  ()     /_  _/  __  __  /7\n" +
                "  /  /   /7 ,'o|,'o|n_/ /  /7       / /  ,'o/,',' / \\\n" +
                ",'_n_\\  //  |_,7|_,'\\_,'  //       /_/   |_( \\_\\ /n_/\n" +
                "                                                     ");
    }
}

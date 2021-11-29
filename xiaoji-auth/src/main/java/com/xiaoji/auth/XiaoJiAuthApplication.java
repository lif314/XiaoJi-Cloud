package com.xiaoji.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import com.xiaoji.common.security.annotation.EnableRyFeignClients;

/**
 * 认证授权中心
 * 
 * @author xiaoji
 */
@EnableRyFeignClients
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class XiaoJiAuthApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(XiaoJiAuthApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  认证授权中心启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                "    _  __                __          _____            \n" +
                        "  | |/,'  ()  _   _    / /  ()     /_  _/  __  __  /7\n" +
                        "  /  /   /7 ,'o|,'o|n_/ /  /7       / /  ,'o/,',' / \\\n" +
                        ",'_n_\\  //  |_,7|_,'\\_,'  //       /_/   |_( \\_\\ /n_/\n" +
                        "                                                     ");
    }
}

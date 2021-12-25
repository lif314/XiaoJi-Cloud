package com.xiaoji.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 网关启动程序
 * 
 * @author xiaoji
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class XiaoJiGatewayApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(XiaoJiGatewayApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  小济网关启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                "    _  __                __          _____            \n" +
                "  | |/,'  ()  _   _    / /  ()     /_  _/  __  __  /7\n" +
                "  /  /   /7 ,'o|,'o|n_/ /  /7       / /  ,'o/,',' / \\\n" +
                ",'_n_\\  //  |_,7|_,'\\_,'  //       /_/   |_( \\_\\ /n_/\n" +
                "                                                     ");
    }
}

package com.xiaoji.scene;

import com.xiaoji.common.security.annotation.EnableRyFeignClients;
import com.xiaoji.common.swagger.annotation.EnableCustomSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 系统模块
 *
 * @author xiaoji
 */

@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class XiaoJiSceneApplication {
    public static void main(String[] args)
    {
        SpringApplication.run(XiaoJiSceneApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  情景模式启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                "   _  __                __          _____            \n" +
                "  | |/,'  ()  _   _    / /  ()     /_  _/  __  __  /7\n" +
                "  /  /   /7 ,'o|,'o|n_/ /  /7       / /  ,'o/,',' / \\\n" +
                ",'_n_\\  //  |_,7|_,'\\_,'  //       /_/   |_( \\_\\ /n_/\n" +
                "                                                     ");
    }
}

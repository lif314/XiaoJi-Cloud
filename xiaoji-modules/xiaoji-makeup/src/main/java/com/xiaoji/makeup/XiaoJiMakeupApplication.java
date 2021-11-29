package com.xiaoji.makeup;

//import com.xaioji.common.swagger.annotation.EnableCustomSwagger2;
//import com.xiaoji.common.security.annotation.EnableCustomConfig;
//import com.xiaoji.common.security.annotation.EnableRyFeignClients;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 * 启动类
 *
 * @author lilinfei
 */

//@EnableCustomSwagger2
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class XiaoJiMakeupApplication {
    public static void main(String[] args) {
        SpringApplication.run(XiaoJiMakeupApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  虚拟化妆模块启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                        "   _  __                __          _____            \n" +
                        "  | |/,'  ()  _   _    / /  ()     /_  _/  __  __  /7\n" +
                        "  /  /   /7 ,'o|,'o|n_/ /  /7       / /  ,'o/,',' / \\\n" +
                        ",'_n_\\  //  |_,7|_,'\\_,'  //       /_/   |_( \\_\\ /n_/\n" +
                        "                                                     "
                );
    }
}

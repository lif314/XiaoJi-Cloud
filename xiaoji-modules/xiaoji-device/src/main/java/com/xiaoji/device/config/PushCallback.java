
package com.xiaoji.device.config;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.xiaoji.common.core.utils.ServletUtils;
import com.xiaoji.common.core.utils.ip.IpUtils;
import com.xiaoji.device.domain.*;
import com.xiaoji.device.service.IIotCategoryService;
import com.xiaoji.device.service.IIotDeviceService;
import com.xiaoji.device.service.IIotDeviceSetService;
import com.xiaoji.device.service.IIotDeviceStatusService;
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.xiaoji.device.util.AddressUtils;

import java.util.Random;

/**
 * 消费监听类
 */
@Component
public class PushCallback implements MqttCallback {
    private static final Logger logger = LoggerFactory.getLogger(MqttPushClient.class);

    @Autowired
    private MqttConfig mqttConfig;
    @Autowired
    private IIotDeviceService iotDeviceService;
    @Autowired
    private IIotCategoryService iotCategoryService;
    @Autowired
    private IIotDeviceStatusService iotDeviceStatusService;
    @Autowired
    private IIotDeviceSetService iotDeviceSetService;
    @Autowired
    private MqttPushClient mqttPushClient;

    private static MqttClient client;

    @Override
    public void connectionLost(Throwable throwable) {
        // 连接丢失后，一般在这里面进行重连
        logger.info("连接断开，可以做重连");
        if (client == null || !client.isConnected()) {
            mqttConfig.getMqttPushClient();
        }
    }

    @Override
    public void messageArrived(String topic, MqttMessage mqttMessage) throws Exception {
        // subscribe后得到的消息会执行到这里面
        logger.info("接收消息主题 : " + topic);
        logger.info("接收消息Qos : " + mqttMessage.getQos());
        logger.info("接收消息内容 : " + new String(mqttMessage.getPayload()));
        try {
            JSONObject jsonObject = JSON.parseObject(new String(mqttMessage.getPayload()));
        }catch (Exception e){
            System.err.println("===未知消息格式："+new String(mqttMessage.getPayload()));
            return;
        }
        if (topic.equals("device_info")) {
            //添加设备信息
            IotDevice device = JSON.parseObject(new String(mqttMessage.getPayload()), IotDevice.class);
            IotDevice deviceEntity = iotDeviceService.selectIotDeviceByNum(device.getDeviceNum());
            if (deviceEntity != null) {
                device.setDeviceId(deviceEntity.getDeviceId());
                iotDeviceService.updateIotDevice(device);
            } else {
                IotCategory categoryEntity = iotCategoryService.selectIotCategoryById(device.getCategoryId());
                if (device.getDeviceName() == null || device.getDeviceNum().length() == 0) {
                    Random rand = new Random(); //随机生成两位数
                    device.setDeviceName(categoryEntity.getCategoryName() + (rand.nextInt(90) + 10));
                }
                iotDeviceService.insertIotDevice(device);
            }
            //获取设备状态(消息内容不能为空，硬件获取不到数据报错)
            mqttPushClient.publish(1, false, "status/get/" + device.getDeviceNum(), "xiaoji.live");
            //获取设备配置
            mqttPushClient.publish(1, false, "setting/get/" + device.getDeviceNum(), "xiaoji.live");
        } else if (topic.equals("status")) {
            IotDeviceStatus deviceStatus = JSON.parseObject(new String(mqttMessage.getPayload()), IotDeviceStatus.class);
            IotDevice device = iotDeviceService.selectIotDeviceByNum(deviceStatus.getDeviceNum());
            //添加设备状态
            deviceStatus.setDeviceId(device.getDeviceId());
            iotDeviceStatusService.insertIotDeviceStatus(deviceStatus);
        } else if (topic.equals("setting")) {
            IotDeviceSet deviceSet = JSON.parseObject(new String(mqttMessage.getPayload()), IotDeviceSet.class);
            // 智能配网时需要获取IP、地址和设备用户
            IotDevice device = iotDeviceService.selectIotDeviceByNum(deviceSet.getDeviceNum());
            if (deviceSet.getIsSmartConfig() == 1) {
                final String ip = IpUtils.getIpAddr(ServletUtils.getRequest());
                deviceSet.setNetworkIp(ip);
                deviceSet.setNetworkAddress(AddressUtils.getRealAddressByIP(ip));
                //更新设备用户
                device.setOwnerId(deviceSet.getOwnerId());
                iotDeviceService.updateIotDevice(device);
            }
            //添加设备配置
            deviceSet.setDeviceId(device.getDeviceId());
            iotDeviceSetService.insertIotDeviceSet(deviceSet);
        } else if (topic.equals("offline")) {
            //离线遗嘱
            IotDeviceStatus deviceStatus = JSON.parseObject(new String(mqttMessage.getPayload()), IotDeviceStatus.class);
            IotDeviceStatus deviceStatusEntity = iotDeviceStatusService.selectIotDeviceStatusByDeviceNum(deviceStatus.getDeviceNum());
            //设备状态为离线
            if (deviceStatusEntity != null) {
                deviceStatusEntity.setIsOnline(0);
                iotDeviceStatusService.insertIotDeviceStatus(deviceStatusEntity);
            }
        } else if (topic.equals("cmd")) {
            IotDeviceCmd deviceSet = JSON.parseObject(new String(mqttMessage.getPayload()), IotDeviceCmd.class);
            // 智能配网时需要获取IP、地址和设备用户
            IotDevice device = iotDeviceService.selectIotDeviceByNum(deviceSet.getDeviceNum());

            String cmdJson = JSONObject.toJSONString(deviceSet);
            //向设备发送指令
            mqttPushClient.publish(1, false, "cmd/get/" + device.getDeviceNum(), cmdJson);

        }
    }

    @Override
    public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {
        logger.info("deliveryComplete---------" + iMqttDeliveryToken.isComplete());
    }
}

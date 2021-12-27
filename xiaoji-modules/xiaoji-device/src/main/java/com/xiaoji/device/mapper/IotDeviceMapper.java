package com.xiaoji.device.mapper;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoji.device.domain.IotDevice;
import com.xiaoji.device.domain.vo.IotDeviceListDto;
import org.apache.ibatis.annotations.Param;


/**
 * 设备Mapper接口
 *
 */

public interface IotDeviceMapper {
    /**
     * 查询设备
     *
     * @param deviceId 设备ID
     * @return 设备
     */
    public IotDevice selectIotDeviceById(Long deviceId);

    /**
     * 根据编号查询设备
     *
     * @param deviceNum 设备编号
     * @return 设备
     */
    public IotDevice selectIotDeviceByNum(String deviceNum);

    /**
     * 查询设备列表
     *
     * @param iotDevice 设备
     * @return 设备集合
     */
    public List<IotDeviceListDto> selectIotDeviceList(IotDevice iotDevice);

    /**
     * 新增设备
     *
     * @param iotDevice 设备
     * @return 结果
     */
    public int insertIotDevice(IotDevice iotDevice);

    /**
     * 修改设备
     *
     * @param iotDevice 设备
     * @return 结果
     */
    public int updateIotDevice(IotDevice iotDevice);

    /**
     * 删除设备
     *
     * @param deviceId 设备ID
     * @return 结果
     */
    public int deleteIotDeviceById(Long deviceId);

    /**
     * 批量删除设备
     *
     * @param deviceIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteIotDeviceByIds(Long[] deviceIds);

    List<IotDeviceListDto> selectMpIotDeviceList(IotDevice iotDevice);

    JSONObject getDeviceInfoByDeviceNum(@Param("userId") Long userId,@Param("deviceNum")  String deviceNum);

    JSONObject getDeviceInfoByDeviceId(@Param("userId") Long userId,@Param("deviceId")  Long deviceId);
}

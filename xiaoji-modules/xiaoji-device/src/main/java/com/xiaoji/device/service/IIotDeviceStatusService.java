package com.xiaoji.device.service;

import com.xiaoji.device.domain.IotDeviceStatus;

import java.util.List;


/**
 * 设备状态Service接口
 *
 */
public interface IIotDeviceStatusService {
    /**
     * 查询设备状态
     *
     * @param deviceStatusId 设备状态ID
     * @return 设备状态
     */
    public IotDeviceStatus selectIotDeviceStatusById(Long deviceStatusId);

    /**
     * 查询设备最新状态
     *
     * @param deviceId 设备ID
     * @return 设备状态
     */
    public IotDeviceStatus selectIotDeviceStatusByDeviceId(Long deviceId);

    /**
     * 根据设备编号查询设备最新状态
     *
     * @param deviceNum 设备编号
     * @return 设备状态
     */
    public IotDeviceStatus selectIotDeviceStatusByDeviceNum(String deviceNum);

    /**
     * 查询设备状态列表
     *
     * @param iotDeviceStatus 设备状态
     * @return 设备状态集合
     */
    public List<IotDeviceStatus> selectIotDeviceStatusList(IotDeviceStatus iotDeviceStatus);

    /**
     * 新增设备状态
     *
     * @param iotDeviceStatus 设备状态
     * @return 结果
     */
    public int insertIotDeviceStatus(IotDeviceStatus iotDeviceStatus);

    /**
     * 修改设备状态
     *
     * @param iotDeviceStatus 设备状态
     * @return 结果
     */
    public int updateIotDeviceStatus(IotDeviceStatus iotDeviceStatus);

    /**
     * 批量删除设备状态
     *
     * @param deviceStatusIds 需要删除的设备状态ID
     * @return 结果
     */
    public int deleteIotDeviceStatusByIds(Long[] deviceStatusIds);

    /**
     * 删除设备状态信息
     *
     * @param deviceStatusId 设备状态ID
     * @return 结果
     */
    public int deleteIotDeviceStatusById(Long deviceStatusId);
}

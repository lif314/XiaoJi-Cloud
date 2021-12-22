package com.xiaoji.device.service.impl;

import java.util.List;


import com.xiaoji.common.core.utils.DateUtils;
import com.xiaoji.device.domain.IotDeviceStatus;
import com.xiaoji.device.mapper.IotDeviceStatusMapper;
import com.xiaoji.device.service.IIotDeviceStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 设备状态Service业务层处理
 *
 */
@Service
public class IotDeviceStatusServiceImpl implements IIotDeviceStatusService {
    @Autowired
    private IotDeviceStatusMapper iotDeviceStatusMapper;

    /**
     * 查询设备状态
     *
     * @param deviceStatusId 设备状态ID
     * @return 设备状态
     */
    @Override
    public IotDeviceStatus selectIotDeviceStatusById(Long deviceStatusId) {
        return iotDeviceStatusMapper.selectIotDeviceStatusById(deviceStatusId);
    }

    /**
     * 查询最新设备状态
     *
     * @param deviceId 设备ID
     * @return 设备状态
     */
    @Override
    public IotDeviceStatus selectIotDeviceStatusByDeviceId(Long deviceId) {
        return iotDeviceStatusMapper.selectIotDeviceStatusByDeviceId(deviceId);
    }

    /**
     * 根据设备编号查询最新设备状态
     *
     * @param deviceNum 设备编号
     * @return 设备状态
     */
    @Override
    public IotDeviceStatus selectIotDeviceStatusByDeviceNum(String deviceNum) {
        return iotDeviceStatusMapper.selectIotDeviceStatusByDeviceNum(deviceNum);
    }

    /**
     * 查询设备状态列表
     *
     * @param iotDeviceStatus 设备状态
     * @return 设备状态
     */
    @Override
    public List<IotDeviceStatus> selectIotDeviceStatusList(IotDeviceStatus iotDeviceStatus) {
        return iotDeviceStatusMapper.selectIotDeviceStatusList(iotDeviceStatus);
    }

    /**
     * 新增设备状态
     *
     * @param iotDeviceStatus 设备状态
     * @return 结果
     */
    @Override
    public int insertIotDeviceStatus(IotDeviceStatus iotDeviceStatus) {
        iotDeviceStatus.setCreateTime(DateUtils.getNowDate());
        return iotDeviceStatusMapper.insertIotDeviceStatus(iotDeviceStatus);
    }

    /**
     * 修改设备状态
     *
     * @param iotDeviceStatus 设备状态
     * @return 结果
     */
    @Override
    public int updateIotDeviceStatus(IotDeviceStatus iotDeviceStatus) {
        iotDeviceStatus.setUpdateTime(DateUtils.getNowDate());
        return iotDeviceStatusMapper.updateIotDeviceStatus(iotDeviceStatus);
    }

    /**
     * 批量删除设备状态
     *
     * @param deviceStatusIds 需要删除的设备状态ID
     * @return 结果
     */
    @Override
    public int deleteIotDeviceStatusByIds(Long[] deviceStatusIds) {
        return iotDeviceStatusMapper.deleteIotDeviceStatusByIds(deviceStatusIds);
    }

    /**
     * 删除设备状态信息
     *
     * @param deviceStatusId 设备状态ID
     * @return 结果
     */
    @Override
    public int deleteIotDeviceStatusById(Long deviceStatusId) {
        return iotDeviceStatusMapper.deleteIotDeviceStatusById(deviceStatusId);
    }
}

package com.xiaoji.device.service.impl;


import com.xiaoji.common.core.utils.DateUtils;
import com.xiaoji.device.domain.IotCategory;
import com.xiaoji.device.mapper.IotCategoryMapper;
import com.xiaoji.device.service.IIotCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * 设备分类Service业务层处理
 *
 * @author xiaoji
 *
 */
@Service
public class IotCategoryServiceImpl implements IIotCategoryService {
    @Autowired
    private IotCategoryMapper iotCategoryMapper;

    /**
     * 查询设备分类
     *
     * @param categoryId 设备分类ID
     * @return 设备分类
     */
    @Override
    public IotCategory selectIotCategoryById(Long categoryId) {
        return iotCategoryMapper.selectIotCategoryById(categoryId);
    }

    /**
     * 查询设备分类列表
     *
     * @param iotCategory 设备分类
     * @return 设备分类
     */
    @Override
    public List<IotCategory> selectIotCategoryList(IotCategory iotCategory) {
        return iotCategoryMapper.selectIotCategoryList(iotCategory);
    }

    /**
     * 新增设备分类
     *
     * @param iotCategory 设备分类
     * @return 结果
     */
    @Override
    public int insertIotCategory(IotCategory iotCategory) {
        iotCategory.setCreateTime(DateUtils.getNowDate());
        return iotCategoryMapper.insertIotCategory(iotCategory);
    }

    /**
     * 修改设备分类
     *
     * @param iotCategory 设备分类
     * @return 结果
     */
    @Override
    public int updateIotCategory(IotCategory iotCategory) {
        iotCategory.setUpdateTime(DateUtils.getNowDate());
        return iotCategoryMapper.updateIotCategory(iotCategory);
    }

    /**
     * 批量删除设备分类
     *
     * @param categoryIds 需要删除的设备分类ID
     * @return 结果
     */
    @Override
    public int deleteIotCategoryByIds(Long[] categoryIds) {
        return iotCategoryMapper.deleteIotCategoryByIds(categoryIds);
    }

    /**
     * 删除设备分类信息
     *
     * @param categoryId 设备分类ID
     * @return 结果
     */
    @Override
    public int deleteIotCategoryById(Long categoryId) {
        return iotCategoryMapper.deleteIotCategoryById(categoryId);
    }
}

package com.xiaoji.weather.service.impl;


import com.xiaoji.weather.entity.Cd;
import com.xiaoji.weather.repository.CdRepository;
import com.xiaoji.weather.service.ICdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

//光照的service层，为controller提供四个接口的函数
@Service
public class CdService implements ICdService {

    @Autowired
    private CdRepository cdRepository;

    //获取当前所有模式光强信息
    @Override
    public List<Cd> findAll() {
        return cdRepository.findAll();
    }

    //插入新的光强信息
    @Override
    public boolean add(Integer cd) {
        Cd cd1=new Cd();
        if (cd!=null){
            cd1.setCd(cd);
            cdRepository.save(cd1);
            return true;
        }
        else{
            return false;
        }
    }

    //通过id查找光强信息
    @Override
    public Cd search(Integer id) {
       return cdRepository.findById(id).orElse(null);
    }

    //通过id改变光强
    @Override
    public Cd change(Integer id, Integer cd) {
        Optional<Cd> optional =cdRepository.findById(id);
        Cd cd1;
        if (optional.isPresent()){
            cd1= optional.get();
        }else{
            return null;
        }
        cd1.setCd(cd);
        return cdRepository.save(cd1);
    }
}

package com.xiaoji.weather.repository;


import com.xiaoji.weather.entity.Temperature;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

// 持久层直接进行增删改查，对数据库进行操作
@Repository
public interface TemperatureRepository extends JpaRepository<Temperature, Integer> {
}

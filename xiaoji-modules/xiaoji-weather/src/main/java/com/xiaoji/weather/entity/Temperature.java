package com.xiaoji.weather.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

//@Entity注解自动建库
@Entity
public class Temperature {

    //指定temperature_Id是主码，排序默认顺序排序
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer temperature_Id;

    private Integer temperature;


    //常规函数
    public Temperature(){}

    public Integer getTemperature() {
        return temperature;
    }

    public void setTemperature(Integer temperature) {
        this.temperature = temperature;
    }

    public Integer getTemperature_Id() {
        return temperature_Id;
    }

    public void setTemperature_Id(Integer temperature_Id) {
        this.temperature_Id = temperature_Id;
    }
}

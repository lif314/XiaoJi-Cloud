package com.xiaoji.weather.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

//@Entity注解自动建库
@Entity
public class Cd {

    //指定cd_Id是主码，排序默认顺序排序
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cd_Id;

    private Integer Cd;


    //常规函数
    public Cd(){}

    public Integer getCd_Id() {
        return cd_Id;
    }

    public void setCd_Id(Integer cd_Id) {
        this.cd_Id = cd_Id;
    }

    public Integer getCd() {
        return Cd;
    }

    public void setCd(Integer cd) {
        Cd = cd;
    }
}

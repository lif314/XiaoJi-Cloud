package com.xiaoji.finance.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;
import java.sql.Date;

/**
 * @Author Sir Lancelot
 * @Since 2021/12/5 23:20
 * @Description
 */
@Entity
@Data
@Table(name="expect")
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
public class Expect {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    Integer id;
    double food;
    double clothes;
    double dailyNecessitiesServices;
    double dotc;
    double education;
    double entertainment;
    double medical;
    Date date;
}

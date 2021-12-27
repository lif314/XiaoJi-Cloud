package com.xiaoji.finance.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;
import java.sql.Date;

/**
 * @Author Sir Lancelot
 * @Since 2021/12/5 23:16
 * @Description
 */
@Entity
@Data
@Table(name="income")
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
public class Income {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    Integer id;
    double realEstate;
    double deposit;
    double salary;
    double dividend;
    double socialSecurity;
    double others;
    Date date;
}

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
@Table(name = "income")
@Data
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
public class Income {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "real_estate")
    private Double realEstate;

    @Column(name = "deposit")
    private Double deposit;

    @Column(name = "salary")
    private Double salary;

    @Column(name = "dividend")
    private Double dividend;

    @Column(name = "social_security")
    private Double socialSecurity;

    @Column(name = "others")
    private Double others;

    @Column(name = "date")
    private Integer date;

    @Column(name = "family_id")
    private Integer familyId;

}

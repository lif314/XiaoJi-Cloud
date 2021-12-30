package com.xiaoji.finance.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;
import java.sql.Date;
import java.time.LocalDate;

/**
 * @Author Sir Lancelot
 * @Since 2021/12/5 23:20
 * @Description
 */
@Entity
@Table(name = "expect")
@Data
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
public class Expect {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "food")
    private Double food;

    @Column(name = "clothes")
    private Double clothes;

    @Column(name = "daily_necessities")
    private Double dailyNecessities;

    @Column(name = "dotc")
    private Double dotc;

    @Column(name = "education")
    private Double education;

    @Column(name = "entertainment")
    private Double entertainment;

    @Column(name = "medical")
    private Double medical;

    @Column(name = "date")
    private LocalDate date;

    @Column(name = "family_id")
    private Integer familyId;

}

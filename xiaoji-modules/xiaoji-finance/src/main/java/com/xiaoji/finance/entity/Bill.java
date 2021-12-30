package com.xiaoji.finance.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "bill")
@Data
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
public class Bill {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "type", length = 45)
    private String type;

    @Column(name = "amount")
    private Double amount;

    @Column(name = "date")
    private LocalDate date;

    @Column(name = "name")
    private String name;

    @Column(name = "family_id")
    private Integer familyId;

}

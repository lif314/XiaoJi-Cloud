package com.xiaoji.movie.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "film")
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
public class Film {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "cover")
    private String cover;

    @Column(name = "title")
    private String title;

    @Column(name = "type", length = 45)
    private String type;

    @Column(name = "uri")
    private String uri;

    @Column(name = "`desc`")
    private String desc;

}

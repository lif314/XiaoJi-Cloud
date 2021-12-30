package com.xiaoji.scene.dao;

/**
 * 情景模式 要素
 */
public class Scene {
    private String music_url;
    private String movie_url;
    private Integer temperature;
    private Integer cd;

    public String getMusic_url() {
        return music_url;
    }

    public void setMusic_url(String music_url) {
        this.music_url = music_url;
    }

    public String getMovie_url() {
        return movie_url;
    }

    public void setMovie_url(String movie_url) {
        this.movie_url = movie_url;
    }

    public Integer getTemperature() {
        return temperature;
    }

    public void setTemperature(Integer temperature) {
        this.temperature = temperature;
    }

    public Integer getCd() {
        return cd;
    }

    public void setCd(Integer cd) {
        this.cd = cd;
    }
}

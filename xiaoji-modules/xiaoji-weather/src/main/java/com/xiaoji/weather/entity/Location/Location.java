package com.xiaoji.weather.entity.Location;

//自动接收第三方api传送的json数据，逐层分解获取数据
public class Location {

    private String address;

    private Content content;

    private int status;

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {
        return address;
    }

    public void setContent(Content content) {
        this.content = content;
    }

    public Content getContent() {
        return content;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

}

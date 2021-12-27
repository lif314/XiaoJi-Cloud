package com.xiaoji.weather.entity.Location;

public class Address_detail {

    private String province;

    private String city;

    private String district;

    private String street_number;

    private String adcode;

    private String street;

    private int city_code;

    public void setProvince(String province) {
        this.province = province;
    }

    public String getProvince() {
        return province;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCity() {
        return city;
    }


    public void setDistrict(String district) {
        this.district = district;
    }

    public String getDistrict() {
        return district;
    }


    public void setStreet_number(String street_number) {
        this.street_number = street_number;
    }

    public String getStreet_number() {
        return street_number;
    }


    public void setAdcode(String adcode) {
        this.adcode = adcode;
    }

    public String getAdcode() {
        return adcode;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getStreet() {
        return street;
    }

    public void setCity_code(int city_code) {
        this.city_code = city_code;
    }

    public int getCity_code() {
        return city_code;
    }

}
package com.xiaoji.weather.entity.Location;

public class Content {

    private Address_detail address_detail;
    private Point point;
    private String address;
    public void setAddress_detail(Address_detail address_detail) {
        this.address_detail = address_detail;
    }
    public Address_detail getAddress_detail() {
        return address_detail;
    }

    public void setPoint(Point point) {
        this.point = point;
    }
    public Point getPoint() {
        return point;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    public String getAddress() {
        return address;
    }

}

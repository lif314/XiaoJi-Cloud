package com.xiaoji.weather.entity.Weather;

//自动接收第三方api传送的json数据，逐层分解获取数据
public class Weather {

    private String reason;

    private Result result;

    private int error_code;

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getReason() {
        return reason;
    }

    public void setResult(Result result) {
        this.result = result;
    }

    public Result getResult() {
        return result;
    }

    public void setError_code(int error_code) {
        this.error_code = error_code;
    }

    public int getError_code() {
        return error_code;
    }

}

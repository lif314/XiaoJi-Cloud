/**
  * Copyright 2021 bejson.com 
  */
package com.xiaoji.news.bean;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.List;

/**
 * Auto-generated: 2021-12-02 22:13:28
 *
 * @author bejson.com (i@bejson.com)
 * @website http://www.bejson.com/java2pojo/
 */
@JsonIgnoreProperties({"stat","page","pageSize"})
public class Result {

    private String stat;
    private List<Data> data;
    private String page;
    private String pageSize;
    public void setStat(String stat) {
         this.stat = stat;
     }
     public String getStat() {
         return stat;
     }

    public void setData(List<Data> data) {
         this.data = data;
     }
     public List<Data> getData() {
         return data;
     }

    public void setPage(String page) {
         this.page = page;
     }
     public String getPage() {
         return page;
     }

    public void setPageSize(String pageSize) {
         this.pageSize = pageSize;
     }
     public String getPageSize() {
         return pageSize;
     }

}
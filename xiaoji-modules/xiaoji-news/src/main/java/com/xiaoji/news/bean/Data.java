
package com.xiaoji.news.bean;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.Date;

/**
 * Auto-generated: 2021-12-02 22:13:28
 *
 * @author bejson.com (i@bejson.com)
 * @website http://www.bejson.com/java2pojo/
 */
@JsonIgnoreProperties({"date","uniquekey","category","author_name","is_content","thumbnail_pic_s02","thumbnail_pic_s03",})
public class Data {

    private String uniquekey;
    private String title;
    private Date date;
    private String category;
    private String author_name;
    private String url;
    private String thumbnail_pic_s;
    private String thumbnail_pic_s02;
    private String thumbnail_pic_s03;
    private String is_content;
    public void setUniquekey(String uniquekey) {
         this.uniquekey = uniquekey;
     }
     public String getUniquekey() {
         return uniquekey;
     }

    public void setTitle(String title) {
         this.title = title;
     }
     public String getTitle() {
         return title;
     }

    public void setDate(Date date) {
         this.date = date;
     }
     public Date getDate() {
         return date;
     }

    public void setCategory(String category) {
         this.category = category;
     }
     public String getCategory() {
         return category;
     }

    public void setAuthor_name(String author_name) {
         this.author_name = author_name;
     }
     public String getAuthor_name() {
         return author_name;
     }

    public void setUrl(String url) {
         this.url = url;
     }
     public String getUrl() {
         return url;
     }

    public void setThumbnail_pic_s(String thumbnail_pic_s) {
         this.thumbnail_pic_s = thumbnail_pic_s;
     }
     public String getThumbnail_pic_s() {
         return thumbnail_pic_s;
     }

    public void setThumbnail_pic_s02(String thumbnail_pic_s02) {
         this.thumbnail_pic_s02 = thumbnail_pic_s02;
     }
     public String getThumbnail_pic_s02() {
         return thumbnail_pic_s02;
     }

    public void setThumbnail_pic_s03(String thumbnail_pic_s03) {
         this.thumbnail_pic_s03 = thumbnail_pic_s03;
     }
     public String getThumbnail_pic_s03() {
         return thumbnail_pic_s03;
     }

    public void setIs_content(String is_content) {
         this.is_content = is_content;
     }
     public String getIs_content() {
         return is_content;
     }

}
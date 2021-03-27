package com.yaofen.bean;

public class Country {
    private Integer id;
    private String name;
    private String img;
    private String story;
    private String click;
    private String createTime;
    private String countryId;
    private String detail;
    private String belong;
    private Integer goodNum;

    public Country() {
    }


    public Integer getGoodNum() {
        return goodNum;
    }

    public Country(Integer id, String name, String img, String story, String click, String createTime, String countryId, String detail, String belong, Integer goodNum) {
        this.id = id;
        this.name = name;
        this.img = img;
        this.story = story;
        this.click = click;
        this.createTime = createTime;
        this.countryId = countryId;
        this.detail = detail;
        this.belong = belong;
        this.goodNum = goodNum;
    }

    public void setGoodNum(Integer goodNum) {
        this.goodNum = goodNum;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getStory() {
        return story;
    }

    public void setStory(String story) {
        this.story = story;
    }

    public String getClick() {
        return click;
    }

    public void setClick(String click) {
        this.click = click;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getCountryId() {
        return countryId;
    }

    public void setCountryId(String countryId) {
        this.countryId = countryId;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getBelong() {
        return belong;
    }

    public void setBelong(String belong) {
        this.belong = belong;
    }
}

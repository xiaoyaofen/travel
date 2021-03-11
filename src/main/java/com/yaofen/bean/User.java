package com.yaofen.bean;

public class User {
    private int id;
    private String name;
    private String pwd;
    private String work;
    private String tel;
    private String email;
    private String point;
    private String roleid;
    private String sex;
    private int level;
    private String date;
    private String state;
    private String downCount;
    private String uploadCount;
    private String time;

    public User() {
    }

    public User(int id, String name, String pwd, String work,
                String tel, String email, String point, String roleid,
                String sex, int level, String date, String state, String downCount,
                String uploadCount, String time) {
        this.id = id;
        this.name = name;
        this.pwd = pwd;
        this.work = work;
        this.tel = tel;
        this.email = email;
        this.point = point;
        this.roleid = roleid;
        this.sex = sex;
        this.level = level;
        this.date = date;
        this.state = state;
        this.downCount = downCount;
        this.uploadCount = uploadCount;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPoint() {
        return point;
    }

    public void setPoint(String point) {
        this.point = point;
    }

    public String getRoleid() {
        return roleid;
    }

    public void setRoleid(String roleid) {
        this.roleid = roleid;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getDownCount() {
        return downCount;
    }

    public void setDownCount(String downCount) {
        this.downCount = downCount;
    }

    public String getUploadCount() {
        return uploadCount;
    }

    public void setUploadCount(String uploadCount) {
        this.uploadCount = uploadCount;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}

package com.yaofen.bean;

public class User {
    private int id;
    private String account;
    private String password;
    private String tel;
    private String email;
    private String sex;
    private String state;

    public User() {
    }

    public User(int id, String account, String password, String tel, String email, String sex, String state) {
        this.id = id;
        this.account = account;
        this.password = password;
        this.tel = tel;
        this.email = email;
        this.sex = sex;
        this.state = state;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}

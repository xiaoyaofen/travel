package com.yaofen.bean;

public class Admin {
    private int id;
    private String account;
    private String pwd;
    private String time;
    private int roleid;
    private String name;

    public Admin() {
    }

    public Admin(int id, String account, String pwd, String time, int roleid, String name) {
        this.id = id;
        this.account = account;
        this.pwd = pwd;
        this.time = time;
        this.roleid = roleid;
        this.name = name;
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

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getRoleid() {
        return roleid;
    }

    public void setRoleid(int roleid) {
        this.roleid = roleid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", pwd='" + pwd + '\'' +
                ", time='" + time + '\'' +
                ", roleid=" + roleid +
                ", name='" + name + '\'' +
                '}';
    }
}

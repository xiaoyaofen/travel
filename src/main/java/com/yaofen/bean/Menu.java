package com.yaofen.bean;

public class Menu {//菜单对象
    private int id;
    private String menuname;
    private String url;
    private String pid;
    private String roleid;


    public Menu() {
    }

    public Menu(int id, String menuname, String url, String pid, String roleid) {
        this.id = id;
        this.menuname = menuname;
        this.url = url;
        this.pid = pid;
        this.roleid = roleid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMenuname() {
        return menuname;
    }

    public void setMenuname(String menuname) {
        this.menuname = menuname;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getRoleid() {
        return roleid;
    }

    public void setRoleid(String roleid) {
        this.roleid = roleid;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", menuname='" + menuname + '\'' +
                ", url='" + url + '\'' +
                ", pid='" + pid + '\'' +
                ", roleid='" + roleid + '\'' +
                '}';
    }
}

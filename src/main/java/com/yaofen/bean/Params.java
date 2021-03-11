package com.yaofen.bean;

public class Params {
    private int id;
    private String value;
    private String type;
    private String name;

    public Params() {
    }

    public Params(int id, String value, String type, String name) {
        this.id = id;
        this.value = value;
        this.type = type;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

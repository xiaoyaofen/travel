package com.yaofen.bean;

public class SystemLog {
    private int id;
    private String time;
    private String worker;
    private String thing;
    private String name;

    public SystemLog() {
    }

    public SystemLog(int id, String time, String worker, String thing, String name) {
        this.id = id;
        this.time = time;
        this.worker = worker;
        this.thing = thing;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getWorker() {
        return worker;
    }

    public void setWorker(String worker) {
        this.worker = worker;
    }

    public String getThing() {
        return thing;
    }

    public void setThing(String thing) {
        this.thing = thing;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


}

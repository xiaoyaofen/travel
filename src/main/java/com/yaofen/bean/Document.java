package com.yaofen.bean;

public class Document {
    private int id;
    private String title;
    private String time;
    private String record;
    private String type;
    private String state;
    private String worker;
    private String count;
    private String url;
    private String name;

    public Document() {
    }

    public Document(int id, String title, String time, String record, String type,
                    String state, String worker, String count, String url, String name) {
        this.id = id;
        this.title = title;
        this.time = time;
        this.record = record;
        this.type = type;
        this.state = state;
        this.worker = worker;
        this.count = count;
        this.url = url;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getWorker() {
        return worker;
    }

    public void setWorker(String worker) {
        this.worker = worker;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

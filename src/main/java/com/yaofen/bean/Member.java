package com.yaofen.bean;

public class Member {
    private int id;
    private String level;
    private String upload;
    private String download;

    public Member() {
    }

    public Member(int id, String level, String upload, String download) {
        this.id = id;
        this.level = level;
        this.upload = upload;
        this.download = download;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getUpload() {
        return upload;
    }

    public void setUpload(String upload) {
        this.upload = upload;
    }

    public String getDownload() {
        return download;
    }

    public void setDownload(String download) {
        this.download = download;
    }
}

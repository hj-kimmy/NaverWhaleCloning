package com.model;

public class BoardDTO {
    private int num;
    private String id;
    private String name;
    private String subject;
    private String contents;
    private String regist_day;
    private String update_day;
    private int hit;
    private String ip;

    public BoardDTO() {
    }
    /*Getter*/
    public int getNum() {
        return num;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getSubject() {
        return subject;
    }

    public String getContents() {
        return contents;
    }

    public String getRegist_day() {
        return regist_day;
    }

    public String getUpdate_day() {
        return update_day;
    }

    public int getHit() {
        return hit;
    }

    public String getIp() {
        return ip;
    }
    /*Setter*/

    public void setNum(int num) {
        this.num = num;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public void setRegist_day(String regist_day) {
        this.regist_day = regist_day;
    }

    public void setUpdate_day(String update_day) {
        this.update_day = update_day;
    }

    public void setHit(int hit) {
        this.hit = hit;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }
}

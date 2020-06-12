package com.videoshare.po;

import java.sql.Date;

public class Video {

    private int id;
    private int user_id;
    private String vname;
    private String vnote;
    private String vimg;
    private String vsrc;
    private String vtype;
    private int collected;
    private int watched;
    private int iswatched;
    private Date createtime;

    private User_Item user_item;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getVname() {
        return vname;
    }

    public void setVname(String vname) {
        this.vname = vname;
    }

    public String getVnote() {
        return vnote;
    }

    public void setVnote(String vnote) {
        this.vnote = vnote;
    }

    public String getVimg() {
        return vimg;
    }

    public void setVimg(String vimg) {
        this.vimg = vimg;
    }

    public String getVsrc() {
        return vsrc;
    }

    public void setVsrc(String vsrc) {
        this.vsrc = vsrc;
    }

    public String getVtype() {
        return vtype;
    }

    public void setVtype(String vtype) {
        this.vtype = vtype;
    }

    public int getCollected() {
        return collected;
    }

    public void setCollected(int collected) {
        this.collected = collected;
    }

    public int getWatched() {
        return watched;
    }

    public void setWatched(int watched) {
        this.watched = watched;
    }

    public int getIswatched() {
        return iswatched;
    }

    public void setIswatched(int iswatched) {
        this.iswatched = iswatched;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public User_Item getUser_item() {
        return user_item;
    }

    public void setUser_item(User_Item user_item) {
        this.user_item = user_item;
    }

    @Override
    public String toString() {
        return "Video{" +
                "id=" + id +
                ", user_id=" + user_id +
                ", vname='" + vname + '\'' +
                ", vnote='" + vnote + '\'' +
                ", vimg='" + vimg + '\'' +
                ", vsrc='" + vsrc + '\'' +
                ", vtype='" + vtype + '\'' +
                ", collected=" + collected +
                ", watched=" + watched +
                ", iswatched=" + iswatched +
                ", createtime=" + createtime +
                ", user_item=" + user_item +
                '}';
    }
}

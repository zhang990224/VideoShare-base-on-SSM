package com.videoshare.po;

import java.sql.Date;

public class Feedback {
    private int id;
    private int uid;
    private String uname;
    private String content;
    private String contact;
    private Date createtime;
    private int iswatched;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public int getIswatched() {
        return iswatched;
    }

    public void setIswatched(int iswatched) {
        this.iswatched = iswatched;
    }

    @Override
    public String toString() {
        return "feedback{" +
                "id=" + id +
                ", uid=" + uid +
                ", uname='" + uname + '\'' +
                ", content='" + content + '\'' +
                ", contact='" + contact + '\'' +
                ", createtime=" + createtime +
                ", iswatched=" + iswatched +
                '}';
    }
}

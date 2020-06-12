package com.videoshare.po;

import java.sql.Date;

public class Advise {
    private int id;
    private int receiver_id;
    private String content;
    private int iswatched;
    private Date createtime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getReceiver_id() {
        return receiver_id;
    }

    public void setReceiver_id(int receiver_id) {
        this.receiver_id = receiver_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    @Override
    public String toString() {
        return "Advise{" +
                "id=" + id +
                ", receiver_id=" + receiver_id +
                ", content='" + content + '\'' +
                ", iswatched=" + iswatched +
                ", createtime=" + createtime +
                '}';
    }
}

package com.videoshare.po;

import java.sql.Date;

public class Message {
    private int id;
    private int send_id;
    private int receive_id;
    private String content;
    private int sendtype;
    private int receivetype;
    private int iswatched;
    private Date createtime;

    private User_Item user_item;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSend_id() {
        return send_id;
    }

    public void setSend_id(int send_id) {
        this.send_id = send_id;
    }

    public int getReceive_id() {
        return receive_id;
    }

    public void setReceive_id(int receive_id) {
        this.receive_id = receive_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getSendtype() {
        return sendtype;
    }

    public void setSendtype(int sendtype) {
        this.sendtype = sendtype;
    }

    public int getReceivetype() {
        return receivetype;
    }

    public void setReceivetype(int receivetype) {
        this.receivetype = receivetype;
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
        return "Message{" +
                "id=" + id +
                ", send_id=" + send_id +
                ", receive_id=" + receive_id +
                ", content='" + content + '\'' +
                ", sendtype=" + sendtype +
                ", receivetype=" + receivetype +
                ", iswatched=" + iswatched +
                ", createtime=" + createtime +
                ", user_item=" + user_item +
                '}';
    }
}

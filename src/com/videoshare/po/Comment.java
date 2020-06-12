package com.videoshare.po;

import java.sql.Date;

public class Comment {
    private int id;
    private int video_id;
    private int user_id;
    private String v_comment;
    private Date v_createtime;

    private User_Item user_item;
    private Video video;

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVideo_id() {
        return video_id;
    }

    public void setVideo_id(int video_id) {
        this.video_id = video_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getV_comment() {
        return v_comment;
    }

    public void setV_comment(String v_comment) {
        this.v_comment = v_comment;
    }

    public Date getV_createtime() {
        return v_createtime;
    }

    public void setV_createtime(Date v_createtime) {
        this.v_createtime = v_createtime;
    }

    public User_Item getUser_item() {
        return user_item;
    }

    public void setUser_item(User_Item user_item) {
        this.user_item = user_item;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", video_id=" + video_id +
                ", user_id=" + user_id +
                ", v_comment='" + v_comment + '\'' +
                ", v_createtime=" + v_createtime +
                ", user_item=" + user_item +
                ", video=" + video +
                '}';
    }
}

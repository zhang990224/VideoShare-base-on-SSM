package com.videoshare.po;

public class Relation {
    private int rid;
    private int userid;
    private int fansid;
    private User_Item user_item;
    private Video video;

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getFansid() {
        return fansid;
    }

    public void setFansid(int fansid) {
        this.fansid = fansid;
    }

    public User_Item getUser_item() {
        return user_item;
    }

    public void setUser_item(User_Item user_item) {
        this.user_item = user_item;
    }

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }

    @Override
    public String toString() {
        return "Relation{" +
                "rid=" + rid +
                ", userid=" + userid +
                ", fansid=" + fansid +
                ", user_item=" + user_item +
                ", video=" + video +
                '}';
    }
}

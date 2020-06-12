package com.videoshare.po;

import java.sql.Date;
import java.util.List;

public class User_Item {
    private int id;
    private int user_id;
    private String username;
    private String u_img;   //头像路径
    private Date birthday;
    private String introduce;
    private int fans;       //粉丝数
    private int concern;    //关注数
    private int v_num;      //视频数
    private int c_num;      //收藏数

    private List<Video> video;

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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getU_img() {
        return u_img;
    }

    public void setU_img(String u_img) {
        this.u_img = u_img;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public int getFans() {
        return fans;
    }

    public void setFans(int fans) {
        this.fans = fans;
    }

    public int getConcern() {
        return concern;
    }

    public void setConcern(int concern) {
        this.concern = concern;
    }

    public int getV_num() {
        return v_num;
    }

    public void setV_num(int v_num) {
        this.v_num = v_num;
    }

    public int getC_num() {
        return c_num;
    }

    public void setC_num(int c_num) {
        this.c_num = c_num;
    }

    public List<Video> getVideo() {
        return video;
    }

    public void setVideo(List<Video> video) {
        this.video = video;
    }

    @Override
    public String toString() {
        return "User_Item{" +
                "id=" + id +
                ", user_id=" + user_id +
                ", username='" + username + '\'' +
                ", u_img='" + u_img + '\'' +
                ", birthday=" + birthday +
                ", introduce='" + introduce + '\'' +
                ", fans=" + fans +
                ", concern=" + concern +
                ", v_num=" + v_num +
                ", c_num=" + c_num +
                ", video=" + video +
                '}';
    }
}

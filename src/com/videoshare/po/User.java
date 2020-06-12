package com.videoshare.po;

import java.util.List;

public class User {
    private int id;
    private String email;
    private String username;
    private String password;

    private User_Item userItem;
    private List<Video> video;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public User_Item getUserItem() {
        return userItem;
    }

    public void setUserItem(User_Item userItem) {
        this.userItem = userItem;
    }

    public List<Video> getVideo() {
        return video;
    }

    public void setVideo(List<Video> video) {
        this.video = video;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", video=" + video +
                '}';
    }
}

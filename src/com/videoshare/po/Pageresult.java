package com.videoshare.po;

import java.util.List;

public class Pageresult<T> {
    private List<T> list;//集合
    private int user_id;
    private String username;
    private String vname;
    private int iswatched;
    private long totalCount;//总记录数
    private int totalPage;//总页数
    private int currentPage;//当前页
    private int pageCount;//每页显示的条数
    private int start;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getVname() {
        return vname;
    }

    public void setVname(String vname) {
        this.vname = vname;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(long totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getIswatched() {
        return iswatched;
    }

    public void setIswatched(int iswatched) {
        this.iswatched = iswatched;
    }

    @Override
    public String toString() {
        return "Pageresult{" +
                "list=" + list +
                ", user_id=" + user_id +
                ", username='" + username + '\'' +
                ", vname='" + vname + '\'' +
                ", iswatched=" + iswatched +
                ", totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", currentPage=" + currentPage +
                ", pageCount=" + pageCount +
                ", start=" + start +
                '}';
    }
}

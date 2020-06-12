package com.videoshare.service.Impl;

import com.videoshare.dao.VideoMapper;
import com.videoshare.po.*;
import com.videoshare.service.VideoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class VideoServiceImpl implements VideoService {

    @Resource
    private VideoMapper videoMapper;

    @Override
    public void insertVideo(Video video) {
        videoMapper.insertVideo(video);
    }

    @Override
    public Pageresult<Video> DisAllVideoById(int user_id,int page) {
        //创建模型
        Pageresult<Video> pr = new Pageresult<>();
        //设置总数量
        int totalCount = videoMapper.CountVideoByUid(user_id);
        pr.setTotalCount(totalCount);
        //设置页总数
        int totalPage = (int)Math.ceil(totalCount * 1.0 / 8);
        pr.setTotalPage(totalPage);
        //设置当前页
        pr.setCurrentPage(page);
        pr.setUser_id(user_id);
        int start = (page-1)*8;
        pr.setStart(start);
        List<Video> videoList = videoMapper.DisAllVideoById(pr);
        pr.setList(videoList);
        return pr;
    }
    @Override
    public Video DisVideoById(int id){
       Video video = videoMapper.DisVideoById(id);
        return video;
    }

    @Override
    public void UpdateVwatchById(Video video) {
        videoMapper.UpdateVwatchById(video);
    }

    @Override
    public int CountVideoByUid(int user_id) {
        int count = videoMapper.CountVideoByUid(user_id);
        return count;
    }

    @Override
    public void UpdateUserVnumById(User_Item user_item) {
        videoMapper.UpdateUserVnumById(user_item);
    }

    @Override
    public List<Video> DisRecentVideoByUid(int user_id) {
        List<Video> videoList = videoMapper.DisRecentVideoByUid(user_id);
        return videoList;
    }

    @Override
    public List<Video> DisVideoByWatched() {
        List<Video> videoList = videoMapper.DisVideoByWatched();
        return videoList;
    }

    @Override
    public void DeleteVideoById(int id) {
        videoMapper.DeleteVideoById(id);
    }

    @Override
    public int IsCollected(Collect collect) {
        int count = videoMapper.IsCollected(collect);
        return count;
    }

    @Override
    public void CollectVideo(Collect collect) {
        videoMapper.CollectVideo(collect);
    }

    @Override
    public void CanelCollectVideo(Collect collect) {
        videoMapper.CanelCollectVideo(collect);
    }

    @Override
    public void UpdateUserCnumById(User_Item user_item) {
        videoMapper.UpdateUserCnumById(user_item);
    }

    @Override
    public int CountUserCnumById(int user_id) {
        int c = videoMapper.CountUserCnumById(user_id);
        return c;
    }

    @Override
    public void UpdateVcollectedById(Video video) {
        videoMapper.UpdateVcollectedById(video);
    }

    @Override
    public int CountVcollectedById(int id) {
        int c = videoMapper.CountVcollectedById(id);
        return c;
    }

    @Override
    public Video DisPopularVideoByUid(int user_id) {
        Video video = videoMapper.DisPopularVideoByUid(user_id);
        return video;
    }

    @Override
    public List<Collect> DisCollectVideo(int collector_id) {
        List<Collect> collects =  videoMapper.DisCollectVideo(collector_id);
        return collects;
    }

    @Override
    public List<Video> FindVideoByName(String vname) {
        List<Video> videoList = videoMapper.FindVideoByName(vname);
        return videoList;
    }

    @Override
    public int CountVideoByName(String vname) {
        int count = videoMapper.CountVideoByName(vname);
        return count;
    }

    @Override
    public int CountVideoByNameP(String vname) {
        int c = videoMapper.CountVideoByNameP(vname);
        return c;
    }

    @Override
    public Pageresult<Video> FindVideoByNameP(String vname, int page) {
        //创建模型
        Pageresult<Video> pr = new Pageresult<>();
        //设置总数量
        int totalCount = videoMapper.CountVideoByName(vname);
        pr.setTotalCount(totalCount);
        //设置页总数
        int totalPage = (int)Math.ceil(totalCount * 1.0 / 5);
        pr.setTotalPage(totalPage);
        //设置当前页
        pr.setCurrentPage(page);
        int start = (page-1)*5;
        pr.setStart(start);
        Pageresult p = new Pageresult();
        p.setVname(vname);
        p.setStart(start);
        List<Video> videos = videoMapper.FindVideoByNameP(p);
        pr.setList(videos);
        return pr;
    }

    @Override
    public List<User_Item> FindUserByName(String username) {
        List<User_Item> user_items = videoMapper.FindUserByName(username);
        return user_items;
    }

    @Override
    public int CountUserByName(String username) {
        int count = videoMapper.CountUserByName(username);
        return count;
    }

    @Override
    public Pageresult<User_Item> FindUserByNameP(String username, int page) {
        //创建模型
        Pageresult<User_Item> pr = new Pageresult<>();
        //设置总数量
        int totalCount = videoMapper.CountUserByName(username);
        pr.setTotalCount(totalCount);
        //设置页总数
        int totalPage = (int)Math.ceil(totalCount * 1.0 / 5);
        pr.setTotalPage(totalPage);
        //设置当前页
        pr.setCurrentPage(page);
        int start = (page-1)*5;
        pr.setStart(start);
        Pageresult p = new Pageresult();
        p.setUsername(username);
        p.setStart(start);
        List<User_Item> user_items = videoMapper.FindUserByNameP(p);
        pr.setList(user_items);
        return pr;
    }

    @Override
    public void AddComment(Comment comment) {
        videoMapper.AddComment(comment);
    }

    @Override
    public List<Comment> DisCommentById(int video_id) {
        List<Comment> comments = videoMapper.DisCommentById(video_id);
        return comments;
    }

    @Override
    public int CountCommentById(int video_id) {
        int count = videoMapper.CountCommentById(video_id);
        return count;
    }

    @Override
    public Pageresult<Comment> DisComment(int page) {
        //创建模型
        Pageresult<Comment> pr = new Pageresult<>();
        //设置总数量
        int totalCount = videoMapper.CountComment();
        pr.setTotalCount(totalCount);
        //设置页总数
        int totalPage = (int)Math.ceil(totalCount * 1.0 / 5);
        pr.setTotalPage(totalPage);
        //设置当前页
        pr.setCurrentPage(page);
        int start = (page-1)*5;
        pr.setStart(start);
        List<Comment> comments = videoMapper.DisComment(start);
        pr.setList(comments);
        return pr;
    }

    @Override
    public int CountComment() {
        int c = videoMapper.CountComment();
        return c;
    }

    @Override
    public Pageresult<Comment> DisCommentF(String username, int page) {
        //创建模型
        Pageresult<Comment> pr = new Pageresult<>();
        //设置总数量
        Pageresult p = new Pageresult();
        p.setUsername(username);
        int totalCount = videoMapper.CountCommentF(p);
        pr.setTotalCount(totalCount);
        //设置页总数
        int totalPage = (int)Math.ceil(totalCount * 1.0 / 5);
        pr.setTotalPage(totalPage);
        //设置当前页
        pr.setCurrentPage(page);
        int start = (page-1)*5;
        pr.setStart(start);
        p.setStart(start);
        List<Comment> comments = videoMapper.DisCommentF(p);
        pr.setList(comments);
        return pr;
    }

    @Override
    public int CountCommentF(String username) {
        Pageresult p = new Pageresult();
        p.setUsername(username);
        int c = videoMapper.CountCommentF(p);
        return c;
    }

    @Override
    public void DeleteCommentById(Comment comment) {
        videoMapper.DeleteCommentById(comment);
    }

    @Override
    public Pageresult<Video> DisAllVideo(int page) {
        //创建模型
        Pageresult<Video> pr = new Pageresult<>();
        //设置总数量
        int totalCount = videoMapper.CountVideo();
        pr.setTotalCount(totalCount);
        //设置页总数
        int totalPage = (int)Math.ceil(totalCount * 1.0 / 5);
        pr.setTotalPage(totalPage);
        //设置当前页
        pr.setCurrentPage(page);
        int start = (page-1)*5;
        pr.setStart(start);
        List<Video> videoList = videoMapper.DisAllVideo(start);
        pr.setList(videoList);

        return pr;
    }

    @Override
    public int CountVideo() {
        int c = videoMapper.CountVideo();
        return c;
    }

    @Override
    public List<Video> DisVideoNoWatched(int user_id) {
        List<Video> videoList = videoMapper.DisVideoNoWatched(user_id);
        return videoList;
    }

    @Override
    public void UpdateIsWatchedById(Video video) {
        videoMapper.UpdateIsWatchedById(video);
    }


}

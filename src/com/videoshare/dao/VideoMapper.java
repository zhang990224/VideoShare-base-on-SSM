package com.videoshare.dao;

import com.videoshare.po.*;

import java.util.List;

public interface VideoMapper {
    //上传视频
    void insertVideo(Video user);
    //显示全部视频
    List<Video> DisAllVideoById(Pageresult pageresult);
    //显示某个视频
    Video DisVideoById(int id);
    //更新观看量
    void UpdateVwatchById(Video video);
    //计算某个用户的视频数量
    int CountVideoByUid(int user_id);
    //更新视频数量
    void UpdateUserVnumById(User_Item user_item);
    //查询最近发布的五个视频
    List<Video> DisRecentVideoByUid(int user_id);
    //查询观看量前六的视频（主页显示）
    List<Video> DisVideoByWatched();
    //管理端删除视频记录
    void DeleteVideoById(int id);
    //是否收藏
    int IsCollected(Collect collect);
    //收藏视频
    void CollectVideo(Collect collect);
    //取消收藏视频
    void CanelCollectVideo(Collect collect);
    //更新视频收藏数
    void UpdateUserCnumById(User_Item user_item);
    int CountUserCnumById(int collector_id);
    //更新视频被收藏数
    void UpdateVcollectedById(Video video);
    int CountVcollectedById(int video_id);
    //显示收藏的视频
    List<Collect> DisCollectVideo(int collector_id);
    //置顶热门视频
    Video DisPopularVideoByUid(int user_id);
    //模糊查询
    List<Video> FindVideoByName(String vname);
    int CountVideoByName(String vname);
    int CountVideoByNameP(String vname);
    List<Video> FindVideoByNameP(Pageresult pageresult);
    List<User_Item> FindUserByName(String username);
    int CountUserByName(String username);
    List<User_Item> FindUserByNameP(Pageresult pageresult);
    //进行评论
    void AddComment(Comment comment);
    //显示评论
    List<Comment> DisCommentById(int video_id);
    int CountCommentById(int video_id);
    //显示全部评论
    List<Comment> DisComment(int start);
    int CountComment();
    //显示某用户评论
    List<Comment> DisCommentF(Pageresult pageresult);
    int CountCommentF(Pageresult pageresult);
    //删除评论
    void DeleteCommentById(Comment comment);

    List<Video> DisAllVideo(int page);

    int CountVideo();
    //审核中的视频
    List<Video> DisVideoNoWatched(int user_id);
    //修改视频状态
    void UpdateIsWatchedById(Video video);
}

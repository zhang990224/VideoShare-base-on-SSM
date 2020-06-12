package com.videoshare.service;

import com.videoshare.po.Relation;

import java.util.List;

public interface RelationService {
    //查看两个人是否为关注与被关注关系
    int isFans(Relation relation);

    //取消关注
    void deleteRelationById(Relation relation);

    //点击关注
    void insertRelationById(Relation relation);

    //显示关注人
    List<Relation> findRelationUserById(int fans_id);
    //显示四位关注人
    List<Relation> fourRelationUserById(int fans_id);
    //显示关注人的推送视频
    List<Relation> DisConcernVideo(int fans_id);

    //显示粉丝
    List<Relation> findRelationUserFById(int user_id);
}

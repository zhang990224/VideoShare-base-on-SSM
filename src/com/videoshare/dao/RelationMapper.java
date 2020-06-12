package com.videoshare.dao;

import com.videoshare.po.Relation;

import java.util.List;

public interface RelationMapper {

    int isFans(Relation relation);

    void deleteRelationById(Relation relation);

    void insertRelationById(Relation relation);

    List<Relation> findRelationUserById(int fansid);

    List<Relation> fourRelationUserById(int fansid);

    List<Relation> DisConcernVideo(int fansid);
    //显示粉丝
    List<Relation> findRelationUserFById(int userid);
}

package com.videoshare.service.Impl;

import com.videoshare.dao.RelationMapper;
import com.videoshare.po.Relation;
import com.videoshare.service.RelationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RelationServiceImpl implements RelationService {

    @Resource
    private RelationMapper relationMapper;

    @Override
    public int isFans(Relation relation) {
        int count = relationMapper.isFans(relation);

        return count;
    }

    @Override
    public void deleteRelationById(Relation relation) {
        relationMapper.deleteRelationById(relation);
    }

    @Override
    public void insertRelationById(Relation relation) {
        relationMapper.insertRelationById(relation);
    }

    @Override
    public List<Relation> findRelationUserById(int fans_id) {
        List<Relation> relations = relationMapper.findRelationUserById(fans_id);
        return relations;
    }

    @Override
    public List<Relation> fourRelationUserById(int fans_id) {
        List<Relation> relations = relationMapper.fourRelationUserById(fans_id);
        return relations;
    }

    @Override
    public List<Relation> DisConcernVideo(int fans_id) {
        List<Relation> relations = relationMapper.DisConcernVideo(fans_id);
        return relations;
    }

    @Override
    public List<Relation> findRelationUserFById(int user_id) {
        List<Relation> relations = relationMapper.findRelationUserFById(user_id);
        return relations;
    }
}

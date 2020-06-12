package com.videoshare.service.Impl;

import com.videoshare.dao.UserMapper;
import com.videoshare.po.*;
import com.videoshare.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public User findUserById(int id) {
        User user = userMapper.findUserById(id);
        return user;
    }

    @Override
    public int findUser(User user) {
        int c = userMapper.findUser(user);
        return c;
    }

    @Override
    public int findUserId(String email) {
        int id = userMapper.findUserId(email);
        return id;
    }

    @Override
    public void insertUser(User user) {
       userMapper.insertUser(user);
    }

    @Override
    public void insertUserItem(User_Item user_item) {
        userMapper.insertUserItem(user_item);
    }

    @Override
    public int findUserLogin(User user) {
        int c = userMapper.findUserLogin(user);
        return c;
    }

    @Override
    public void updatePswById(User user) {
        userMapper.updatePswById(user);
    }

    @Override
    public int findUserEmail(String email) {
        int c = userMapper.findUserEmail(email);
        return c;
    }

    @Override
    public int findUserMaxId() {
        int maxId = userMapper.findUserMaxId();
        return maxId;
    }

    @Override
    public User findUserItem(String email) {
        User user = userMapper.findUserItem(email);
        return user;
    }

    @Override
    public User_Item findUserAllItem(int id) {
        User_Item user_item = userMapper.findUserAllItem(id);
        return user_item;
    }

    @Override
    public void updateUserFansById(User_Item user_item) {
        userMapper.updateUserFansById(user_item);
    }

    @Override
    public void updateUserConcernById(User_Item user_item) {
        userMapper.updateUserConcernById(user_item);
    }

    @Override
    public void updateIntroduceById(User_Item user_item) {
        userMapper.updateIntroduceById(user_item);
    }

    @Override
    public List<User_Item> disUserExpectMe(int user_id) {
        List<User_Item> user_items = userMapper.disUserExpectMe(user_id);
        return user_items;
    }

    @Override
    public void updateHeadById(User_Item user_item) {
        userMapper.updateHeadById(user_item);
    }

    @Override
    public Pageresult<User_Item> disAllUser(int page) {
        Pageresult<User_Item> pr = new Pageresult<>();
        int totalCount = userMapper.CountAllUser();
        pr.setTotalCount(totalCount);
        int start = (page-1)*5;
        List<User_Item> user_items = userMapper.disAllUser(start);
        pr.setList(user_items);
        pr.setStart(start);
        pr.setCurrentPage(page);
        int totalPage = (int)Math.ceil(totalCount * 1.0 / 5);
        pr.setTotalPage(totalPage);
        return pr;
    }

    @Override
    public int CountAllUser() {
        int c = userMapper.CountAllUser();
        return c;
    }

    @Override
    public int findAdminLogin(Admin admin) {
        int count = userMapper.findAdminLogin(admin);
        return count;
    }

    @Override
    public void insertMessage(Message message) {
        userMapper.insertMessage(message);
    }

    @Override
    public List<Message> DisMessageById(Message message) {
        List<Message> messages = userMapper.DisMessageById(message);
        return messages;
    }

    @Override
    public int CountMessageById(Message message) {
        int count = userMapper.CountMessageById(message);
        return count;
    }

    @Override
    public void updateMsgById(Message message) {
        userMapper.updateMsgById(message);
    }

    @Override
    public void deleteMsgById(int receive_id) {
        userMapper.deleteMsgById(receive_id);
    }

    @Override
    public void insertAdvise(Advise advise) {
        userMapper.insertAdvise(advise);
    }

    @Override
    public List<Advise> DisAdviseById(int receiver_id) {
        List<Advise> advises = userMapper.DisAdviseById(receiver_id);
        return advises;
    }

    @Override
    public int CountAdviseById(Advise advise) {
        int count = userMapper.CountAdviseById(advise);
        return count;
    }

    @Override
    public void updateAdviseById(Advise advise) {
        userMapper.updateAdviseById(advise);
    }

    @Override
    public void deleteAdviseById(int receiver_id) {
        userMapper.deleteAdviseById(receiver_id);
    }

    @Override
    public void insertFeedBack(Feedback feedback) {
        userMapper.insertFeedBack(feedback);
    }

    @Override
    public Pageresult<Feedback> DisFeedBack(int page) {
        Pageresult<Feedback> pr = new Pageresult<>();
        int totalCount = userMapper.CountFeedBack();
        pr.setTotalCount(totalCount);
        int start = (page-1)*5;
        List<Feedback> feedbacks = userMapper.DisFeedBack(start);
        pr.setList(feedbacks);
        pr.setStart(start);
        pr.setCurrentPage(page);
        int totalPage = (int)Math.ceil(totalCount * 1.0 / 5);
        pr.setTotalPage(totalPage);
        return pr;
    }

    @Override
    public Pageresult<Feedback> DisFeedBackWatched(int iswatched, int page) {
        Pageresult<Feedback> pr = new Pageresult<>();
        int totalCount = userMapper.CountFeedBackWatched(iswatched);
        pr.setTotalCount(totalCount);
        int start = (page-1)*5;
        Pageresult p = new Pageresult();
        p.setIswatched(iswatched);
        p.setStart(start);
        List<Feedback> feedbacks = userMapper.DisFeedBackWatched(p);
        pr.setList(feedbacks);
        pr.setStart(start);
        pr.setCurrentPage(page);
        int totalPage = (int)Math.ceil(totalCount * 1.0 / 5);
        pr.setTotalPage(totalPage);
        return pr;
    }

    @Override
    public Feedback DisFeedBackById(int id) {
        Feedback feedback = userMapper.DisFeedBackById(id);
        return feedback;
    }

    @Override
    public void deleteFeedBackById(int id) {
        userMapper.deleteFeedBackById(id);
    }

    @Override
    public int CountFeedBack() {
        int c = userMapper.CountFeedBack();
        return c;
    }

    @Override
    public int CountFeedBackWatched(int iswatched) {
        int c = userMapper.CountFeedBackWatched(iswatched);
        return c;
    }

    @Override
    public void updateFeedBackById(Feedback feedback) {
        userMapper.updateFeedBackById(feedback);
    }
}

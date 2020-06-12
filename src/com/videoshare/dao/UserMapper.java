package com.videoshare.dao;

import com.videoshare.po.*;

import java.util.List;

public interface UserMapper {
    //通过id查找用户信息
    User findUserById(int id);

    //查找用户
    int findUser(User user);

    //查找用户ID
    int findUserId(String email);

    //登陆验证
    int findUserLogin(User user);

    //验证是否存在邮箱
    int findUserEmail(String email);

    //新增用户
    void insertUser(User user);
    //新增用户详情
    void insertUserItem(User_Item user_item);

    //查询某用户注册信息
    User findUserItem(String email);

    //查询某用户详细信息
    User_Item findUserAllItem(int id);

    //通过id更新password
    void updatePswById(User user);

    //通过id删除指定用户
    void deleteUserById(Integer id);

    //查找用户最大id
    int findUserMaxId();

    void updateUserFansById(User_Item user_item);

    void updateUserConcernById(User_Item user_item);

    void updateIntroduceById(User_Item user_item);

    List<User_Item> disUserExpectMe(int user_id);

    void updateHeadById(User_Item user_item);

    List<User_Item> disAllUser(int start);

    int CountAllUser();

    //管理端
    int findAdminLogin(Admin admin);

    //添加信息
    void insertMessage(Message message);
    //显示信息
    List<Message> DisMessageById(Message message);
    //计算未读信息个数
    int CountMessageById(Message message);
    //更新信息状态
    void updateMsgById(Message message);
    //删除信息
    void deleteMsgById(int receive_id);

    //添加通知
    void insertAdvise(Advise advise);
    //显示通知
    List<Advise> DisAdviseById(int receiver_id);
    //计算未读通知个数
    int CountAdviseById(Advise advise);
    //更新通知状态
    void updateAdviseById(Advise advise);
    //删除通知
    void deleteAdviseById(int receiver_id);

    //反馈信息
    void insertFeedBack(Feedback feedback);

    List<Feedback> DisFeedBack(int start);

    List<Feedback> DisFeedBackWatched(Pageresult pageresult);

    Feedback DisFeedBackById(int id);

    void deleteFeedBackById(int id);

    int CountFeedBack();

    int CountFeedBackWatched(int iswatched);

    void updateFeedBackById(Feedback feedback);
}


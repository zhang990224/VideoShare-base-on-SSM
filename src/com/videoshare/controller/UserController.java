package com.videoshare.controller;

import com.videoshare.po.*;
import com.videoshare.service.RelationService;
import com.videoshare.service.UserService;
import com.videoshare.service.VideoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;
    @Resource
    private VideoService videoService;
    @Resource
    private RelationService relationService;

    //注册时验证email是否可用
    @RequestMapping("findEmail")
    public void findEmail(String email, HttpServletResponse response) throws IOException {
        int count = userService.findUserEmail(email.trim());
        if(email.trim().matches("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*"))
        {
            if (count>0 || email==""){
                response.getWriter().write("不可用");
            }else{
                response.getWriter().write("可用");
            }
        }else{
            response.getWriter().write("格式不正确");
        }
    }

    @RequestMapping("findUser")
    public void findUser(String username,String email, HttpServletResponse response) throws IOException {
        User user = new User();
        user.setUsername(username.trim());
        user.setEmail(email.trim());
        int count = userService.findUser(user);
        if (count>0){
            response.getWriter().write("1");
        }else{
            response.getWriter().write("0");
        }
    }

    //注册
    @RequestMapping("register")
    public String register(String email,String username,String password) {
        User user = new User();
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password);

        userService.insertUser(user);
        int ran = (int)(2+Math.random()*6);
        String uimg = "assets/images/avatars/avatar-"+ran+".jpg";
        int maxId = userService.findUserMaxId();
        User_Item user_item = new User_Item();
        user_item.setUsername(username);
        user_item.setUser_id(maxId);
        user_item.setU_img(uimg);
        user_item.setFans(0);
        user_item.setConcern(0);
        user_item.setIntroduce("该用户很懒，没有留下介绍");
        user_item.setC_num(0);
        user_item.setV_num(0);
        userService.insertUserItem(user_item);

        return "login";
    }

    @RequestMapping("onloadsession")
    public void OnloadSession(HttpServletRequest request, HttpServletResponse response, int user_id) throws IOException{
        User_Item user1_item = userService.findUserAllItem(user_id);
        List<Relation> relations = relationService.fourRelationUserById(user_id);
        Message message = new Message();
        message.setSendtype(1);
        message.setReceivetype(1);
        message.setReceive_id(user_id);
        Advise advise = new Advise();
        advise.setReceiver_id(user_id);
        advise.setIswatched(0);
        List<Message> messages = userService.DisMessageById(message);
        List<Advise> advises = userService.DisAdviseById(user_id);
        List<Video> videoList = videoService.DisVideoNoWatched(user_id);
        int msgcount = userService.CountMessageById(message);
        int adcount = userService.CountAdviseById(advise);
        HttpSession session = request.getSession(true);
        session.setAttribute("nowatch",videoList);
        session.setAttribute("messages",messages);
        session.setAttribute("msgcount",msgcount);
        session.setAttribute("advises",advises);
        session.setAttribute("adcount",adcount);
        session.setAttribute("fourrelation",relations);
        session.setAttribute("user1_item",user1_item);

        response.getWriter().write("onload");
    }

    //登陆
    @RequestMapping("login")
    public String Login(Model model, HttpServletRequest request , String email, String password) {
        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        System.out.println(user);
        int count = userService.findUserLogin(user);
        if (count==1){
            User user1 = userService.findUserItem(email);
            User_Item user1_item = userService.findUserAllItem(user1.getId());
            HttpSession session = request.getSession(true);
            session.setAttribute("user1",user1);
            session.setAttribute("user1_item",user1_item);
            return "redirect:/video/index.do";
        }else{
            model.addAttribute("result","false");
            return "result";
        }
    }

    @RequestMapping("signout")
    public String SignOut(HttpServletRequest request){
        request.getSession().removeAttribute("user1");
        request.getSession().removeAttribute("user1_item");
        return "login";
    }

    @RequestMapping("urelation")
    public void URelation(HttpServletRequest request,HttpServletResponse response,int fans_id) throws IOException{
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            Relation relation = new Relation();
            relation.setUserid(user.getId());
            relation.setFansid(fans_id);
            int count = relationService.isFans(relation);
            if(count > 0){
                response.getWriter().write(1);
            }else{
                response.getWriter().write(0);
            }
        }else{
            response.getWriter().write(2);
        }
    }

    @RequestMapping("updateIntroduce")
    public void UpdateIntroduce(HttpServletResponse response,String introduce,HttpServletRequest request) throws IOException{
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            if (introduce.equals("")){
                introduce = "该用户很懒，没有留下介绍";
            }
            User_Item user_item = new User_Item();
            user_item.setUser_id(user.getId());
            user_item.setIntroduce(introduce);

            userService.updateIntroduceById(user_item);
            HttpSession session = request.getSession(true);
            User_Item user1_item = userService.findUserAllItem(user.getId());
            session.setAttribute("user1_item",user1_item);

            response.getWriter().write("修改成功");
        }else{
            response.getWriter().write("修改失败");
        }

    }

    @RequestMapping("disUserExpectMe")
    public String DisUserExpectMe(HttpServletRequest request,Model model,int user_id){
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            List<User_Item> user_items = userService.disUserExpectMe(user_id);
            model.addAttribute("user_all",user_items);
            return "user_all";
        }else{
            return "404";
        }
    }

    @RequestMapping("disRelationUserById")
    public String DisRelationUserById(HttpServletRequest request,Model model,int user_id){
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            List<Relation> relations = relationService.findRelationUserById(user_id);
            model.addAttribute("relationUser",relations);
            return "user_concern";
        }else{
            return "404";
        }
    }

    @RequestMapping("disRelationUserFById")
    public String DisRelationUserFById(HttpServletRequest request,Model model,int user_id){
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            List<Relation> relations = relationService.findRelationUserFById(user_id);
            model.addAttribute("relationUserF",relations);
            return "user_fans";
        }else{
            return "404";
        }
    }

    @RequestMapping("returnHead")
    public void ReturnHead(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) throws IOException {
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            final String[] IMAGE_TYPE = new String[] { ".bmp", ".jpg", ".jpeg", ".png" };
            String path = request.getSession().getServletContext().getRealPath("/upload/");
            //判断该路径是否存在
            File file = new File(path);
            if (!file.exists()) {
                //如果这个文件夹不存在的话,就创建这个文件
                file.mkdirs();
            }
            //获取上传文件名称
            String filename = upload.getOriginalFilename();
            System.out.println(filename);
            //把文件名称设置成唯一值 uuid 以防止文件名相同覆盖
            String uuid = UUID.randomUUID().toString().replace("-", "");
            //新文件名
            filename = uuid + "_" + filename;
            System.out.println(filename);
            //完成文件上传
            upload.transferTo(new File(path, filename));
            String NewFilePath = "upload/" + filename;
            for (String type : IMAGE_TYPE) {
                if (StringUtils.endsWithIgnoreCase(upload.getOriginalFilename(), type)) {
                    response.getWriter().write(NewFilePath);
                    System.out.println(NewFilePath);
                }
            }
        }
    }

    @RequestMapping("updateHead")
    public void UpdateHead(HttpServletRequest request,HttpServletResponse response,String head) throws IOException{
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            if (!head.equals("")) {
                User_Item user_item = new User_Item();
                user_item.setUser_id(user.getId());
                user_item.setU_img(head);
                userService.updateHeadById(user_item);
                response.getWriter().write("保存成功");
            }else{
                response.getWriter().write("保存失败");
            }
        }
    }

    @RequestMapping("disAllUser")
    public String DisAllUser(HttpServletRequest request,Model model,int page){
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin!=null){
            Pageresult<User_Item> user_items = userService.disAllUser(page);
            int count = userService.CountAllUser();
            model.addAttribute("alluser",user_items);
            model.addAttribute("usernum",count);
            return "admin_user";
        }else{
            return "404";
        }
    }

    @RequestMapping("returnUserById")
    public void ReturnUserById(HttpServletRequest request,HttpServletResponse response,int user_id) throws IOException{
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin!=null){
            User user = userService.findUserById(user_id);
            response.getWriter().write(user.getUsername()+","+user.getEmail()+","+user.getPassword());
        }else{
            response.getWriter().write(""+","+""+","+"");
        }
        //response.getWriter().write("{\"username\":\""+user.getUsername()+"\",\"email\":\""+user.getEmail()+"\",\"password\":\""+user.getPassword()+"}");
    }


    @RequestMapping("adminLogin")
    public String AdminLogin(Model model,HttpServletRequest request ,String username,String password){
        Admin admin = new Admin();
        admin.setAdminname(username.trim());
        admin.setPassword(password.trim());
        int count = userService.findAdminLogin(admin);
        if (count==1){
            HttpSession session = request.getSession(true);
            session.setAttribute("admin",admin);
            return "admin_index";
        }else{
            model.addAttribute("result","false");
            return "result";
        }
    }

    @RequestMapping("sendMessage")
    public void SendMessage(HttpServletRequest request ,HttpServletResponse response,int send_id,int receive_id,String content,int sendtype,int receivetype) throws IOException {
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            Message message = new Message();
            message.setSend_id(send_id);
            message.setReceive_id(receive_id);
            message.setContent(content.trim());
            message.setSendtype(sendtype);
            message.setReceivetype(receivetype);
            message.setIswatched(0);

            userService.insertMessage(message);
            response.getWriter().write("发送成功！");
        }else {
            response.getWriter().write("发送失败！");
        }

    }

    @RequestMapping("updateMsgById")
    public void UpdateMsgById(HttpServletRequest request,HttpServletResponse response,int receivetype) throws IOException {
        Message message = new Message();
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            message.setReceive_id(user.getId());
            message.setReceivetype(receivetype);
            message.setIswatched(1);
            userService.updateMsgById(message);
            List<Message> messages = userService.DisMessageById(message);
            int msgcount = userService.CountMessageById(message);
            HttpSession session = request.getSession(true);
            session.setAttribute("messages",messages);
            session.setAttribute("msgcount",msgcount);
            response.getWriter().write("全已读");
        }else{
            response.getWriter().write("操作无效");
        }
    }

    @RequestMapping("deleteMsgById")
    public void DeleteMsgById(HttpServletRequest request,HttpServletResponse response,int receiver_id) throws IOException {
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            userService.deleteMsgById(receiver_id);
            response.getWriter().write("已清空");
        }else{
            response.getWriter().write("操作无效");
        }
    }

    @RequestMapping("updateAdById")
    public void UpdateAdById(HttpServletRequest request,HttpServletResponse response,int iswatched) throws IOException {
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            Advise advise = new Advise();
            advise.setReceiver_id(user.getId());
            advise.setIswatched(iswatched);
            userService.updateAdviseById(advise);
            HttpSession session = request.getSession(true);
            List<Advise> advises = userService.DisAdviseById(user.getId());
            int adcount = userService.CountAdviseById(advise);
            session.setAttribute("advises",advises);
            session.setAttribute("adcount",adcount);
            response.getWriter().write("全已读");
        }else{
            response.getWriter().write("操作无效");
        }
    }

    @RequestMapping("deleteAdById")
    public void DeleteAdById(HttpServletRequest request,HttpServletResponse response,int receiver_id) throws IOException {
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            userService.deleteAdviseById(receiver_id);
            response.getWriter().write("已清空");
        }else{
            response.getWriter().write("操作无效");
        }
    }

    @RequestMapping("sendAdvise")
    public void SendAdvise(HttpServletRequest request,HttpServletResponse response,int user_id,String advise) throws IOException {
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin!=null){
            Advise advise1 = new Advise();
            advise1.setReceiver_id(user_id);
            advise1.setContent("【官方】 "+advise.trim());
            advise1.setIswatched(0);
            userService.insertAdvise(advise1);
            response.getWriter().write("发送成功");
        }else{
            response.getWriter().write("发送失败");
        }
    }

    @RequestMapping("searchUserAdmin")
    public String SearchUserAdmin(HttpServletRequest request,Model model,String username,int page){
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin!=null){
            Pageresult<User_Item> user_items = videoService.FindUserByNameP(username.trim(),page);
            int count = videoService.CountUserByName(username.trim());
            model.addAttribute("usernum",count);
            model.addAttribute("alluser",user_items);
            return "admin_user";
        }else{
            return "404";
        }
    }

    @RequestMapping("updatePsw")
    public void UpdatePsw(HttpServletRequest request,HttpServletResponse response,String oldp,String newp) throws IOException {
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            if (user.getPassword().trim().equals(oldp.trim())){
                User u = new User();
                u.setId(user.getId());
                u.setPassword(newp.trim());
                userService.updatePswById(u);
                response.getWriter().write("修改成功");
            }else{
                response.getWriter().write("旧密码错误");
            }
        }else{
            response.getWriter().write("没有登录！！！");
        }
    }

    @RequestMapping("updatePswZ")
    public void UpdatePswZ(HttpServletResponse response,String psw,String email) throws IOException {
          int id = userService.findUserId(email.trim());
          User u = new User();
          u.setId(id);
          u.setPassword(psw.trim());
          userService.updatePswById(u);
          response.getWriter().write("设置成功，请登录吧！");
    }

    @RequestMapping("insertFeedBack")
    public void InsertFeedBack(HttpServletRequest request,HttpServletResponse response,String content,String contact) throws IOException {
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            Feedback feedback = new Feedback();
            feedback.setUid(user.getId());
            feedback.setUname(user.getUsername());
            feedback.setContent(content.trim());
            feedback.setContact(contact.trim());
            feedback.setIswatched(0);
            userService.insertFeedBack(feedback);
            response.getWriter().write("自动回复：信息已收到，耐心等待回复吧！");
        }else{
            response.getWriter().write("没有登录！！！");
        }
    }

    @RequestMapping("disAllFeedBack")
    public String DisAllFeedBack(HttpServletRequest request,Model model,int page){
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin!=null){
            Pageresult<Feedback> feedbackPageresult = userService.DisFeedBack(page);
            int count = userService.CountFeedBack();
            model.addAttribute("allfeedback",feedbackPageresult);
            model.addAttribute("feedbacknum",count);
            return "admin_feedback";
        }else{
            return "404";
        }
    }

    @RequestMapping("disAllFeedBackWatched")
    public String DisAllFeedBackWatched(HttpServletRequest request,Model model,int iswatched,int page){
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin!=null){
            Pageresult<Feedback> feedbackPageresult = userService.DisFeedBackWatched(iswatched,page);
            int count = userService.CountFeedBackWatched(iswatched);
            model.addAttribute("allfeedback",feedbackPageresult);
            model.addAttribute("feedbacknum",count);
            return "admin_feedback";
        }else{
            return "404";
        }
    }

    @RequestMapping("deleteFeedBack")
    public String DeleteFeedBack(HttpServletRequest request,int id){
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin!=null){
            userService.deleteFeedBackById(id);
            return "redirect:disAllFeedBack.do?page=1";
        }else{
            return "404";
        }
    }

    @RequestMapping("updateFeedBack")
    public void UpdateFeedBack(HttpServletRequest request,HttpServletResponse response,int id,int caozuo) throws IOException {
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin!=null){
            Feedback feedback = new Feedback();
            feedback.setId(id);
            if (caozuo==1){
                feedback.setIswatched(1);
                userService.updateFeedBackById(feedback);
            }else{
                feedback.setIswatched(2);
                userService.updateFeedBackById(feedback);
            }
            response.getWriter().write("ok");
        }else{
            response.getWriter().write("管理员没有登录！！！");
        }
    }

    @RequestMapping("out")
    public String Out(HttpServletRequest request){
        request.getSession().removeAttribute("admin");
        return "login";
    }
}

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
import java.sql.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/video")
public class VideoController {
    @Resource
    private VideoService videoService;
    @Resource
    private UserService userService;
    @Resource
    private RelationService relationService;

    @RequestMapping("insertVideo")
    public String insertVideo(MultipartFile[] upload, HttpServletRequest request, String vname, String note) throws IOException {
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            //使用fileupload组件完成文件上传
            // 允许上传封面的格式
            final String[] IMAGE_TYPE = new String[] { ".bmp", ".jpg", ".jpeg", ".png" };
            // 允许上传视频的格式
            final String[] VIDEO_TYPE = new String[] { ".mp4", ".avi", ".mpg"};
            //上传位置指定
            //上传的位置要指定
            String path = request.getSession().getServletContext().getRealPath("/upload/");
            //判断该路径是否存在
            File file = new File(path);
            if (!file.exists()) {
                //如果这个文件夹不存在的话,就创建这个文件
                file.mkdirs();
            }
            Video v = new Video();
            v.setVname(vname);
            v.setCollected(0);
            //v.setCreatetime(new Date());
            v.setWatched(0);
            v.setIswatched(0);
            v.setUser_id(user.getId());
            v.setVnote(note);

            for(int i=0;i<upload.length;i++) {
                //获取上传文件名称
                String filename = upload[i].getOriginalFilename();
                //把文件名称设置成唯一值 uuid 以防止文件名相同覆盖
                String uuid = UUID.randomUUID().toString().replace("-", "");
                //新文件名
                filename = uuid + "_" + filename;
                //完成文件上传
                upload[i].transferTo(new File(path, filename));
                String NewFilePath = "upload/" + filename;
                for (String type : IMAGE_TYPE) {
                    if (StringUtils.endsWithIgnoreCase(upload[i].getOriginalFilename(), type)) {
                        v.setVimg(NewFilePath);
                        System.out.println(NewFilePath);
                    }
                }
                for (String type : VIDEO_TYPE) {
                    if (StringUtils.endsWithIgnoreCase(upload[i].getOriginalFilename(), type)) {
                        v.setVsrc(NewFilePath);
                        System.out.println(NewFilePath);
                    }
                }
            }
            User_Item user_item = new User_Item();
            videoService.insertVideo(v);
            int count = videoService.CountVideoByUid(user.getId());
            user_item.setV_num(count);
            user_item.setUser_id(user.getId());
            videoService.UpdateUserVnumById(user_item);
            List<Video> videoList = videoService.DisVideoNoWatched(user.getId());
            HttpSession session = request.getSession(true);
            session.setAttribute("nowatch",videoList);

            return "redirect:DisAllVideoById.do?&page=1&user_id="+user.getId();
        }else{
            return "404";
        }
    }

    //用于校验只能上传一张图片和一个视频
    @RequestMapping("videoIsTrue")
    public void VideoIsTrue(MultipartFile[] upload,HttpServletResponse response, HttpServletRequest request) throws IOException {
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            //使用fileupload组件完成文件上传
            // 允许上传封面的格式
            final String[] IMAGE_TYPE = new String[] { ".bmp", ".jpg", ".jpeg", ".png" };
            int inum = 0;//记录上传的图片数
            int vnum = 0;//记录上传的图片数
            // 允许上传视频的格式
            final String[] VIDEO_TYPE = new String[] { ".mp4", ".avi", ".mpg"};
            for(int i=0;i<upload.length;i++) {
                //获取上传文件名称
                for (String type : IMAGE_TYPE) {
                    if (StringUtils.endsWithIgnoreCase(upload[i].getOriginalFilename(), type)) {
                        inum++;
                    }
                }
                for (String type : VIDEO_TYPE) {
                    if (StringUtils.endsWithIgnoreCase(upload[i].getOriginalFilename(), type)) {
                        vnum++;
                    }
                }
            }
            if (inum==1&&vnum==1){
                response.getWriter().write("1");
            }else{
                response.getWriter().write("0");
            }
        }else{
            response.getWriter().write("没有登录！！！");
        }
    }

    @RequestMapping("DisAllVideoById")
    public String DisAllVideoById(HttpServletRequest request, Model model,int page,int user_id){
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            Pageresult<Video> videoList = videoService.DisAllVideoById(user_id,page);
            List<Video> videoList1 = videoService.DisRecentVideoByUid(user_id);
            Video video = videoService.DisPopularVideoByUid(user_id);
            model.addAttribute("povideo",video);
            model.addAttribute("video",videoList);
            model.addAttribute("recentvideo",videoList1);
            if(user_id==user.getId()){
                User_Item user1_item = userService.findUserAllItem(user.getId());
                HttpSession session = request.getSession(true);
                session.setAttribute("user1_item",user1_item);
                return "user_index";
            }else{
                return "otheruser_index";
            }
        }else {
            return "404";
        }
    }

    @RequestMapping("DisVideoById")
    public String DisVideoById(HttpServletRequest request,Model model,int id){
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            Video video = videoService.DisVideoById(id);
            if (video.getIswatched()==1){
                int watched = video.getWatched()+1;
                Video newV = new Video();
                newV.setWatched(watched);
                newV.setId(video.getId());
                videoService.UpdateVwatchById(newV);
                int count = videoService.CountCommentById(id);
                List<Comment> comments = videoService.DisCommentById(id);
                model.addAttribute("video",video);
                model.addAttribute("comments",comments);
                model.addAttribute("commentnum",count);

                //刷新一下数据，防止之前数据有误
                int cnum = videoService.CountUserCnumById(user.getId());
                int vcollect = videoService.CountVcollectedById(id);
                User_Item user_item = new User_Item();
                user_item.setUser_id(user.getId());
                Video video1 = new Video();
                video1.setId(id);
                user_item.setC_num(cnum);
                video1.setCollected(vcollect);
                videoService.UpdateUserCnumById(user_item);
                videoService.UpdateVcollectedById(video1);

                return "user_video";
            }else{
                return "404";
            }
        }else{
            return "404";
        }
    }

    @RequestMapping("DisCollectVideoById")
    public String DisCollectVideoById(HttpServletRequest request,Model model){
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            List<Collect> collects = videoService.DisCollectVideo(user.getId());
            model.addAttribute("video",collects);

            return "user_collect";
        }else{
            return "404";
        }
    }

    @RequestMapping("DisOtherUserById")
    public String DisOtherVideoById(Model model,HttpServletRequest request,int user_id,int page){
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            if(user_id==user.getId()){
                return "redirect:DisAllVideoById.do?page=1&user_id="+user_id;
            }
            else{
                Relation relation = new Relation();
                relation.setUserid(user_id);
                relation.setFansid(user.getId());
                int count = relationService.isFans(relation);
                model.addAttribute("isFans",count);
                Video video = videoService.DisPopularVideoByUid(user_id);
                model.addAttribute("povideo",video);
                Pageresult<Video> videoList  = videoService.DisAllVideoById(user_id,page);
                model.addAttribute("uservideo",videoList);

                List<Video> videoList1 = videoService.DisRecentVideoByUid(user_id);
                model.addAttribute("reuservideo",videoList1);

                User_Item user_item =  userService.findUserAllItem(user_id);
                model.addAttribute("otheruser",user_item);

                return "otheruser_index";
            }
        }else{
            return "404";
        }
    }

    @RequestMapping("index")
    public String DisVideo(Model model,HttpServletRequest request){
        User user1 = (User) request.getSession(true).getAttribute("user1");
        if (user1!=null){
            List<Video> videobw = videoService.DisVideoByWatched();
            List<Relation> relations = relationService.fourRelationUserById(user1.getId());
            List<Relation> relations1 = relationService.DisConcernVideo(user1.getId());
            HttpSession session = request.getSession(true);
            session.setAttribute("fourrelation",relations);
            model.addAttribute("concernvideo",relations1);
            model.addAttribute("videobw",videobw);
            Message message = new Message();
            message.setSendtype(1);
            message.setReceivetype(1);
            message.setReceive_id(user1.getId());
            Advise advise = new Advise();
            advise.setReceiver_id(user1.getId());
            advise.setIswatched(0);
            List<Message> messages = userService.DisMessageById(message);
            List<Advise> advises = userService.DisAdviseById(user1.getId());
            List<Video> videoList = videoService.DisVideoNoWatched(user1.getId());
            int msgcount = userService.CountMessageById(message);
            int adcount = userService.CountAdviseById(advise);
            session.setAttribute("nowatch",videoList);
            session.setAttribute("messages",messages);
            session.setAttribute("msgcount",msgcount);
            session.setAttribute("advises",advises);
            session.setAttribute("adcount",adcount);
            return "index";
        }else {
            return "404";
        }
    }

    @RequestMapping("caozuoRelation")
    public String CaoZuoRelation(HttpServletRequest request,int user_id,int c) {
        //c=0取消关注 c=1点击关注
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            User_Item user_item = userService.findUserAllItem(user_id);
            User_Item user_item1 = userService.findUserAllItem(user.getId());
            User_Item u1 = new User_Item();
            User_Item u2 = new User_Item();
            HttpSession session = request.getSession(true);
            u1.setUser_id(user_id);
            u2.setUser_id(user.getId());
            if (c == 0) {
                if (user_id == user.getId()) {
                    return "404";
                } else {
                    Relation relation = new Relation();
                    relation.setUserid(user_id);
                    relation.setFansid(user.getId());
                    relationService.deleteRelationById(relation);

                    u1.setFans(user_item.getFans()-1);
                    userService.updateUserFansById(u1);

                    u2.setConcern(user_item1.getConcern()-1);
                    userService.updateUserConcernById(u2);

                    User_Item user1_item = userService.findUserAllItem(user.getId());
                    session.setAttribute("user1_item",user1_item);

                    List<Relation> relations = relationService.fourRelationUserById(user.getId());
                    session.setAttribute("fourrelation",relations);
                    return "redirect:DisOtherUserById.do?user_id=" + user_id + "&page=1";
                }
            } else {
                if (user_id == user.getId()) {
                    return "404";
                } else {
                    Relation relation = new Relation();
                    relation.setUserid(user_id);
                    relation.setFansid(user.getId());
                    relationService.insertRelationById(relation);

                    u1.setFans(user_item.getFans() + 1);
                    userService.updateUserFansById(u1);

                    u2.setConcern(user_item1.getConcern() + 1);
                    userService.updateUserConcernById(u2);

                    Advise advise = new Advise();
                    advise.setReceiver_id(user_id);
                    advise.setContent("【用户】 " + user.getUsername() + " 关注你了");
                    advise.setIswatched(0);
                    userService.insertAdvise(advise);

                    User_Item user1_item = userService.findUserAllItem(user.getId());
                    session.setAttribute("user1_item", user1_item);

                    List<Relation> relations = relationService.fourRelationUserById(user.getId());
                    session.setAttribute("fourrelation", relations);

                    return "redirect:DisOtherUserById.do?user_id=" + user_id + "&page=1";
                }
            }
        }else{
            return "404";
        }
    }

    @RequestMapping("vcollect")
    public void Vcollect(HttpServletRequest request, HttpServletResponse response, int video_id) throws IOException{
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            Collect collect = new Collect();
            collect.setVideo_id(video_id);
            collect.setCollector_id(user.getId());
            int count = videoService.IsCollected(collect);
            if(count > 0){
                response.getWriter().write("1");
            }else{
                response.getWriter().write("0");
            }
        }else{
            response.getWriter().write("2");
        }
    }

    @RequestMapping("czcollect")
    public void CZCollect(HttpServletRequest request, HttpServletResponse response, int video_id,int c) throws IOException{
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            Collect collect = new Collect();
            collect.setVideo_id(video_id);
            collect.setCollector_id(user.getId());
            Video uv = videoService.DisVideoById(video_id);
            User_Item user_item = new User_Item();
            user_item.setUser_id(user.getId());
            Video video = new Video();
            video.setId(video_id);
            if (c==0){
                videoService.CanelCollectVideo(collect);
                user_item.setC_num(uv.getUser_item().getC_num()-1);
                video.setCollected(uv.getCollected()-1);
                videoService.UpdateUserCnumById(user_item);
                videoService.UpdateVcollectedById(video);
                response.getWriter().write("0");
                response.getWriter().write(",");
                String co = String.valueOf(uv.getCollected()-1);
                response.getWriter().write(co);
            }else{
                videoService.CollectVideo(collect);
                user_item.setC_num(uv.getUser_item().getC_num()+1);
                video.setCollected(uv.getCollected()+1);
                videoService.UpdateUserCnumById(user_item);
                videoService.UpdateVcollectedById(video);
                response.getWriter().write("1");
                response.getWriter().write(",");
                String co = String.valueOf(uv.getCollected()+1);
                response.getWriter().write(co);
            }
        }else{
            response.getWriter().write("1");
            response.getWriter().write(",");
            response.getWriter().write("1");
        }
    }

    @RequestMapping("searchVideo")
    public String SearchVideo(Model model,HttpServletRequest request,String vname){
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            vname = vname.trim();
            List<Video> videoList = videoService.FindVideoByName(vname);
            int count = videoService.CountVideoByName(vname);
            int count1 = videoService.CountUserByName(vname);
            HttpSession session = request.getSession(true);
            session.setAttribute("search",vname);
            model.addAttribute("videonum",count);
            model.addAttribute("usernum",count1);
            model.addAttribute("searchvideo",videoList);
            return "search_video";
        }else{
            return "404";
        }

    }

    @RequestMapping("searchUser")
    public String SearchUser(Model model,HttpServletRequest request){
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            String username = (String) request.getSession(true).getAttribute("search");
            List<User_Item> user_items = videoService.FindUserByName(username);
            int count = videoService.CountVideoByName(username);
            int count1 = videoService.CountUserByName(username);
            model.addAttribute("videonum",count);
            model.addAttribute("usernum",count1);
            model.addAttribute("searchuser",user_items);
            return "search_user";
        }else{
            return "404";
        }

    }

    @RequestMapping("searchVideoAdmin")
    public String SearchVideoAdmin(HttpServletRequest request,Model model,String vname,int page){
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin!=null){
            Pageresult<Video> videos = videoService.FindVideoByNameP(vname.trim(),page);
            int count = videoService.CountVideoByNameP(vname.trim());
            model.addAttribute("videonum",count);
            model.addAttribute("allvideo",videos);
            return "admin_video";
        }else {
            return "404";
        }
    }

    @RequestMapping("addComment")
    public String AddComment(HttpServletRequest request,int video_id,String v_comment){
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            Comment comment = new Comment();
            comment.setUser_id(user.getId());
            comment.setVideo_id(video_id);
            comment.setV_comment(v_comment.trim());

            videoService.AddComment(comment);

            return "redirect:DisVideoById.do?id="+video_id;
        }else{
            return "404";
        }
    }

    @RequestMapping("deleteComment")
    public String DeleteComment(HttpServletRequest request,int video_id,int user_id,int people){
        //people是判断是管理端还是用户端删除
        User user = (User) request.getSession(true).getAttribute("user1");
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        Comment comment = new Comment();
        comment.setUser_id(user_id);
        comment.setVideo_id(video_id);
        if (user!=null || admin!=null){
            if (people==0){
                if (user_id==user.getId()){
                    videoService.DeleteCommentById(comment);
                    return "redirect:DisVideoById.do?id="+video_id;
                }else{
                    return "404";
                }
            }else{
                videoService.DeleteCommentById(comment);
                return "redirect:DisCommentA.do?page=1";
            }
        }else{
            return "404";
        }
    }

    @RequestMapping("DisAllVideo")
    public String DisAllVideo(HttpServletRequest request,Model model,int page){
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin!=null){
            Pageresult<Video> videoList = videoService.DisAllVideo(page);
            int count = videoService.CountVideo();
            model.addAttribute("allvideo",videoList);
            model.addAttribute("videonum",count);
            return "admin_video";
        }else{
            return "404";
        }
    }


    @RequestMapping("DisCommentA")
    public String DisCommentA(HttpServletRequest request,Model model,int page){
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin!=null){
            Pageresult<Comment> comments = videoService.DisComment(page);
            int count = videoService.CountComment();
            model.addAttribute("allcomment",comments);
            model.addAttribute("comnum",count);
            return "admin_comment";
        }else{
            return "404";
        }
    }

    @RequestMapping("searchCommentAdmin")
    public String SearchCommentAdmin(HttpServletRequest request,Model model,int page,String username){
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin!=null){
            Pageresult<Comment> comments = videoService.DisCommentF(username,page);
            int count = videoService.CountCommentF(username);
            model.addAttribute("allcomment",comments);
            model.addAttribute("comnum",count);
            return "admin_comment";
        }else{
            return "404";
        }
    }

    @RequestMapping("returnVideoById")
    public void ReturnVideoById( HttpServletResponse response, int video_id) throws IOException{
        Video video = videoService.DisVideoById(video_id);
        response.getWriter().write(video.getVsrc());
    }

    @RequestMapping("updateIswatched")
    public void UpdateIswatched(HttpServletRequest request, HttpServletResponse response, int video_id) throws IOException{
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin!=null){
            Video video = new Video();
            video.setId(video_id);
            video.setIswatched(1);
            videoService.UpdateIsWatchedById(video);
            Video video1 = videoService.DisVideoById(video_id);
            Advise advise = new Advise();
            advise.setReceiver_id(video1.getUser_id());
            advise.setContent("【视频】 "+video1.getVname()+" 审核通过");
            advise.setIswatched(0);
            userService.insertAdvise(advise);
            User_Item user_item = new User_Item();
            int count = videoService.CountVideoByUid(video1.getUser_id());
            user_item.setV_num(count);
            user_item.setUser_id(video1.getUser_id());
            videoService.UpdateUserVnumById(user_item);

            response.getWriter().write("已审核");
        }else{
            response.getWriter().write("审核失败");
        }
    }

    @RequestMapping("notIswatched")
    public void NotIswatched(HttpServletRequest request, HttpServletResponse response, int video_id) throws IOException{
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin!=null){
            Video video = new Video();
            video.setId(video_id);
            video.setIswatched(2);
            videoService.UpdateIsWatchedById(video);
            Video video1 = videoService.DisVideoById(video_id);
            Advise advise = new Advise();
            advise.setReceiver_id(video1.getUser_id());
            advise.setContent("【视频】 "+video1.getVname()+" 审核不通过");
            advise.setIswatched(0);
            userService.insertAdvise(advise);
            User_Item user_item = new User_Item();
            int count = videoService.CountVideoByUid(video1.getUser_id());
            user_item.setV_num(count);
            user_item.setUser_id(video1.getUser_id());
            videoService.UpdateUserVnumById(user_item);

            response.getWriter().write("审核不通过");
        }else{
            response.getWriter().write("审核失败");
        }
    }

    @RequestMapping("deleteIswatched")
    public String DeleteIswatched(HttpServletRequest request,int video_id){
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            Video video = new Video();
            video.setId(video_id);
            video.setIswatched(3);
            videoService.UpdateIsWatchedById(video);
            User_Item user_item = new User_Item();
            int count = videoService.CountVideoByUid(user.getId());
            user_item.setV_num(count);
            user_item.setUser_id(user.getId());
            videoService.UpdateUserVnumById(user_item);
            return "redirect:DisAllVideoById.do?page=1&user_id="+user.getId();
        }else {
            return "404";
        }
    }

    @RequestMapping("cannelcollect")
    public String CannelCollect(HttpServletRequest request, int video_id){
        User user = (User) request.getSession(true).getAttribute("user1");
        if (user!=null){
            Collect collect = new Collect();
            collect.setVideo_id(video_id);
            collect.setCollector_id(user.getId());
            videoService.CanelCollectVideo(collect);
            int cnum = videoService.CountUserCnumById(user.getId());
            int vcollect = videoService.CountVcollectedById(video_id);
            User_Item user_item = new User_Item();
            user_item.setUser_id(user.getId());
            user_item.setC_num(cnum);
            Video video = new Video();
            video.setId(video_id);
            video.setCollected(vcollect);
            videoService.UpdateUserCnumById(user_item);
            videoService.UpdateVcollectedById(video);
            User_Item user1_item = userService.findUserAllItem(user.getId());
            HttpSession session = request.getSession(true);
            session.setAttribute("user1_item",user1_item);

            return "redirect:DisCollectVideoById.do";
        }else{
            return "404";
        }
    }

    @RequestMapping("deleteVideo")
    public String DeleteVideo(HttpServletRequest request,int video_id,int user_id){
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin!=null){
            videoService.DeleteVideoById(video_id);
            int count = videoService.CountVideoByUid(user_id);
            User_Item user_item = new User_Item();
            user_item.setV_num(count);
            user_item.setUser_id(user_id);
            videoService.UpdateUserVnumById(user_item);
            return "redirect:DisAllVideo.do?page=1";
        }else{
            return "404";
        }
    }
}

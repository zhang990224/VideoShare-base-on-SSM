<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/4/26
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理系统</title>
    <!--<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=no" />-->
    <!-- Styles -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
    <!-- layout CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/layout.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/icons.css">
    <!-- Javascript files -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.js" type="text/javascript"></script>
    <!-- Dialog -->
    <link href="${pageContext.request.contextPath}/assets/css/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/assets/js/common.js" type="text/javascript"></script>
    <!-- Custom JS -->
    <script src="${pageContext.request.contextPath}/assets/js/layout.js" type="text/javascript"></script>
</head>
<style>
    #lean_overlay{
        position:fixed;
        z-index:100;
        top:0px;
        left:0px;
        height:100%;
        width:100%;
        background:#000;
        display:none;
    }
    #headmodal,#sendmodal,#tishimodal{
        width:300px;
        padding:15px 20px;
        background:#f3f6fa;
        -webkit-border-radius:6px;
        -moz-border-radius:6px;
        border-radius:6px;
        -webkit-box-shadow:0 1px 5px rgba(0, 0, 0, 0.5);
        -moz-box-shadow:0 1px 5px rgba(0, 0, 0, 0.5);
        box-shadow:0 1px 5px rgba(0, 0, 0, 0.5);
    }

    .uk-textarea {
        /* 1 */
        max-width: 100%;
        /* 2 */
        width: 100%;
        /* 3 */
        border: 0 none;
        /* 4 */
        padding: 0px 16px;
        background: #fff;
        color: #666;
        /* font-weight: 600; */
        border: 1px solid #eceff5;
        border-radius: 7px;
        transition: 0.2s ease-in-out;
        transition-property: color, background-color, border;
    }
    .uk-textarea:focus {
        outline: none;
        background-color: #fff;
        color: #666;
        border-color: #d0d0d0;
    }
</style>
<body>
<header class="dark_grey">
    <!-- Header start -->
    <div class="top">
        <div class="logo">
            <a href="#" class="simple-text">
                <img src="${pageContext.request.contextPath}/assets/images/logo_01.png" class="logo-img" />
            </a>
        </div>
        <div class="top-right">
            <div class="top-user">
                <div class="my-select dk-select user-select">
                    <div class="dk-selected" tabindex="0">
                        <img src="${pageContext.request.contextPath}/assets/images/index_19.png" class="user-header" />
                        <span class="substr" title="admin">${admin.getAdminname()}</span>
                    </div>
                    <ul class="dk-select-options">
                        <li class="dk-option">
                            <a href="${pageContext.request.contextPath}/user/out.do" target="_self">退出管理</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="top-home">
                <span class="tab-home glyphicon glyphicon-home"></span>
                <span class="tab-home-name"></span>
            </div>
        </div>
    </div>
</header>

<div class="wrapper">
    <div class="sidebar">
        <div class="has-scrollbar">
            <div class="sidebar-wrapper">
                <div class="navbutton" id="navbutton-collapsed">
                    <a href="#" class="simple-text">
                        <!--<img src="images/menu_zd.png" />-->
                        <i class="glyphicon glyphicon-step-backward"></i>
                    </a>
                </div>
                <ul class="nav-ul">
                    <li class="nav-li-1"><a href="${pageContext.request.contextPath}/admin_index.jsp"><i class="glyphicon glyphicon-home" title="首页"></i><span class="nav-title">首&nbsp;&nbsp;&nbsp;&nbsp;页 </span></a></li>
                    <li class="nav-li-5 active"><a href="${pageContext.request.contextPath}/user/disAllUser.do?page=1"><i class="glyphicon glyphicon-user" title="用户"></i><span class="nav-title">用&nbsp;&nbsp;&nbsp;&nbsp;户 </span></a></li>
                    <li class="nav-li-12"><a href="${pageContext.request.contextPath}/video/DisCommentA.do?page=1"><i class="glyphicon glyphicon-edit" title="评论"></i><span class="nav-title">评&nbsp;&nbsp;&nbsp;&nbsp;论 </span></a></li>
                    <li class="nav-li-16"><a href="${pageContext.request.contextPath}/video/DisAllVideo.do?page=1"><i class="glyphicon glyphicon-play-circle" title="视频"></i><span class="nav-title">视&nbsp;&nbsp;&nbsp;&nbsp;频 </span></a></li>
                    <li class="nav-li-13"><a href="${pageContext.request.contextPath}/user/disAllFeedBack.do?page=1"><i class="glyphicon glyphicon-envelope" title="反馈"></i><span class="nav-title">反&nbsp;&nbsp;&nbsp;&nbsp;馈 </span></a></li>
                </ul>
            </div>
        </div>

    </div>
    <div id="content" class="no-sidebar">
        <div class="inner_content">
            <div style="margin-top: 5px;">
                <input type="text" name="search" id="search" style="height: 30px;" placeholder="搜索某用户"/>
                <input type="button" value="搜索" id="sear" onclick="search()" style="height: 30px;width:50px;background-color: white;color: black;cursor: pointer;font-weight: bold;"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 14px"><strong>${usernum}</strong> 个用户</span>
            </div>
            <div class="user_iframe">
                    <div>
                        <table style="text-align: center;" >
                            <tr>
                                <th style="width: 50px;">序号</th>
                                <th style="width: 120px;">用户名称</th>
                                <th style="width: 100px;">用户头像</th>
                                <th style="width: 120px;">创建时间</th>
                                <th style="width: 160px;">个人介绍</th>
                                <th style="width: 80px;">粉丝数</th>
                                <th style="width: 80px;">关注数</th>
                                <th style="width: 100px;">发布视频数</th>
                                <th style="width: 100px;">收藏视频数</th>
                                <th style="width: 80px;">账号信息</th>
                                <th style="width: 80px;">操作</th>
                            </tr>
                            <c:forEach items="${alluser.list}" var="all" varStatus="a">
                                <tr>
                                    <td style="height: 100px;border: 1px dashed;">${a.count+(alluser.currentPage-1)*5}</td>
                                    <td style="height: 100px;border: 1px dashed;">${all.username}</td>
                                    <td style="height: 100px;border: 1px dashed;"><img src="${pageContext.request.contextPath}/${all.u_img}" style="width: 90px;height: 90px;"></td>
                                    <td style="height: 100px;border: 1px dashed;">${all.birthday}</td>
                                    <td style="height: 100px;border: 1px dashed;width: 200px;">${all.introduce}</td>
                                    <td style="height: 100px;border: 1px dashed;">${all.fans}</td>
                                    <td style="height: 100px;border: 1px dashed;">${all.concern}</td>
                                    <td style="height: 100px;border: 1px dashed;">${all.v_num}</td>
                                    <td style="height: 100px;border: 1px dashed;">${all.c_num}</td>
                                    <td style="height: 100px;border: 1px dashed;"><a onclick="usermsg(${all.user_id})" href="#headmodal" class="modaltrigger">查看</a></td>
                                    <td style="height: 100px;border: 1px dashed;"><a href="#tishimodal" class="modaltrigger">删除</a></td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td></td>
                                <td style="height: 30px;">
                                    <c:if test="${alluser.currentPage > 1}">
                                        <a href="${pageContext.request.contextPath}/user/disAllUser.do?page=${alluser.currentPage-1}">上一页</a>
                                    </c:if>
                                </td>
                                <span style="font-size: 15px;">当前第${alluser.currentPage}页/总${alluser.totalPage}页</span>
                                <td style="height: 30px;">
                                    <c:if test="${alluser.currentPage < alluser.totalPage}">
                                        <a href="${pageContext.request.contextPath}/user/disAllUser.do?page=${alluser.currentPage+1}">下一页</a>
                                    </c:if>
                                </td>
                            </tr>
                        </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="right-sidebar-toggle">
    <i class="fa-spin glyphicon glyphicon-backward"></i>
</div>
</div>
<div id="headmodal" style="display:none;">
    <h4>账号信息</h4>
    <div style="font-size: 14px;">
        <span style="display: none" id="u1"></span>
        用户名称：<span id="uname"></span><br>
        电子邮箱：<span id="email"></span><br>
        用户密码：<span id="psw"></span>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="#sendmodal" class="modaltrigger">通知</a>
    </div>
</div>
<div id="sendmodal" style="display:none;">
    <form id="headform" name="headform" method="post" action="">
        <h5>通知对象:<span id="un1"></span></h5>
        <h5>通知内容:</h5>
        <textarea class="uk-textarea" placeholder="Enter Your Messgae..." style=" height:120px" id="advisetext"></textarea>
        <a href="#" class="reply" onclick="sendAdvise()"><i class="icon-line-awesome-undo"></i>Send</a>
    </form>
</div>
<div id="tishimodal" style="display:none;text-align: center">
    <h5>为了用户更好地体验，暂时删除用户功能不开放</h5>
</div>
</body>
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.leanModal.min.js"></script>
<script type="text/javascript">
    function usermsg(user_id){
        var uname = document.getElementById("uname");
        var email = document.getElementById("email");
        var psw = document.getElementById("psw");
        var u1 = document.getElementById("u1");
        var un1 = document.getElementById("un1");
        $.ajax({
            url:"${pageContext.request.contextPath}/user/returnUserById.do",
            async:false,
            type:"POST",
            data: "user_id="+user_id,
            success:function (data) {
                var arr=data.split(",");
                uname.innerHTML = arr[0];
                email.innerHTML = arr[1];
                psw.innerHTML = arr[2];
                u1.innerHTML = user_id;
                un1.innerHTML = arr[0];
            },error:function (){
                alert("获取失败");
            },dataType:"text"
        });
    }

    function sendAdvise(){
        var u1 = document.getElementById("u1").innerHTML;
        var advisetext = document.getElementById("advisetext");
        if (advisetext!=""){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/sendAdvise.do",
                async:false,
                data:{"user_id":u1,"advise":advisetext.value},
                type:"POST",
                success:function (data){
                    alert(data);
                    advisetext.value = "";
                },
                error:function () {
                    alert("获取失败");
                },dataType:"text"
            });
        } else{
         alert("不要发送空内容喔！");
        }
    }

    function search() {
        var input = document.getElementById("search").value;
        if (input!=""){
            location.href="${pageContext.request.contextPath}/user/searchUserAdmin.do?page=1&username="+input;
        }
    }

    $(function(){
        //弹出层调用语句
        $('.modaltrigger').leanModal({
            top:110,
            overlay:0.45,
            // closeButton:".hidemodal",
            backdrop:'static',
            keyboard:false
        });
    });
</script>
</html>

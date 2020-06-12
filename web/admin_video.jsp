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
    #headmodal{
        width:450px;
        padding:15px 20px;
        background:#f3f6fa;
        -webkit-border-radius:6px;
        -moz-border-radius:6px;
        border-radius:6px;
        -webkit-box-shadow:0 1px 5px rgba(0, 0, 0, 0.5);
        -moz-box-shadow:0 1px 5px rgba(0, 0, 0, 0.5);
        box-shadow:0 1px 5px rgba(0, 0, 0, 0.5);
    }
    #tishimodal1,#tishimodal2{
        width:250px;
        padding:15px 20px;
        background:#f3f6fa;
        -webkit-border-radius:6px;
        -moz-border-radius:6px;
        border-radius:6px;
        -webkit-box-shadow:0 1px 5px rgba(0, 0, 0, 0.5);
        -moz-box-shadow:0 1px 5px rgba(0, 0, 0, 0.5);
        box-shadow:0 1px 5px rgba(0, 0, 0, 0.5);
    }
    /** custom login button **/
    .flatbtn-blu{
        -webkit-box-sizing:border-box;
        -moz-box-sizing:border-box;
        box-sizing:border-box;
        display:inline-block;
        outline:0;
        border:0;
        color:#edf4f9;
        text-decoration:none;
        background-color:#4f94cf;
        border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
        font-size:1.3em;
        font-weight:bold;
        padding:12px 26px 12px 26px;
        line-height:normal;
        text-align:center;
        vertical-align:middle;
        cursor:pointer;
        text-transform:uppercase;
        text-shadow:0 1px 0 rgba(0,0,0,0.3);
        -webkit-border-radius:3px;
        -moz-border-radius:3px;
        border-radius:3px;
        -webkit-box-shadow:0 1px 1px rgba(0, 0, 0, 0.2);
        -moz-box-shadow:0 1px 1px rgba(0, 0, 0, 0.2);
        box-shadow:0 1px 1px rgba(0, 0, 0, 0.2);
    }
    .flatbtn-blu:hover{
        color:#fff;
        background-color:#519dde;
    }
    .flatbtn-blu:active{
        -webkit-box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
        -moz-box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
        box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
    }
</style>
<script>
    function onloadvideo() {
        var video1 = document.getElementById("video1");
        var modal = document.getElementById("headmodal");
        if (modal.style.display!="block"){
            video1.currentTime = 0;
            video1.pause();
        }
    }

    window.onload = function () {
        onloadvideo();
    }
</script>
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
                    <li class="nav-li-5"><a href="${pageContext.request.contextPath}/user/disAllUser.do?page=1"><i class="glyphicon glyphicon-user" title="用户"></i><span class="nav-title">用&nbsp;&nbsp;&nbsp;&nbsp;户 </span></a></li>
                    <li class="nav-li-12"><a href="${pageContext.request.contextPath}/video/DisCommentA.do?page=1"><i class="glyphicon glyphicon-edit" title="评论"></i><span class="nav-title">评&nbsp;&nbsp;&nbsp;&nbsp;论 </span></a></li>
                    <li class="nav-li-16 active"><a href="${pageContext.request.contextPath}/video/DisAllVideo.do?page=1"><i class="glyphicon glyphicon-play-circle" title="视频"></i><span class="nav-title">视&nbsp;&nbsp;&nbsp;&nbsp;频 </span></a></li>
                    <li class="nav-li-13"><a href="${pageContext.request.contextPath}/user/disAllFeedBack.do?page=1"><i class="glyphicon glyphicon-envelope" title="反馈"></i><span class="nav-title">反&nbsp;&nbsp;&nbsp;&nbsp;馈 </span></a></li>
                </ul>
            </div>
        </div>
        <div class="icon_zk" id="icon-zk-collapsed"><i class="glyphicon glyphicon-triangle-left"></i></div>
    </div>
    <div id="content" class="no-sidebar">
        <div class="inner_content">
            <div style="margin-top: 5px;">
                <input type="text" name="search" id="search" style="height: 30px;" placeholder="搜索某视频"/>
                <input type="button" value="搜索" id="sear" onclick="search()" style="height: 30px;width:50px;background-color: white;color: black;cursor: pointer;font-weight: bold;"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 14px"><strong>${videonum}</strong> 个视频</span>
            </div>
            <div class="user_iframe">
                    <div>
                        <table style="text-align: center;" >
                            <tr>
                                <th style="width: 50px;">序号</th>
                                <th style="width: 120px;">视频名称</th>
                                <th style="width: 120px;">发布者</th>
                                <th style="width: 150px;">视频封面</th>
                                <th style="width: 180px;">视频介绍</th>
                                <th style="width: 80px;">收藏数</th>
                                <th style="width: 80px;">观看数</th>
                                <th style="width: 100px;">是否审核</th>
                                <th style="width: 120px;">创建时间</th>
                                <th style="width: 80px;">操作1</th>
                                <th style="width: 80px;">操作2</th>
                                <th style="width: 80px;">操作3</th>
                            </tr>
                            <c:forEach items="${allvideo.list}" var="all" varStatus="a">
                                <tr>
                                    <td style="height: 100px;border: 1px dashed;">${a.count+(allvideo.currentPage-1)*5}</td>
                                    <td style="height: 100px;border: 1px dashed;">${all.vname}</td>
                                    <td style="height: 100px;border: 1px dashed;">${all.user_item.username}</td>
                                    <td style="height: 100px;border: 1px dashed;">
                                        <img src="${pageContext.request.contextPath}/${all.vimg}" style="width: 150px;height: 80px;">
                                    </td>
                                    <td style="height: 100px;border: 1px dashed;">${all.vnote}</td>
                                    <td style="height: 100px;border: 1px dashed;">${all.collected}</td>
                                    <td style="height: 100px;border: 1px dashed;">${all.watched}</td>
                                    <td style="height: 100px;border: 1px dashed;" class="iswatched">
                                        <c:if test="${all.iswatched==0}"><a href="#tishimodal1" class="modaltrigger" onclick="dis(${all.id},${a.count})">未审核</a></c:if>
                                        <c:if test="${all.iswatched==1}">已审核</c:if>
                                        <c:if test="${all.iswatched==2}">审核不通过</c:if>
                                        <c:if test="${all.iswatched==3}">视频已下架</c:if>
                                    </td>
                                    <td style="height: 100px;border: 1px dashed;">${all.createtime}</td>
                                    <td style="height: 100px;border: 1px dashed;"><a href="#tishimodal1" class="modaltrigger" onclick="dis(${all.id},${a.count})">重新审核</a></td>
                                    <td style="height: 100px;border: 1px dashed;"><a href="#headmodal" class="modaltrigger" onclick="video(${all.id})">查看</a></td>
                                    <td style="height: 100px;border: 1px dashed;"><a href="#tishimodal2" class="modaltrigger" onclick="disd(${all.id},${all.iswatched},${all.user_item.user_id})">删除</a></td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td></td>
                                <td style="height: 30px;">
                                    <c:if test="${allvideo.currentPage > 1}">
                                        <a href="${pageContext.request.contextPath}/video/DisAllVideo.do?page=${allvideo.currentPage-1}">
                                            <span style="font-weight: bold">上一页</span>
                                        </a>
                                    </c:if>
                                </td>
                                <span style="font-size: 15px;">当前第${allvideo.currentPage}页/总${allvideo.totalPage}页</span>
                                <td style="height: 30px;">
                                    <c:if test="${allvideo.currentPage < allvideo.totalPage}">
                                        <a href="${pageContext.request.contextPath}/video/DisAllVideo.do?page=${allvideo.currentPage+1}">
                                            <span style="font-weight: bold">下一页</span>
                                        </a>
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
    <video autoplay="autoplay" controls="controls" style="width: 420px;height: 220px;" id="video1">
        <source src="" type="video/mp4" id="sour"/>
    </video>
</div>
<div id="tishimodal1" style="display:none;">
    <p style="font-size: 16px;font-weight: bold;">审核是否通过</p><div style="display: none"><span id="vid1"></span><span id="vc1"></span></div>
    <input type="button" name="btn1" id="btn1" class="flatbtn-blu" value="通过" tabindex="1" onclick="UpdateIswatched()">
    &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="btn2" id="btn2" class="flatbtn-blu" value="不通过" tabindex="2" onclick="NotIswatched()">
</div>
<div id="tishimodal2" style="display:none;">
    <p style="font-size: 16px;font-weight: bold;" id="p1"></p><div style="display: none"><span id="vid2"></span><span id="uid2"></span></div>
    <input type="button" name="btn3" id="btn3" class="flatbtn-blu" value="确定" tabindex="1" onclick="deleteVideo()">
    &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="btn4" id="btn4" class="flatbtn-blu" value="取消" tabindex="2">
</div>
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.leanModal.min.js"></script>
<script type="text/javascript">
    function video(video_id){
        var sour = document.getElementById("sour");
        var video1 = document.getElementById("video1");
        $.ajax({
            url:"${pageContext.request.contextPath}/video/returnVideoById.do",
            async:false,
            type:"POST",
            data: "video_id="+video_id,
            success:function (data) {
                sour.src = "${pageContext.request.contextPath}/"+data;
                video1.load();
            },error:function (){
                alert("获取失败");
            },dataType:"text"
        })
    }

    function dis(video_id,i) {
        var vid = document.getElementById("vid1");
        var vc = document.getElementById("vc1");
        vid.innerHTML = video_id;
        vc.innerHTML = i-1;
    }

    function disd(video_id,iswatched,user_id) {
        var vid = document.getElementById("vid2");
        var uid = document.getElementById("uid2");
        var p = document.getElementById("p1");
        vid.innerHTML = video_id;
        uid.innerHTML = user_id;
        if (iswatched==1){
            p.innerHTML = "该视频已审核，你是否确定要删除？";
        } else if (iswatched==0) {
            p.innerHTML = "该视频未审核，你是否确定要删除？";
        }else if(iswatched==2){
            p.innerHTML = "该视频审核不通过，你是否确定要删除？";
        }else{
            p.innerHTML = "该视频已下架，你是否确定要删除？";
        }
    }

    function UpdateIswatched(){
        var video_id = document.getElementById("vid1").innerHTML;
        var i = document.getElementById("vc1").innerHTML;
        var iswatched = document.getElementsByClassName("iswatched")[i];
        $.ajax({
            url:"${pageContext.request.contextPath}/video/updateIswatched.do",
            async:false,
            type:"POST",
            data: "video_id="+video_id,
            success:function (data) {
                alert(data);
                iswatched.innerHTML = data;
            },error:function (){
                alert("审核失败");
            },dataType:"text"
        })
    }

    function NotIswatched(){
        var video_id = document.getElementById("vid1").innerHTML;
        var i = document.getElementById("vc1").innerHTML;
        var iswatched = document.getElementsByClassName("iswatched")[i];
        $.ajax({
            url:"${pageContext.request.contextPath}/video/notIswatched.do",
            async:false,
            type:"POST",
            data: "video_id="+video_id,
            success:function (data) {
                alert(data);
                iswatched.innerHTML = data;
            },error:function (){
                alert("审核失败");
            },dataType:"text"
        })
    }

    function deleteVideo() {
        var video_id = document.getElementById("vid2").innerHTML;
        var user_id = document.getElementById("uid2").innerHTML;
        location.href="${pageContext.request.contextPath}/video/deleteVideo.do?video_id="+video_id+"&user_id="+user_id;
    }

    function search() {
        var input = document.getElementById("search").value;
        if (input!=""){
            location.href="${pageContext.request.contextPath}/video/searchVideoAdmin.do?page=1&vname="+input;
        }
    }

    $(function(){
        //弹出层调用语句
        $('.modaltrigger').leanModal({
            top:110,
            overlay:0.45,
            closeButton:".flatbtn-blu",
            backdrop:'static',
            keyboard:false
        });
    });
</script>
</body>
</html>

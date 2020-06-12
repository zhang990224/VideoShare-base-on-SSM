<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/4/10
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>header</title>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon.png">

    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/night-mode.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/framework.css">
    <link rel="stylesheet" type="text/css" media="all" href="${pageContext.request.contextPath}/assets/css/style1.css">
    <!-- icons
    ================================================== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/icons.css">

    <!-- Google font
    ================================================== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

</head>
<style>
    .addinput {
        display: inline-block;
        width: 100%;
        height: 34px;
        padding: 6px 12px;
        font-size: 14px;
        line-height: 1.428571429;
        color: #555555;
        vertical-align: middle;
        background-color: #ffffff;
        border: 1px solid #cccccc;
        border-radius: 4px;
        -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        -webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
        transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    }
    .addinput:focus {
        border-color: #66afe9;
        outline: 0;
        -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, 0.6);
        box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, 0.6);
    }
    #helpmodal{
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
</style>
<script>
    function search() {
        var input = document.getElementById("inputsearch").value;
        if (input!=""){
            location.href="${pageContext.request.contextPath}/video/searchVideo.do?vname="+input;
        }
    }
    function upadateMsg(){
        var zt = document.getElementsByClassName("wei");
        var msgcount = document.getElementById("msgcount");
        $.ajax({
            url:"${pageContext.request.contextPath}/user/updateMsgById.do",
            async:true,
            type:"POST",
            data: "receivetype="+1,
            success:function (data) {
                alert(data);
                for(var i=0;i<zt.length;i++){
                    zt[i].style.color="grey";
                    zt[i].innerHTML="【已读】";
                }
                msgcount.innerHTML="0";
            },dataType:"text"
        });
    }

    function deleteAllMsg() {
        var ul = document.getElementById("ul1");
        $.ajax({
            url:"${pageContext.request.contextPath}/user/deleteMsgById.do",
            async:true,
            type:"POST",
            data: "receiver_id="+${user1.getId()},
            success:function (data) {
                alert(data);
                ul.style.display="none";
            },dataType:"text"
        });
    }

    function upadateAd(){
        var adcount = document.getElementById("adcount");
        $.ajax({
            url:"${pageContext.request.contextPath}/user/updateAdById.do",
            async:true,
            type:"POST",
            data: "iswatched="+1,
            success:function (data) {
                alert(data);
                adcount.innerHTML="0";
            },dataType:"text"
        });
    }

    function deleteAllAd() {
        var ul = document.getElementById("ul2");
        $.ajax({
            url:"${pageContext.request.contextPath}/user/deleteAdById.do",
            async:true,
            type:"POST",
            data: "receiver_id="+${user1.getId()},
            success:function (data) {
                alert(data);
                ul.style.display="none";
            },dataType:"text"
        });
    }

    function SureUpload() {
        var vname = document.getElementById("vname");
        var vnote = document.getElementById("note");
        var file = document.getElementById("upload");
        var form = document.getElementById("forma");
        var formData = new FormData();
        var tishi = document.getElementById("tishi");
        for (var i = 0;i<file.files.length;i++){
            formData.append("upload",file.files[i]);
        }
        if (vname.value!=""&vnote.value!=""&file.value!=""){
            $.ajax({
                url:"${pageContext.request.contextPath}/video/videoIsTrue.do",
                async:true,
                processData: false,   // jQuery不要去处理发送的数据
                contentType: false,   // jQuery不要去设置Content-Type请求头
                type:"POST",
                data: formData,
                success:function (data) {
                    if (data==1){
                        alert("上传成功,等待审核");
                        form.submit();
                    }else {
                        tishi.innerHTML="只允许上传一张图片和一个视频且要按照格式";
                    }
                },
                error:function () {
                    alert("上传失败");
                },
                dataType:"text"
            });

        } else{
            alert("上传内容不能有空喔");
        }

    }

    function onloadSession(){
        $.ajax({
            url:"${pageContext.request.contextPath}/user/onloadsession.do",
            async:true,
            type:"POST",
            data: "user_id="+${user1.getId()},
            success:function (data) {
            },error:function () {
                alert("实时更新失败");
            },dataType:"text"
        });
    }
</script>
<body onload="onloadSession()">

<!-- Wrapper -->
<div id="wrapper">

    <!-- sidebar -->
    <div class="main_sidebar">
        <div class="side-overlay" uk-toggle="target: #wrapper ; cls: collapse-sidebar mobile-visible"></div>

        <!-- sidebar header -->
        <div class="sidebar-header">
            <h4> Navigation</h4>
            <span class="btn-close" uk-toggle="target: #wrapper ; cls: collapse-sidebar mobile-visible"></span>
        </div>

        <!-- sidebar Menu -->
        <div class="sidebar">
            <div class="sidebar_innr" data-simplebar>

                <div class="sections">
                    <h3> Browse </h3>
                    <ul>
                        <li class="active"> <a href="${pageContext.request.contextPath}/video/index.do"> <i class="uil-home-alt"></i> Home </a></li>
                        <li> <a href="${pageContext.request.contextPath}/user/disRelationUserById.do?user_id=${user1.id}"> <i class="uil-users-alt"></i> Concerns </a></li>
                    </ul>
                </div>


                <div class="sections">
                    <h3> User </h3>
                    <ul>
                        <c:forEach items="${fourrelation}" var="relation">
                            <li> <a href="${pageContext.request.contextPath}/video/DisOtherUserById.do?user_id=${relation.userid}&page=1"> <img src="${pageContext.request.contextPath}/${relation.user_item.u_img}" alt="">
                                    ${relation.user_item.username}</a>
                            </li>
                        </c:forEach>
                    </ul>

                    <!-- view more subcription-->
                    <div class="uk-flex uk-flex-center mb-3">
                        <a href="${pageContext.request.contextPath}/user/disUserExpectMe.do?user_id=${user1.id}" class="button default circle px-5">
                            <i class="uil-plus mr-2"></i> More User</a>
                    </div>

                </div>

                <div class="sections">
                    <h3> PAGES </h3>
                    <ul>
                        <li> <a href="#"><i class="uil-user-circle"></i> Accounts </a>
                            <ul>
                                <li>
                                    <c:if test="${user1.getUsername() != null}">
                                        <a href="${pageContext.request.contextPath}/video/DisAllVideoById.do?page=1&user_id=${user1.getId()}"> MyAccount </a>
                                    </c:if>
                                    <c:if test="${user1.getUsername() == null}">
                                        <a href="${pageContext.request.contextPath}/login.jsp"> Login </a>
                                    </c:if>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <div id="foot">

                    <ul>
                        <li> <a href="#"> About Us </a></li>
                        <li> <a href="#"> Setting </a></li>
                        <li> <a href="#"> Privacy Policy </a></li>
                        <li> <a href="#"> Terms - Conditions </a></li>
                    </ul>


                    <div class="foot-content">
                        <p>© 2020 <strong>VideoShare</strong>. All Rights Reserved. </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- header -->
    <div id="main_header">
        <header>

            <!-- Logo-->
            <i class="header-traiger uil-bars"
               uk-toggle="target: #wrapper ; cls: collapse-sidebar mobile-visible"></i>

            <!-- Logo-->
            <div id="logo">
                <a href="#"> <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt=""></a>
                <a href="#"> <img src="${pageContext.request.contextPath}/assets/images/logo-light.png" class="logo-inverse" alt=""></a>
            </div>

            <!-- form search-->
            <div class="head_search">
                <form>
                    <div class="head_search_cont">
                        <input value="" type="text" class="form-control"
                               placeholder="Search for Videos, Users, Movies and more.." autocomplete="off" id="inputsearch">
                        <a href="#"><i class="s_icon uil-search-alt" onclick="search()"></i></a>
                    </div>

                    <!-- Search box dropdown -->
                    <div uk-dropdown="pos: top;mode:click;animation: uk-animation-slide-bottom-small"
                         class="dropdown-search">

                    </div>
                </form>
            </div>

            <!-- user icons -->
            <div class="head_user">

                <a href="#" class="btn-upgrade uk-visible@s"> <i class="uil-bolt-alt"></i> Pro</a>
                <a href="#" class="btn-upload uk-visible@s"> <i class="uil-cloud-upload"></i> Upload</a>

                <!-- upload dropdown box -->
                <div uk-dropdown="pos: top-right;mode:click ; animation: uk-animation-slide-bottom-small"
                     class="dropdown-notifications">

                    <!-- notivication header -->
                    <div class="dropdown-notifications-headline">
                        <h4>Upload Video</h4>
                    </div>

                    <!-- notification contents -->
                    <div class="dropdown-notifications-content uk-flex uk-flex-middle uk-flex-center text-center">


                        <div class="uk-flex uk-flex-column choose-upload  text-center">
                            <img src="${pageContext.request.contextPath}/assets/images/upload.png" width="70" class="m-auto" id="video_img" alt="">
                            <p class="my-3">分享你的视频（一张封面一个视频）<br> please upload it ..
                            </p>
                            <form id="forma" action="${pageContext.request.contextPath}/video/insertVideo.do" method="post" enctype="multipart/form-data">
                                <div>
                                    <span style="float: left;">视频名称：</span><input type="text" class="addinput" name="vname" id="vname"/>
                                </div>
                                <div>
                                    <span style="float: left;">视频介绍：</span><input type="text" class="addinput" name="note" id="note">
                                </div>
                                <div uk-form-custom>
                                    <input type="file" id="upload" name="upload" class="upload" multiple="multiple">
                                    <a href="#" class="button soft-warning small">Choose file</a>
                                </div>
                                &nbsp;&nbsp;&nbsp;
                                <input type="button" value="Sure Upload" onclick="SureUpload()" class="button soft-warning small">
                            </form>
                        </div>
                    </div>
                    <hr class="m-0">
                    <div class="text-center uk-text-small py-2 uk-text-muted"> Your Video size Must be Maxmium 999MB</div>
                    <hr class="m-0">
                    <div class="text-center uk-text-small py-2 uk-text-muted"> 图片允许上传格式：.bmp .jpg .jpeg .png</div>
                    <hr class="m-0">
                    <div class="text-center uk-text-small py-2 uk-text-muted"> 视频允许上传格式：.mp4 .avi .mpg</div>
                    <hr class="m-0"><div class="text-center uk-text-small py-2" id="tishi" style="color:red;"></div>
                </div>


                <!-- videos feed  -->
                <a href="#video" class="opts_icon" uk-toggle> <i class="uil-youtube-alt"></i>
                   <c:if test="${nowatch}!=null">
                       <span></span>
                   </c:if>
                </a>

                <!-- videos feed  offcanvas-->
                <div id="video" uk-offcanvas="overlay: true ;flip: true">
                    <div class="uk-offcanvas-bar uk-width-large">

                        <h3> 审核中的视频 </h3>
                        <hr class="mb-3" style="margin:0 -20px">
                        <button class="uk-offcanvas-close" type="button" uk-close></button>

                        <div class="video-list-small uk-child-width-1-1" uk-grid>
                            <c:forEach items="${nowatch}" var="no">
                                <div>
                                    <a href="#" class="video-post video-post-list">
                                        <!-- Blog Post Thumbnail -->
                                        <div class="video-post-thumbnail">
                                            <span class="video-post-time"></span>
                                            <span class="play-btn-trigger"></span>

                                            <img src="${pageContext.request.contextPath}/${no.getVimg()}" alt="">

                                        </div>

                                        <!-- Blog Post Content -->
                                        <div class="video-post-content">
                                            <h3> ${no.getVname()}</h3>
                                            <img src="${pageContext.request.contextPath}/${user1_item.getU_img()}" alt="">
                                            <span class="video-post-user">${user1.getUsername()}</span>
                                            <span class="video-post-date"> ${no.getCreatetime()} </span>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>

                    </div>
                </div>

                <!-- Message  notificiation dropdown -->
                <a href="#" class="opts_icon"> <i class="uil-envelope-alt"></i> <span id="msgcount">${msgcount}</span> </a>

                <!-- Message  notificiation dropdown -->
                <div uk-dropdown="pos: top-right;mode:click ; animation: uk-animation-slide-bottom-small"
                     class="dropdown-notifications">

                    <!-- notivication header -->
                    <div class="dropdown-notifications-headline">
                        <h4>Messages</h4>
                        <a href="#">
                            <i class="icon-feather-settings" uk-tooltip="title: Message settings ; pos: left"></i>
                        </a>
                    </div>

                    <!-- notification contents -->
                    <div class="dropdown-notifications-content" data-simplebar>

                        <!-- notiviation list -->
                        <ul id="ul1">
                            <c:forEach items="${messages}" var="msg">
                                <li class="notifications-not-read">
                                    <a href="">
                                        <span class="notification-avatar">
                                            <img src="${pageContext.request.contextPath}/${msg.getUser_item().getU_img()}" alt="">
                                        </span>
                                        <div class="notification-text notification-msg-text">
                                            <strong>${msg.getUser_item().getUsername()}</strong>
                                            <br>
                                            <p>${msg.getContent()}</p>
                                            <c:if test="${msg.getIswatched()==0}">
                                                <span style="color: #FF0000;" class="wei">【未读】</span>
                                            </c:if>
                                            <c:if test="${msg.getIswatched()==1}">
                                                <span style="color:grey;">【已读】</span>
                                            </c:if>
                                            <span class="time-ago">${msg.getCreatetime()}</span>
                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>

                    </div>
                    <div class="dropdown-notifications-footer">
                        <a href="#" onclick="upadateMsg()">全置已读</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" onclick="deleteAllMsg()"> 清空所有 <i class="icon-line-awesome-long-arrow-right"></i> </a>
                    </div>
                </div>


                <!-- notificiation icon  -->
                <a href="#" class="opts_icon"> <i class="uil-bell"></i> <span id="adcount">${adcount}</span> </a>

                <!-- notificiation dropdown -->
                <div uk-dropdown="pos: top-right;mode:click ; animation: uk-animation-slide-bottom-small"
                     class="dropdown-notifications">

                    <!-- notivication header -->
                    <div class="dropdown-notifications-headline">
                        <h4>Notifications </h4>
                        <a href="#">
                            <i class="icon-feather-settings"
                               uk-tooltip="title: Notifications settings ; pos: left"></i>
                        </a>
                    </div>

                    <!-- notification contents -->
                    <div class="dropdown-notifications-content" data-simplebar>
                        <!-- notiviation list -->
                        <ul id="ul2">
                            <c:forEach items="${advises}" var="ad">
                                <li class="notifications-not-read">
                                    <a href="#">
                                        <span class="notification-text">
                                            <strong>${ad.getContent()}</strong>
                                            <%--<span class="text-primary">Learn Prototype Faster</span>--%>
                                            <br> <span class="time-ago"> ${ad.getCreatetime()} </span>
                                        </span>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="dropdown-notifications-footer">
                        <a href="#" onclick="upadateAd()">全置已读</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" onclick="deleteAllAd()"> 清空所有 <i class="icon-line-awesome-long-arrow-right"></i></a>
                    </div>
                </div>

                <!-- profile -image -->
                <a class="opts_account"> <img src="${pageContext.request.contextPath}/assets/images/avatars/avatar-1.jpg" alt=""></a>

                <!-- profile dropdown-->
                <div uk-dropdown="pos: top-right;mode:click ; animation: uk-animation-slide-bottom-small"
                     class="dropdown-notifications small">

                    <!-- User Name / Avatar -->
                    <a href="#">
                        <div class="dropdown-user-details">
                            <div class="dropdown-user-avatar">
                                <c:if test="${user1.getUsername() != null}">
                                    <img src="${pageContext.request.contextPath}/${user1_item.getU_img()}" alt="">
                                </c:if>
                                <c:if test="${user1.getUsername() == null}">
                                    <img src="${pageContext.request.contextPath}/assets/images/avatars/avatar-1.jpg" alt="">
                                </c:if>
                            </div>
                            <div class="dropdown-user-name">
                                <c:if test="${user1.getUsername() == null}">
                                    未登陆
                                </c:if>${user1.getUsername()}<span>  <i class="uil-check"></i> </span>
                            </div>
                        </div>
                    </a>

                    <!-- User menu -->

                    <ul class="dropdown-user-menu">
                        <li>
                            <a href="#" id="night-mode" class="btn-night-mode">
                                <i class="icon-feather-moon"></i> Night mode
                                <span class="btn-night-mode-switch">
                                        <span class="uk-switch-button"></span>
                                    </span>
                            </a>
                        </li>
                        <li class="menu-divider">
                        <li><a href="#helpmodal" class="modaltrigger"> <i class="icon-feather-help-circle"></i> Help</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/user/signout.do"> <i class="icon-feather-log-out"></i> Sing Out</a>
                        </li>
                    </ul>

                </div>
            </div>

        </header>
    </div>
</div>
<div id="helpmodal" style="display:none;">
    <h5>反馈对象:官方</h5>
    <h5>反馈内容:</h5>
    <textarea class="uk-textarea" placeholder="Enter Your Messgae..."style=" height:120px" id="helpmessage"></textarea>
    <h4>联系方式：</h4>
    <input type="text" class="addinput" name="contact" id="contact" placeholder="email、qq、vx、phone..."/>
    <a href="#" class="reply" onclick="help()"><i class="icon-line-awesome-undo"></i>Send</a>
</div>
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.leanModal.min.js"></script>
<script type="text/javascript">
    $(function(){
        //弹出层调用语句
        $('.modaltrigger').leanModal({
            top:110,
            overlay:0.45,
            //closeButton:"#quxiao",
            backdrop:'static',
            keyboard:false
        });
    });

    function help() {
        var helpmessage = document.getElementById("helpmessage");
        var contact = document.getElementById("contact");
        if (helpmessage.value!="" && contact.value!=""){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/insertFeedBack.do",
                async:true,
                type:"POST",
                data: {"content":helpmessage.value,"contact":contact.value},
                success:function (data) {
                    alert(data);
                    helpmessage.value = "";
                    contact.value = "";
                },
                error:function () {
                    alert("发送失败");
                },
                dataType:"text"
            });
        } else{
            alert("填写的信息不能有空哟");
        }
    }
</script>
</body>
</html>

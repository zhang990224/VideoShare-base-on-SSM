<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/4/26
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
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
                    <li class="nav-li-1  active"><a href="${pageContext.request.contextPath}/admin_index.jsp"><i class="glyphicon glyphicon-home" title="首页"></i><span class="nav-title">首&nbsp;&nbsp;&nbsp;&nbsp;页 </span></a></li>
                    <li class="nav-li-5"><a href="${pageContext.request.contextPath}/user/disAllUser.do?page=1"><i class="glyphicon glyphicon-user" title="用户"></i><span class="nav-title">用&nbsp;&nbsp;&nbsp;&nbsp;户 </span></a></li>
                    <li class="nav-li-12"><a href="${pageContext.request.contextPath}/video/DisCommentA.do?page=1"><i class="glyphicon glyphicon-edit" title="评论"></i><span class="nav-title">评&nbsp;&nbsp;&nbsp;&nbsp;论 </span></a></li>
                    <li class="nav-li-16"><a href="${pageContext.request.contextPath}/video/DisAllVideo.do?page=1"><i class="glyphicon glyphicon-play-circle" title="视频"></i><span class="nav-title">视&nbsp;&nbsp;&nbsp;&nbsp;频 </span></a></li>
                    <li class="nav-li-13"><a href="${pageContext.request.contextPath}/user/disAllFeedBack.do?page=1"><i class="glyphicon glyphicon-envelope" title="反馈"></i><span class="nav-title">反&nbsp;&nbsp;&nbsp;&nbsp;馈 </span></a></li>
                </ul>
            </div>
        </div>

    </div>
    <div id="content" class="no-sidebar">
        <div class="inner_content">
            <div class="user_iframe">
                <div>
                    <h2>欢迎来到VideoShare后台管理系统</h2>
                    <br>
                    <div style="font-size: 18px;">
                        <%
                        Date d = new Date();
                        String s = d.toString();
                        %>
                        现在的时间是：<%=s %></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="right-sidebar-toggle">
    <i class="fa-spin glyphicon glyphicon-backward"></i>
</div>
</div>
</body>
</html>

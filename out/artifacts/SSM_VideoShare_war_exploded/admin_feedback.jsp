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
    #headmodal,#sendmodal,#tishimodal1{
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
                    <li class="nav-li-16"><a href="${pageContext.request.contextPath}/video/DisAllVideo.do?page=1"><i class="glyphicon glyphicon-play-circle" title="视频"></i><span class="nav-title">视&nbsp;&nbsp;&nbsp;&nbsp;频 </span></a></li>
                    <li class="nav-li-13 active"><a href="${pageContext.request.contextPath}/user/disAllFeedBack.do?page=1"><i class="glyphicon glyphicon-envelope" title="反馈"></i><span class="nav-title">反&nbsp;&nbsp;&nbsp;&nbsp;馈 </span></a></li>
                </ul>
            </div>
        </div>

    </div>
    <div id="content" class="no-sidebar">
        <div class="inner_content">
            <div style="margin-top: 5px;">
                <span style="font-size: 15px;font-weight: bold;margin-right: 10px;"><strong>${feedbacknum}</strong> 条反馈信息</span>
                <span style="font-size: 16px;font-weight: bold;margin-right: 10px;"><a href="${pageContext.request.contextPath}/user/disAllFeedBackWatched.do?iswatched=0&page=1">查看未读</a></span>
                <span style="font-size: 16px;font-weight: bold;margin-right: 10px;"><a href="${pageContext.request.contextPath}/user/disAllFeedBackWatched.do?iswatched=1&page=1">查看已读</a></span>
                <span style="font-size: 16px;font-weight: bold;margin-right: 10px;"><a href="${pageContext.request.contextPath}/user/disAllFeedBackWatched.do?iswatched=2&page=1">查看已回复</a></span>
            </div>
            <div class="user_iframe">
                    <div>
                        <table style="text-align: center;" >
                            <tr>
                                <th style="width: 50px;">序号</th>
                                <th style="width: 120px;">用户名称</th>
                                <th style="width: 150px;">联系方式</th>
                                <th style="width: 120px;">创建时间</th>
                                <th style="width: 80px;">是否已读</th>
                                <th style="width: 100px;">操作1</th>
                                <th style="width: 80px;">操作2</th>
                            </tr>
                            <c:forEach items="${allfeedback.list}" var="all" varStatus="a">
                                <tr>
                                    <td style="height: 100px;border: 1px dashed;">${a.count+(allfeedback.currentPage-1)*5}</td>
                                    <td style="height: 100px;border: 1px dashed;">${all.uname}</td>
                                    <td style="height: 100px;border: 1px dashed;">${all.contact}</td>
                                    <td style="height: 100px;border: 1px dashed;">${all.createtime}</td>
                                    <td style="height: 100px;border: 1px dashed;width: 100px;" class="iswatched">
                                        <c:if test="${all.iswatched==0}">未读</c:if>
                                        <c:if test="${all.iswatched==1}">已读</c:if>
                                        <c:if test="${all.iswatched==2}">已回复</c:if>
                                    </td>
                                    <td style="height: 100px;border: 1px dashed;"><a href="#headmodal" class="modaltrigger" onclick="feedbackcontent(${all.id},${all.uid},'${all.content}','${all.uname}',${a.count})">查看内容</a></td>
                                    <td style="height: 100px;border: 1px dashed;" ><a href="#tishimodal1" class="modaltrigger" onclick="disdd(${all.id})">删除</a></td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td></td>
                                <td style="height: 30px;">
                                    <c:if test="${allfeedback.currentPage > 1}">
                                        <a href="${pageContext.request.contextPath}/user/disAllFeedBack.do?page=${allfeedback.currentPage-1}">上一页</a>
                                    </c:if>
                                </td>
                                <span style="font-size: 15px;">当前第${allfeedback.currentPage}页/总${allfeedback.totalPage}页</span>
                                <td style="height: 30px;">
                                    <c:if test="${allfeedback.currentPage < allfeedback.totalPage}">
                                        <a href="${pageContext.request.contextPath}/user/disAllFeedBack.do?page=${allfeedback.currentPage+1}">下一页</a>
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
    <h4>反馈内容</h4>
    <div style="font-size: 14px;">
        <span style="display: none" id="uid"></span>
        <span style="display: none" id="fid"></span>
        <span style="display: none" id="i"></span>
        <span id="feedcontent"></span>
        <br>
        <a href="#sendmodal" class="modaltrigger">回复</a>
    </div>
</div>
<div id="sendmodal" style="display:none;">
    <form id="headform" name="headform" method="post" action="">
        <h5>回复对象:<span id="un1"></span></h5>
        <h5>回复内容:</h5>
        <textarea class="uk-textarea" placeholder="Enter Your Messgae..." style=" height:120px" id="advisetext"></textarea>
        <a href="#" class="reply" onclick="sendAdvise()"><i class="icon-line-awesome-undo"></i>Send</a>
    </form>
</div>
<div id="tishimodal1" style="display:none;">
    <p style="font-size: 16px;font-weight: bold;" id="p1">是否确定要删除此信息</p><div style="display: none"><span id="vid1"></span><span id="uid1"></span></div>
    <input type="button" name="btn3" id="btn3" class="flatbtn-blu" value="确定" tabindex="1" onclick="deleteFeedBack()">
    &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="btn4" id="btn4" class="flatbtn-blu" value="取消" tabindex="2">
</div>
</body>
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.leanModal.min.js"></script>
<script type="text/javascript">
    function feedbackcontent(fid,uid,content,uname,i){
        var uid1 = document.getElementById("uid");
        var fid1 = document.getElementById("fid");
        var feedcontent = document.getElementById("feedcontent");
        var un1 = document.getElementById("un1");
        var ii = document.getElementById("i");
        var iswatched = document.getElementsByClassName("iswatched")[i-1];
        fid1.innerHTML = fid;
        uid1.innerHTML = uid;
        feedcontent.innerHTML = content;
        un1.innerHTML = uname;
        ii.innerHTML = i-1;
        $.ajax({
            url:"${pageContext.request.contextPath}/user/updateFeedBack.do",
            async:false,
            data:{"id":fid,"caozuo":1},
            type:"POST",
            success:function (data){
                iswatched.innerHTML = "已读";
            },
            error:function () {
                alert("获取失败");
            },dataType:"text"
        });
    }

    function updateFB() {
        var fid1 = document.getElementById("fid");
        var i = document.getElementById("i").innerHTML;
        var iswatched = document.getElementsByClassName("iswatched")[i];
        $.ajax({
            url:"${pageContext.request.contextPath}/user/updateFeedBack.do",
            async:false,
            data:{"id":fid1.innerHTML,"caozuo":2},
            type:"POST",
            success:function (data){
                iswatched.innerHTML = "已回复";
            },
            error:function () {
                alert("获取失败");
            },dataType:"text"
        });
    }

    function sendAdvise(){
        var u1 = document.getElementById("uid").innerHTML;
        var advisetext = document.getElementById("advisetext").value;
        if (advisetext!=""){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/sendAdvise.do",
                async:false,
                data:{"user_id":u1,"advise":advisetext},
                type:"POST",
                success:function (data){
                    alert(data);
                    advisetext = "";
                    updateFB();
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
            location.href="${pageContext.request.contextPath}/video/searchCommentAdmin.do?page=1&username="+input;
        }
    }

    function disdd(id) {
        var fid = document.getElementById("fid");
        fid.innerHTML = id;
    }

    function deleteFeedBack(){
        var fid = document.getElementById("fid").innerHTML;
        location.href="${pageContext.request.contextPath}/user/deleteFeedBack.do?id="+fid;
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
</html>

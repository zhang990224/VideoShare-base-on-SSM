<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/4/11
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    #collect{cursor: pointer;}
</style>
<head>
    <!-- Basic Page Needs
        ================================================== -->
    <title>GoTube Streaming Video HTML Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="GoTube is - Professional A unique and beautiful collection of UI elements">
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon.png">

    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/night-mode.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/framework.css">

    <!-- icons
    ================================================== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/icons.css">

    <!-- Google font
    ================================================== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
    function IsCollect() {
        var collect = document.getElementById("collect");
        $.ajax({
            url:"${pageContext.request.contextPath}/video/vcollect.do",
            async:true,
            type:"POST",
            data: "video_id="+${video.id},
            success:function (data) {
                if (data=="1") {
                    collect.innerHTML = "★ 已收藏";
                }else{
                    collect.innerHTML = "☆ 可收藏";
                }
            },
            error:function () {
                alert("请求失败");
            },
            dataType:"text"
        });
    }

    function UpdateCollect() {
        var collect = document.getElementById("collect");
        var collected = document.getElementById("collected");
        if (collect.innerHTML=="★ 已收藏") {
            var c = 0;
        }else{
            var c = 1;
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/video/czcollect.do",
            async:true,
            type:"POST",
            data: {"video_id": ${video.id}, "c": c},
            success:function (data) {
                if (data.split(",")[0]=="1") {
                    collect.innerHTML = "★ 已收藏";
                    collected.innerHTML = data.split(",")[1];
                }else{
                    collect.innerHTML = "☆ 可收藏";
                    collected.innerHTML = data.split(",")[1];
                }
            },
            error:function () {
                alert("请求失败");
            },
            dataType:"text"
        });
    }

    function newline(){
        var taVal = document.getElementById('comment').value;
        if(taVal != null && taVal.length > 0){
            var len = Number(taVal.length);
            if(len%15 == 0) {
                document.getElementById('comment').value = document.getElementById('comment').value + "\n";
            }
        }
    }

    function subcomment(){
        var comment = document.getElementById("commenttext").value;
        if (comment!=""){
            location.href="${pageContext.request.contextPath}/video/addComment.do?video_id=${video.id}&v_comment="+comment;
        }
    }

    window.onload = function () {
        IsCollect();
        newline();
    }
</script>
<body>
<jsp:include page="header.jsp" />
<!-- contents -->
<div class="main_content content-expand">
    <div class="main_content_inner">


        <div uk-grid>
            <div class="uk-width-2-3@m">

                <div id="video-box" uk-sticky="top: 400 ;media : @s"
                     cls-active="video-resized uk-animation-slide-right;">
                            <span class="icon-feather-x btn-box-close"
                                  uk-toggle="target: #video-box ; cls: video-resized-hedden uk-animation-slide-left"></span>

                    <div class="embed-video">
                        <video autoplay="autoplay" controls="controls" style="width: 805px;height: 450px;">
                            <source src="${pageContext.request.contextPath}/${video.vsrc}" type="video/mp4" />
                        </video>
                    </div>
                </div>

                <div class="video-info mt-3">

                    <!-- video title -->
                    <div class="video-info-title">
                        <h1> ${video.vname} </h1>
                    </div>

                    <div class="uk-flex uk-flex-between">

                        <div class="video-info-details">
                            <span>${video.watched} watched</span>&nbsp;&nbsp;&nbsp;
                            <span id="collected">${video.collected}</span>&nbsp;collected
                        </div>
                        <div id="collect" onclick="UpdateCollect()"></div>

                    </div>


                    <div class="uk-flex uk-flex-between uk-flex-middle" uk-grid>
                        <div class="user-details-card uk-width-expand">
                            <a href="" class="uk-flex">
                                <div class="user-details-card-avatar">
                                    <a href="${pageContext.request.contextPath}/video/DisOtherUserById.do?user_id=${video.user_item.user_id}&page=1">
                                    <img src="${pageContext.request.contextPath}/${video.user_item.u_img}" alt="">
                                    </a>
                                </div>
                                <div class="user-details-card-name">
                                    ${video.user_item.username} <span> Published on ${video.createtime} </span>
                                </div>
                            </a>
                        </div>
                    </div>

                    <hr class="mt-0 mb-2">


                    <h2> Description</h2>
                    <p>${video.vnote}</p>
                    </div>

                <hr>

                <div class="comments mt-4">
                    <h3> Comments <span class="comments-amount">（${commentnum}）</span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#headmodal" id="modaltrigger" class="reply"><i class="icon-line-awesome-undo"></i>
                            Comment It</a>
                    </h3>
                    <c:if test="${commentnum==0}">
                        <h2>还没有评论喔，抢个沙发可不？</h2>
                    </c:if>
                    <ul>
                        <c:forEach items="${comments}" var="co">
                            <li>
                                <div class="avatar"><img src="${pageContext.request.contextPath}/${co.user_item.u_img}" alt="">
                                </div>
                                <div class="comment-content">
                                    <div class="comment-by">
                                            ${co.user_item.username}
                                        <c:if test="${co.user_id==user1.getId()}">
                                            （我）
                                        </c:if>
                                    </div>
                                    <p> ${co.v_comment} </p>
                                </div><div style="margin-right: 100px;">${co.v_createtime}</div>
                                <div>
                                    <c:if test="${co.user_id==user1.getId()}">
                                        <a href="${pageContext.request.contextPath}/video/deleteComment.do?people=0&video_id=${video.id}&user_id=${co.user_id}">删除</a>
                                    </c:if>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"/>
</div>


<div id="headmodal" style="display:none;">
    <form id="headform" name="headform" method="post" action="">
        <h3>评论内容:</h3>
        <textarea class="uk-textarea" placeholder="Enter Your Comments her..." style=" height:100px" id="commenttext"></textarea>
        <a href="#" class="reply" onclick="subcomment()"><i class="icon-line-awesome-undo"></i>Comment</a>
    </form>
</div>

<!-- For Night mode -->
<script>
    (function (window, document, undefined) {
        'use strict';
        if (!('localStorage' in window)) return;
        var nightMode = localStorage.getItem('gmtNightMode');
        if (nightMode) {
            document.documentElement.className += ' night-mode';
        }
    })(window, document);


    (function (window, document, undefined) {

        'use strict';

        // Feature test
        if (!('localStorage' in window)) return;

        // Get our newly insert toggle
        var nightMode = document.querySelector('#night-mode');
        if (!nightMode) return;

        // When clicked, toggle night mode on or off
        nightMode.addEventListener('click', function (event) {
            event.preventDefault();
            document.documentElement.classList.toggle('night-mode');
            if (document.documentElement.classList.contains('night-mode')) {
                localStorage.setItem('gmtNightMode', true);
                return;
            }
            localStorage.removeItem('gmtNightMode');
        }, false);

    })(window, document);

</script>

<script src="${pageContext.request.contextPath}/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.leanModal.min.js"></script>
<script type="text/javascript">
    $(function(){
        //弹出层调用语句
        $('#modaltrigger').leanModal({
            top:110,
            overlay:0.45,
            // closeButton:".hidemodal",
            backdrop:'static',
            keyboard:false
        });
    });
</script>

<!-- javaScripts
            ================================================== -->
<script src="${pageContext.request.contextPath}/assets/js/framework.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/simplebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>
</html>

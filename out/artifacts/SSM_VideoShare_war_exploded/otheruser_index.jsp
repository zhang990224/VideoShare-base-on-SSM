<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/4/9
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
<body>
<jsp:include page="header.jsp" />
<!-- contents -->
<div class="main_content">

    <div class="channal">
        <div class="channal-cover">

            <!-- channal cover -->
            <img src="${pageContext.request.contextPath}/assets/images/channnal-cover.jpg" alt="">

        </div>

        <div class="main_content_inner">
            <div class="channal-details">
                <div class="left-side">
                    <div class="channal-image">
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/${otheruser.u_img}" alt="">
                        </a>
                    </div>
                    <div class="channal-details-info">
                        <h3> ${otheruser.username} </h3>
                        <p> ${otheruser.fans} Fans</p>
                    </div>
                </div>
                <div class="right-side">
                    <div class="btn-subscribe">
                        <c:if test="${isFans==0}">
                            <a href="${pageContext.request.contextPath}/video/caozuoRelation.do?user_id=${otheruser.user_id}&c=1" class="button soft-warning">
                                <i class="icon-feather-plus"></i> 点击关注
                            </a>
                        </c:if>
                        <c:if test="${isFans==1}">
                            <a href="${pageContext.request.contextPath}/video/caozuoRelation.do?user_id=${otheruser.user_id}&c=0" class="button soft-warning">
                                <i class="icon-feather-minus"></i> 取消关注
                            </a>
                        </c:if>
                        <span class="subs-amount">${otheruser.fans}</span>
                        <a href="#headmodal" id="modaltrigger"> <i class="uil-envelope-alt"></i> <span>私信</span> </a>
                    </div>
                </div>
            </div>

            <div class="nav-channal" k-sticky="offset:61;media : @s">
                <nav class="responsive-tab">
                    <ul>
                        <li class="uk-active"><a class="active" href="#0">Home</a></li>
                    </ul>
                </nav>
            </div>
        </div>


    </div>

    <div class="main_content_inner">


        <!-- feature video-->
        <div class="uk-grid-large" uk-grid>
            <div class="uk-width-3-4@m">

                <h3> Feature Videos </h3>

                <div class="uk-card uk-grid-collapse uk-child-width-1-2@s uk-margin" uk-grid>
                    <div class="uk-card-media-left uk-cover-container">


                        <div class="embed-video">
                            <video autoplay="autoplay" controls="controls" style="width: 418px;height: 235px;">
                                <source src="${pageContext.request.contextPath}/${povideo.vsrc}" type="video/mp4" />
                            </video>
                        </div>

                        <!--  Single image
                            <img src="${pageContext.request.contextPath}/assets/images/photo2.jpg" alt="" uk-cover>
                            <canvas width="600" height="350"></canvas> -->

                    </div>
                    <div>
                        <div class="pl-lg-5 mt-sm-3">
                            <h3 class="uk-card-title"> Introduce </h3>
                            <p>${otheruser.introduce}</p>
                        </div>
                    </div>
                </div>

            </div>
            <div class="uk-width-expand">

                <h5> Stats </h5>
                <ul class="uk-list">
                    <li> Joined ${otheruser.birthday} </li>
                    <li> ${otheruser.concern} concerns </li>
                    <li> ${otheruser.fans} fans </li>
                    <li> ${otheruser.v_num} videos</li>
                </ul>

            </div>
        </div>

        <div class="section-small">
            <h3> Latest Video uplaods </h3>

            <div class="video-grid-slider" uk-slider="finite: true">
                <ul class="uk-slider-items uk-child-width-1-4@m uk-child-width-1-3@s uk-grid">
                    <c:forEach items="${reuservideo}" var="revideo">
                        <li>
                            <a href="${pageContext.request.contextPath}/video/DisVideoById.do?id=${revideo.id}" class="video-post">
                                <!-- Blog Post Thumbnail -->
                                <div class="video-post-thumbnail">
                                    <span class="video-post-count">${revideo.watched}</span>
                                    <span class="video-post-time"></span>
                                    <span class="play-btn-trigger"></span>
                                    <!-- option menu -->
                                    <span class="btn-option">
                                            <i class="icon-feather-more-vertical"></i>
                                        </span>
                                    <div class="dropdown-option-nav"
                                         uk-dropdown="pos: bottom-right ;mode : hover ;animation: uk-animation-slide-bottom-small">
                                        <ul>
                                            <li>
                                                <span> <i class="uil-history"></i> Watch Later</span>
                                            </li>
                                            <li>
                                                <span> <i class="uil-bookmark"></i> Add Bookmark</span>
                                            </li>
                                            <li>
                                                <span> <i class="uil-share-alt"></i> Share Your Friends</span>
                                            </li>
                                        </ul>
                                    </div>
                                    <img src="${pageContext.request.contextPath}/${revideo.vimg}" alt="">                                </div>
                                <!-- Blog Post Content -->
                                <div class="video-post-content">
                                    <h3> ${revideo.vname}</h3>
                                    <img src="${pageContext.request.contextPath}/${otheruser.u_img}" alt="">
                                    <span class="video-post-user">${otheruser.username}</span>
                                        <%--<span class="video-post-views">531k views</span>--%>
                                    <span class="video-post-date"> ${revideo.createtime} </span>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                </ul>

                <a class="uk-position-center-left uk-position-small uk-hidden-hover slidenav-prev" href="#"
                   uk-slider-item="previous"></a>
                <a class="uk-position-center-right uk-position-small uk-hidden-hover slidenav-next" href="#"
                   uk-slider-item="next"></a>

            </div>
            <c:if test="${otheruser.v_num==0}"><h3>该用户近期没有发布视频</h3></c:if>
        </div>

        <div class="section-small">

            <h3> All Videos </h3>

            <div class="uk-child-width-1-4@m mb-11" uk-grid
                 uk-scrollspy="target: > div; cls: uk-animation-slide-bottom-small; delay: 100">
                <c:forEach items="${uservideo.list}" var="video">
                    <div>
                        <a href="${pageContext.request.contextPath}/video/DisVideoById.do?id=${video.id}" class="video-post">
                            <!-- Blog Post Thumbnail -->
                            <div class="video-post-thumbnail">
                                <span class="video-post-count">${video.watched}</span>
                                <span class="video-post-time"></span>
                                <span class="play-btn-trigger"></span>
                                <!-- option menu -->
                                <span class="btn-option">
                                        <i class="icon-feather-more-vertical"></i>
                                    </span>
                                <div class="dropdown-option-nav"
                                     uk-dropdown="pos: bottom-right ;mode : hover ;animation: uk-animation-slide-bottom-small">
                                    <ul>
                                        <li>
                                            <span> <i class="uil-history"></i> Watch Later</span>
                                        </li>
                                        <li>
                                            <span> <i class="uil-bookmark"></i> Add Bookmark</span>
                                        </li>
                                        <li>
                                            <span> <i class="uil-share-alt"></i> Share Your Friends</span>
                                        </li>
                                    </ul>
                                </div>

                                <img src="${pageContext.request.contextPath}/${video.vimg}" alt="">

                            </div>

                            <!-- Blog Post Content -->
                            <div class="video-post-content">
                                <h3> ${video.vname}</h3>
                                <img src="${pageContext.request.contextPath}/${otheruser.u_img}" alt="">
                                <span class="video-post-user">${otheruser.username}</span>
                                    <%--<span class="video-post-views">531k views</span>--%>
                                <span class="video-post-date"> ${video.createtime} </span>
                            </div>
                        </a>
                    </div>
                </c:forEach>
                <c:if test="${otheruser.v_num==0}"><h3>该用户还没有发布视频</h3></c:if>
            </div>
            <div>
                <ul class="uk-pagination my-5 uk-flex-center" uk-margin>
                    <c:if test="${uservideo.currentPage>1}">
                        <li><span uk-pagination-next><a href="${pageContext.request.contextPath}/video/DisOtherUserById.do?page=${uservideo.currentPage-1}&user_id=${otheruser.user_id}">上一页</a></span></li>
                    </c:if>
                    <li class="uk-disabled">
                        <span>当前第${uservideo.currentPage}页/总${uservideo.totalPage}页</span>
                    </li>
                    <c:if test="${uservideo.currentPage < uservideo.totalPage}">
                        <li><span uk-pagination-next><a href="${pageContext.request.contextPath}/video/DisOtherUserById.do?page=${uservideo.currentPage+1}&user_id=${otheruser.user_id}">下一页</a></span></li>
                    </c:if>
                </ul>
            </div>

            <jsp:include page="footer.jsp"/>

        </div>
    </div>

</div>
<div id="headmodal" style="display:none;">
    <form id="headform" name="headform" method="post" action="">
        <h5>私信对象:${otheruser.username}</h5>
        <h5>私信内容:</h5>
        <textarea class="uk-textarea" placeholder="Enter Your Messgae..." style=" height:120px" id="messagetext"></textarea>
        <a href="#" class="reply" onclick="SendMessage()"><i class="icon-line-awesome-undo"></i>Send</a>
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

    function SendMessage() {
        var content = document.getElementById("messagetext");
        if (content.value!=""){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/sendMessage.do",
                async:true,
                type:"POST",
                data: {"send_id":${user1.getId()},"receive_id":${otheruser.user_id},"content":content.value,"sendtype":1,"receivetype":1},
                success:function (data) {
                    alert(data);
                    content.value="";
                },
                error:function () {
                    alert("发送失败!");
                },
                dataType:"text"
            });
        } else{
            alert("内容不能为空哟");
        }
    }
</script>

<!-- javaScripts
            ================================================== -->
<script src="${pageContext.request.contextPath}/assets/js/framework.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/simplebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>
</html>

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
            <div class="channal-details">'
                <div class="left-side">
                    <div class="channal-image">
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/${user1_item.getU_img()}" alt="">
                        </a>
                    </div>
                    <div class="channal-details-info">
                        <h3> ${user1.getUsername()} </h3>
                        <p> ${user1_item.getFans()} Fans</p>
                    </div>
                </div>
            </div>

            <div class="nav-channal" k-sticky="offset:61;media : @s">
                <nav class="responsive-tab">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/video/DisAllVideoById.do?page=1&user_id=${user1.getId()}">Home</a></li>
                        <li class="uk-active"><a  class="active" href="${pageContext.request.contextPath}/video/DisCollectVideoById.do">Collects</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/disRelationUserById.do?user_id=${user1.id}">Concerns</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/disRelationUserFById.do?user_id=${user1.id}">Fans</a></li>
                        <li><a href="#0">About</a></li>
                    </ul>
                </nav>
                <form class="nav-channal-saerchbox">
                    <i class="uil-search"></i>
                    <input class="uk-input" type="text" value="Search Video...">
                </form>
            </div>
        </div>
    </div>
            <h3 style="margin: 15px;"> Your Collect Videos </h3>

            <div class="uk-child-width-1-4@m mb-11" uk-grid
                 uk-scrollspy="target: > div; cls: uk-animation-slide-bottom-small; delay: 100">
                <c:forEach items="${video}" var="video">
                    <div>
                        <c:if test="${video.video.iswatched!=3}">
                            <a href="${pageContext.request.contextPath}/video/DisVideoById.do?id=${video.video_id}" class="video-post">
                        </c:if>
                        <c:if test="${video.video.iswatched==3}">
                            <a href="${pageContext.request.contextPath}/404.jsp" class="video-post">
                        </c:if>
                            <!-- Blog Post Thumbnail -->
                            <div class="video-post-thumbnail">
                                <span class="video-post-count">
                                    <c:if test="${video.video.iswatched!=3}">
                                        ${video.video.watched}
                                    </c:if>
                                    <c:if test="${video.video.iswatched==3}">
                                        0
                                    </c:if>
                                </span>
                                <span class="video-post-time"></span>
                                <span class="play-btn-trigger"></span>
                                <!-- option menu -->
                                <span class="btn-option">
                                        <i class="icon-feather-more-vertical"></i>
                                    </span>
                                <div class="dropdown-option-nav"
                                     uk-dropdown="pos: bottom-right ;mode : hover ;animation: uk-animation-slide-bottom-small">
                                    <ul>
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
                                    </ul>
                                </div>

                                <c:if test="${video.video.iswatched!=3}">
                                    <img src="${pageContext.request.contextPath}/${video.video.vimg}" alt="">
                                </c:if>
                                <c:if test="${video.video.iswatched==3}">
                                    <img src="" alt="">
                                </c:if>
                            </div>

                            <!-- Blog Post Content -->
                            <div class="video-post-content">
                                <c:if test="${video.video.iswatched!=3}">
                                    <h3> ${video.video.vname}</h3>
                                    <img src="${pageContext.request.contextPath}/${video.video.user_item.u_img}" alt="">
                                    <span class="video-post-user">${video.video.user_item.username}</span>
                                    <%--<span class="video-post-views">531k views</span>--%>
                                    <span class="video-post-date"> ${video.video.createtime} </span>
                                </c:if>
                                <c:if test="${video.video.iswatched==3}">
                                    <h3> </h3>
                                    <img src="" alt="">
                                    <span class="video-post-user"></span>
                                    <%--<span class="video-post-views">531k views</span>--%>
                                    <span class="video-post-date"></span>
                                </c:if>
                            </div>
                            <div>
                                <a href="${pageContext.request.contextPath}/video/cannelcollect.do?video_id=${video.video_id}">取消收藏</a>
                            </div>
                        </a>
                    </div>
                </c:forEach>
                <c:if test="${user1_item.getC_num()==0}"><h3>你还没有收藏视频喔，赶紧去寻找你喜欢的视频吧！</h3></c:if>
            </div>
        <jsp:include page="footer.jsp"/>
        </div>
    </div>

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


<!-- javaScripts
            ================================================== -->
<script src="${pageContext.request.contextPath}/assets/js/framework.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/simplebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>
</html>

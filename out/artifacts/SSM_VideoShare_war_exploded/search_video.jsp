<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/4/9
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

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

</head>

<body>

<!-- Wrapper -->
<jsp:include page="header.jsp" />
    <!-- contents -->
    <div class="main_content">
        <div class="main_content_inner">

            <h3>视频（${videonum}）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/video/searchUser.do">用户（${usernum}）</a>  </h3>
            <br>
            <c:if test="${videonum==0}">
                <h2>不好意思，你搜索的内容为空</h2>
            </c:if>
            <div class="sections-small">
                <div class="uk-child-width-1-4@m uk-child-width-1-2@s" uk-grid>
                    <c:forEach items="${searchvideo}" var="search">
                        <li>
                            <a href="${pageContext.request.contextPath}/video/DisVideoById.do?id=${search.id}" class="video-post">
                                <!-- Blog Post Thumbnail -->
                                <div class="video-post-thumbnail">
                                    <span class="video-post-count">${search.watched}</span>
                                        <%--<span class="video-post-time">23:00</span>--%>
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

                                    <img src="${pageContext.request.contextPath}/${search.vimg}" alt="">

                                </div>

                                <!-- Blog Post Content -->
                                <div class="video-post-content">
                                    <h3> ${search.vname}  </h3>
                                    <img src="${pageContext.request.contextPath}/${search.user_item.u_img}" alt="">
                                    <span class="video-post-user">${search.user_item.username}</span>
                                    <span class="video-post-date"> ${search.createtime} </span>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                </div>
            </div>
        </div>
        <%--<jsp:include page="footer.jsp"/>--%>
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

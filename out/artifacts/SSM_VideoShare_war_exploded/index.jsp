<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/4/1
  Time: 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <title>VideoShare Streaming Video HTML Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="VideoShare is - Professional A unique and beautiful collection of UI elements">
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
<jsp:include page="header.jsp" />
    <!-- contents -->
    <div class="main_content">

        <div class="main_content_inner">

            <!-- Slideshow -->
            <div class="uk-position-relative uk-visible-toggle uk-light" tabindex="-1"
                 uk-slideshow="animation: push ;min-height: 200; max-height: 350 ;autoplay: t rue">

                <ul class="uk-slideshow-items rounded">
                    <li>
                        <div class="uk-position-cover" uk-slideshow-parallax="scale: 1.2,1.2,1">
                            <img src="${pageContext.request.contextPath}/assets/images/banner/img3.jpg" alt="" uk-cover>
                        </div>
                        <div class="uk-position-cover"
                             uk-slideshow-parallax="opacity: 0,0,0.2; backgroundColor: #000,#000"></div>
                        <div class="uk-position-bottom-left bg-gradient-4 uk-width-1-1 p-4">
                            <div uk-slideshow-parallax="scale: 1,1,0.8">
                                <h1 uk-slideshow-parallax="x: 200,0,0" class="uk-heading-small"> Enjoy Watching </h1>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="uk-position-cover" uk-slideshow-parallax="scale: 1.2,1.2,1">
                            <img src="${pageContext.request.contextPath}/assets/images/banner/img2.jpg" alt="" uk-cover>
                        </div>
                        <div class="uk-position-cover"
                             uk-slideshow-parallax="opacity: 0,0,0.2; backgroundColor: #000,#000"></div>
                        <div class="uk-position-bottom uk-position-medium uk-transition-scale-down">
                            <h1 uk-slideshow-parallax="x: 200,0,0" class="uk-heading-small">Discover Life</h1>
                        </div>
                    </li>
                </ul>

                <a class="uk-position-center-left-out uk-position-small uk-hidden-hover slidenav-prev" href="#"
                   uk-slideshow-item="previous"></a>
                <a class="uk-position-center-right-out uk-position-small uk-hidden-hover slidenav-next" href="#"
                   uk-slideshow-item="next"></a>

            </div>

            <!-- Videos sliders 1 -->

            <div class="video-grid-slider mt-4" uk-slider="finite: true">

                <div class="grid-slider-header">
                    <div>
                        <h3> Featured Videos </h3>
                        <p> Channals You are Fallowing. </p>
                    </div>
                    <div class="grid-slider-header-link">

                        <div class="btn-arrow-slider">
                            <a href="#" class="btn-arrow-slides" uk-slider-item="previous">
                                <span class="arrow-left"></span>
                            </a>
                            <a href="#" class="btn-arrow-slides" uk-slider-item="next">
                                <span class="arrow-right"></span>
                            </a>
                        </div>

                    </div>
                </div>

                <ul class="uk-slider-items uk-child-width-1-4@m uk-child-width-1-3@s uk-grid">
                <c:forEach items="${videobw}" var="videobw">
                    <li>
                        <a href="${pageContext.request.contextPath}/video/DisVideoById.do?id=${videobw.id}" class="video-post">
                            <!-- Blog Post Thumbnail -->
                            <div class="video-post-thumbnail">
                                <span class="video-post-count">${videobw.watched}</span>
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

                                <img src="${pageContext.request.contextPath}/${videobw.vimg}" alt="">

                            </div>

                            <!-- Blog Post Content -->
                            <div class="video-post-content">
                                <h3> ${videobw.vname} </h3>
                                <img src="${pageContext.request.contextPath}/${videobw.user_item.u_img}" alt="">
                                <span class="video-post-user">${videobw.user_item.username}</span>
                                <%--<span class="video-post-views">531k views</span>--%>
                                <span class="video-post-date"> ${videobw.createtime} </span>
                            </div>
                        </a>
                    </li>
                </c:forEach>
                </ul>

            </div>


            <!-- section header for slider 1 -->

            <div class="section-header mt-5">
                <div class="section-header-left">
                    <h3> Updates from Concerns </h3>
                    <p> Channals You are Concerns</p>
                </div>
            </div>

            <!-- Videos sliders 1 -->

            <div class="section-small pt-0">
                <div uk-slider="finite: true">

                    <ul class="uk-slider-items uk-child-width-1-4@m uk-child-width-1-3@s uk-grid mb-3">
                    <c:forEach items="${concernvideo}" var="concerns">
                        <li>
                            <a href="${pageContext.request.contextPath}/video/DisVideoById.do?id=${concerns.video.id}" class="video-post">
                                <!-- Blog Post Thumbnail -->
                                <div class="video-post-thumbnail">
                                    <span class="video-post-count">${concerns.video.watched}</span>
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

                                    <img src="${pageContext.request.contextPath}/${concerns.video.vimg}" alt="">

                                </div>

                                <!-- Blog Post Content -->
                                <div class="video-post-content">
                                    <h3> ${concerns.video.vname}  </h3>
                                    <img src="${pageContext.request.contextPath}/${concerns.video.user_item.u_img}" alt="">
                                    <span class="video-post-user">${concerns.video.user_item.username}</span>
                                    <%--<span class="video-post-views">531k views</span>--%>
                                    <span class="video-post-date"> ${concerns.video.createtime} </span>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                        <c:if test="${user1_item.getConcern()==0}"><h3>你还没有关注的人喔，赶紧关注一下吧！</h3></c:if>
                    </ul>

                    <a class="uk-position-center-left-out uk-position-small slidenav-prev" href="#"
                       uk-slider-item="previous"></a>
                    <a class="uk-position-center-right-out uk-position-small slidenav-next" href="#"
                       uk-slider-item="next"></a>

                </div>

            </div>

            <hr class="m-0">

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
<script src="${pageContext.request.contextPath}/assets/js/simplebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>

</html>

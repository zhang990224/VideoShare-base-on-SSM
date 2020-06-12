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

            <h3> 用户 </h3>

            <div class="sections-small">
                <div class="uk-child-width-1-4@m uk-child-width-1-2@s" uk-grid>
                <c:forEach items="${user_all}" var="all">
                    <div>
                        <a href="${pageContext.request.contextPath}/video/DisOtherUserById.do?user_id=${all.user_id}&page=1">
                            <div class="channal-card animate-this">
                                <div class="channal-card-thumbnail" data-src="" uk-img>
                                </div>
                                <div class="channal-card-body">
                                    <div class="channal-card-creator">
                                        <img src="${pageContext.request.contextPath}/${all.u_img}" alt="">
                                    </div>
                                    <h4>${all.username} </h4>
                                    <p> <span>${all.fans} Fans  ${all.v_num} Videos</span> </p>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
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

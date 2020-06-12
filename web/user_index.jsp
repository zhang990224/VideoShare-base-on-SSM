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
    <link rel="stylesheet" type="text/css" media="all" href="${pageContext.request.contextPath}/assets/css/style1.css">
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

        <div class="channal">
            <div class="channal-cover">

                <!-- channal cover -->
                <img src="${pageContext.request.contextPath}/assets/images/channnal-cover.jpg" alt="">

            </div>

            <div class="main_content_inner">
                <div class="channal-details">'
                    <div class="left-side">
                        <div class="channal-image">
                            <a href="#headmodal" class="modaltrigger">
                                <img id="userHead" src="${pageContext.request.contextPath}/${user1_item.getU_img()}" alt="">
                            </a>
                        </div>
                        <div class="channal-details-info">
                            <h3> ${user1.getUsername()} </h3>
                            <p> ${user1_item.getFans()} Fans</p>
                        </div>
                    </div>
                    <a href="#headmodal2" class="modaltrigger"> <i class="uil-user"></i> Update Password </a>
                </div>

                <div class="nav-channal" k-sticky="offset:61;media : @s">
                    <nav class="responsive-tab">
                        <ul>
                            <li class="uk-active"><a class="active" href="#0">Home</a></li>
                            <li><a href="${pageContext.request.contextPath}/video/DisCollectVideoById.do">Collects</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/disRelationUserById.do?user_id=${user1.id}">Concerns</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/disRelationUserFById.do?user_id=${user1.id}">Fans</a></li>
                            <li><a href="#0">About</a></li>
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
                                <textarea id="ta" onkeypress="newline()" class="uk-input">${user1_item.getIntroduce()}</textarea>
                                <br/><br/>
                                <button id="bt" onclick="save()" class="button warning" >保存修改</button>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="uk-width-expand">

                    <h5> Stats </h5>
                    <ul class="uk-list">
                        <li> Joined ${user1_item.getBirthday()} </li>
                        <li> ${user1_item.getConcern()} concerns </li>
                        <li> ${user1_item.getFans()} fans </li>
                        <li> ${user1_item.getV_num()} videos</li>
                    </ul>

                </div>
            </div>

            <div class="section-small">
                <h3> Latest Video uplaods </h3>

                <div class="video-grid-slider" uk-slider="finite: true">
                    <ul class="uk-slider-items uk-child-width-1-4@m uk-child-width-1-3@s uk-grid">
                <c:forEach items="${recentvideo}" var="revideo">
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
                                    <img src="${pageContext.request.contextPath}/${revideo.vimg}" alt="">
                                </div>
                                <!-- Blog Post Content -->
                                <div class="video-post-content">
                                    <h3> ${revideo.vname}</h3>
                                    <img src="${pageContext.request.contextPath}/${user1_item.getU_img()}" alt="">
                                    <span class="video-post-user">${user1.getUsername()}</span>
                                        <%--<span class="video-post-views">531k views</span>--%>
                                    <span class="video-post-date"> ${revideo.createtime} </span>
                                </div>
                                <div><a href="#tishimodal1" class="modaltrigger" onclick="disvideoid(${revideo.id})">删除</a></div>
                            </a>
                        </li>
                </c:forEach>
                 </ul>

                    <a class="uk-position-center-left uk-position-small uk-hidden-hover slidenav-prev" href="#"
                       uk-slider-item="previous"></a>
                    <a class="uk-position-center-right uk-position-small uk-hidden-hover slidenav-next" href="#"
                       uk-slider-item="next"></a>

                </div>
                <c:if test="${user1_item.getV_num()==0}"><h3>近期没有发布视频喔</h3></c:if>
            </div>

            <div class="section-small">

                <h3> All Videos </h3>

                <div class="uk-child-width-1-4@m mb-11" uk-grid
                     uk-scrollspy="target: > div; cls: uk-animation-slide-bottom-small; delay: 100">
                <c:forEach items="${video.list}" var="video">
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
                                <img src="${pageContext.request.contextPath}/${user1_item.getU_img()}" alt="">
                                <span class="video-post-user">${user1.getUsername()}</span>
                                <%--<span class="video-post-views">531k views</span>--%>
                                <span class="video-post-date"> ${video.createtime} </span>
                            </div>
                            <div><a href="#tishimodal1" class="modaltrigger" onclick="disvideoid(${video.id})">删除</a></div>
                        </a>
                    </div>
                </c:forEach>
                <c:if test="${user1_item.getV_num()==0}"><h3>你还没有发布视频喔</h3></c:if>
                </div>
                <div>
                    <ul class="uk-pagination my-5 uk-flex-center" uk-margin>
                        <c:if test="${video.currentPage>1}">
                            <li><span uk-pagination-next><a href="${pageContext.request.contextPath}/video/DisAllVideoById.do?page=${video.currentPage-1}&user_id=${user1.getId()}">上一页</a></span></li>
                        </c:if>
                        <li class="uk-disabled">
                            <span>当前第${video.currentPage}页/总${video.totalPage}页</span>
                        </li>
                        <c:if test="${video.currentPage < video.totalPage}">
                            <li><span uk-pagination-next><a href="${pageContext.request.contextPath}/video/DisAllVideoById.do?page=${video.currentPage+1}&user_id=${user1.getId()}">下一页</a></span></li>
                        </c:if>
                    </ul>
                </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </div>

</div>
<div id="headmodal" style="display:none;">
    <h2>头像修改</h2>
    <form id="headform" name="headform" method="post" action="#">
        <img style="width: 100px;height: 100px;" id="imghead" src="${pageContext.request.contextPath}/${user1_item.getU_img()}" alt="">
        <div uk-form-custom>
            <input type="file" id="uploadhead" name="uploadhead"  tabindex="1" class="flatbtn-blu hidemodal" onchange="returnHead()">
            <a href="#" class="button soft-warning small">选择图片</a>
        </div>
        <input type="button" name="uploadbtn" id="uploadbtn" class="flatbtn-blu hidemodal" value="保存" tabindex="2" onclick="saveHead()">
        <span id="hi" style="display: none"></span>
        <span style="font-size:12px;">提示:若图片名含特殊字符可能会导致更换失败</span>
    </form>
</div>
<div id="tishimodal1" style="display:none;">
    <p style="font-size: 16px;font-weight: bold;">是否要删除你的视频</p><div style="display: none"><span id="vid1"></span></div>
    <input type="button" name="btn1" id="btn1" class="flatbtn-blu" value="确定" tabindex="1" onclick="deleteVideo()">
</div>
<div id="headmodal2" style="display:none;">
    <h2>修改密码</h2>
    <span>旧密码：</span><input type="password" class="addinput" name="old" id="old">
    <span>新密码：</span><input type="password" class="addinput" name="new" id="new">
    <input type="button" name="updatePsw" id="updatePsw" class="flatbtn-blu" value="修改" tabindex="1" onclick="updatePsw()">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" name="quxiao" id="quxiao" class="flatbtn-blu" value="取消" tabindex="2">
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


    function newline(){
        var taVal = document.getElementById('ta').value;
        if(taVal != null && taVal.length > 0){
            var len = Number(taVal.length);
            if(len%15 == 0) {
                document.getElementById('ta').value = document.getElementById('ta').value + "\n";
            }
        }
    }

    function save() {
        var taVal = document.getElementById('ta').value;
        $.ajax({
            url:"${pageContext.request.contextPath}/user/updateIntroduce.do",
            async:true,
            type:"POST",
            data: "introduce="+taVal,
            success:function (data) {
                alert(data);
            },
            error:function () {
                alert("更新失败");
            },
            dataType:"text"
        });
    }

    function returnHead() {
        var formData = new FormData();
        var file = $('#uploadhead')[0].files[0];
        formData.append("upload",file);
        var head = document.getElementById("imghead");
        var hi = document.getElementById("hi");
        $.ajax({
            url:"${pageContext.request.contextPath}/user/returnHead.do",
            async:true,
            processData: false,   // jQuery不要去处理发送的数据
            contentType: false,   // jQuery不要去设置Content-Type请求头
            type:"POST",
            data: formData,
            success:function (data) {
                head.src="${pageContext.request.contextPath}/"+data;
                hi.innerHTML = data;
            },
            error:function () {
                alert("更新失败");
            },
            dataType:"text"
        });
    }

    function saveHead() {
        var userhead = document.getElementById("userHead");
        var hi = document.getElementById("hi").innerHTML;
        $.ajax({
            url:"${pageContext.request.contextPath}/user/updateHead.do",
            async:true,
            type:"POST",
            data: "head="+hi,
            success:function (data) {
                userhead.src = "${pageContext.request.contextPath}/"+hi;
                alert(data);
            },
            error:function () {
                alert("更新失败");
            },
            dataType:"text"
        });
    }

    function updatePsw() {
        var oldp = document.getElementById("old");
        var newp = document.getElementById("new");
        if (oldp.value!="" && newp.value!=""){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/updatePsw.do",
                async:true,
                type:"POST",
                data: {"oldp":oldp.value,"newp":newp.value},
                success:function (data) {
                    oldp.value = "";
                    newp.value = "";
                    alert(data);
                },
                error:function () {
                    alert("修改失败");
                },
                dataType:"text"
            });
        } else{
            alert("密码不能为空");
        }
    }

    function disvideoid(video_id) {
        var id = document.getElementById("vid1");
         id.innerHTML = video_id;
         //alert(id.innerHTML)
    }

    function deleteVideo() {
        var video_id = document.getElementById("vid1").innerHTML;
        //alert(video_id);
        location.href="${pageContext.request.contextPath}/video/deleteIswatched.do?video_id="+video_id;
    }
</script>
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.leanModal.min.js"></script>
<script type="text/javascript">
    $(function(){
        //弹出层调用语句
        $('.modaltrigger').leanModal({
            top:110,
            overlay:0.45,
            closeButton:"#quxiao",
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

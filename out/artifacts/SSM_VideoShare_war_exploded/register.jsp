<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/4/1
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
    function pswt() {
        var password = document.getElementById("password").value;
        var passwordc = document.getElementById("passwordc").value;
        var psw = document.getElementById("psw");
        if (password!=passwordc){
            psw.style.color = "red";
            psw.style.fontWeight="bold";
            psw.innerHTML = "两次密码不一致";
        }else{
            psw.innerHTML = "";
        }
    }

    function submit1() {
        var password = document.getElementById("password").value;
        var passwordc = document.getElementById("passwordc").value;
        var form = document.getElementById("forma");
        var em = document.getElementById("em");
        var username = document.getElementById("username").value;
        var email = document.getElementById("email").value;
        if (username!=""&&em.innerHTML=="可用"&&password==passwordc&&password!=""&&email!="") {
            alert("注册成功，正在为你跳转登陆页面！")
            form.submit();
        }else{
            alert("兄嘚，注册信息有误！");
        }
    }

    function findEmail() {
        var em = document.getElementById("em");
        var email = document.getElementById("email").value;
        em.style.fontWeight="bold";
        $.ajax({
            url:"${pageContext.request.contextPath}/user/findEmail.do",
            async:true,
            type:"POST",
            data: "email="+email,
            success:function (data) {
                if (data=="可用") {
                    em.style.color = "green";
                    em.innerHTML = data;
                }else{
                    em.style.color = "red";
                    em.innerHTML = data;
                }
            },
            error:function () {
                alert("请求失败");
            },
            dataType:"text"
        });
    }
</script>
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
<!-- column one -->

<!-- Content
    ================================================== -->
<div uk-height-viewport class="uk-flex uk-flex-middle">
    <div class="uk-width-2-3@m uk-width-1-2@s m-auto rounded">
        <div class="uk-child-width-1-2@m uk-grid-collapse bg-gradient-warning" uk-grid>

            <!-- column one -->
            <div class="uk-margin-auto-vertical uk-text-center uk-animation-scale-up p-3 uk-light">
                <img src="${pageContext.request.contextPath}/assets/images/logo-light-icon.png" width="45" alt="">
                <h1 class="mb-4 mt-2"> VideoShare</h1>
                <p>您可以共享视频的地方。 </p>
            </div>

            <!-- column two -->
            <div class="uk-card-default p-6">
                <div class="my-4 uk-text-center">
                    <h3 class="mb-0">建立新账户</h3>
                    <p class="my-2">填写空白以创建新帐户</p>
                </div>
                <form class="uk-child-width-1-1 uk-grid-small" uk-grid method="post" id="forma" action="${pageContext.request.contextPath}/user/register.do">

                    <div>
                        <div class="uk-form-group">
                            <label class="uk-form-label"> 名称</label>

                            <div class="uk-position-relative w-100">
                                    <span class="uk-form-icon">
                                        <i class="icon-feather-user"></i>
                                    </span>
                                <input class="uk-input" type="text" name="username" id="username" placeholder="Full name">
                            </div>

                        </div>
                    </div>
                    <div>
                        <div class="uk-form-group">
                            <label class="uk-form-label"> 电子邮箱</label>

                            <div class="uk-position-relative w-100">
                                    <span class="uk-form-icon">
                                        <i class="icon-feather-mail"></i>
                                    </span>
                                <input class="uk-input" type="email" name="email" id="email" onblur="findEmail()" placeholder="name@example.com">
                                <span id="em"></span>
                            </div>

                        </div>
                    </div>

                    <div class="uk-width-1-2@s">
                        <div class="uk-form-group">
                            <label class="uk-form-label"> 密码</label>

                            <div class="uk-position-relative w-100">
                                    <span class="uk-form-icon">
                                        <i class="icon-feather-lock"></i>
                                    </span>
                                <input class="uk-input" type="password" id="password" name="password" placeholder="********">
                            </div>

                        </div>
                    </div>
                    <div class="uk-width-1-2@s">
                        <div class="uk-form-group">
                            <label class="uk-form-label"> 确认密码</label>

                            <div class="uk-position-relative w-100">
                                    <span class="uk-form-icon">
                                        <i class="icon-feather-lock"></i>
                                    </span>
                                <input class="uk-input" type="password" id="passwordc" name="passwordc" placeholder="********" onblur="pswt()">
                                <span id="psw"></span>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="mt-4 uk-flex-middle uk-grid-small" uk-grid>
                            <div class="uk-width-expand@s">
                                <p>你有账户&nbsp; <a href="${pageContext.request.contextPath}/login.jsp">登录</a>&nbsp;吗</p>
                            </div>
                            <div class="uk-width-auto@s">
                                <input type="button" class="button warning" value="开始使用" onclick="submit1()"></input>
                            </div>
                        </div>
                    </div>

                </form>
            </div><!--  End column two -->
        </div>
    </div>
</div>

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

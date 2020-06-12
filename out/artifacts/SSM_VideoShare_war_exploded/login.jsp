<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/4/1
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script>
    function submit1() {
        var password = document.getElementById("password").value;
        var passwordc = document.getElementById("passwordc").value;
        var email = document.getElementById("email").value;
        var form = document.getElementById("forma");
        if (email!=""){
            if (password!=passwordc){
                alert("两次密码不一样");
            }else{
                form.submit();
            }
        } else{
            alert("邮箱不能为空");

        }
    }

    function findUser() {
        var username1 = document.getElementById("username1");
        var email1 = document.getElementById("email1");
        var exist = document.getElementById("exist");
        var noexist = document.getElementById("noexist");
        var gonext = document.getElementById("go");
        var ema = document.getElementById("ema");
        if (username1.value!="" && email1.value!=""){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/findUser.do",
                async:true,
                type:"POST",
                data: {"username":username1.value,"email":email1.value},
                success:function (data) {
                    if (data==1) {
                        exist.style.display="block";
                        noexist.style.display="none";
                        ema.innerHTML = email1.value;
                        gonext.href = "#headmodal2";
                    }else{
                        noexist.style.display="block";
                        exist.style.display="none";
                        gonext.href = "#headmodal2";
                    }
                },
                error:function () {
                    alert("请求失败");
                },
                dataType:"text"
            });
        }else{
            alert("填写内容不能为空！");
        }
    }

    function updatePsw() {
        var psw1 = document.getElementById("psw1");
        var psw2 = document.getElementById("psw2");
        var ema = document.getElementById("ema");
        if (psw1.value!="" && psw2.value!=""){
            if (psw1.value == psw2.value){
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/updatePswZ.do",
                    async:true,
                    type:"POST",
                    data: {"psw":psw1.value,"email":ema.innerHTML},
                    success:function (data) {
                        psw1.value == "";
                        psw2.value == "";
                        alert(data);
                    },
                    error:function () {
                        alert("修改失败");
                    },
                    dataType:"text"
                });
            }else{
                alert("两次密码输入不一样");
            }
        } else{
            alert("密码不能为空");
        }
    }
</script>
<style>
    .addinput {
        display: inline-block;
        width: 100%;
        height: 34px;
        padding: 6px 12px;
        font-size: 14px;
        line-height: 1.428571429;
        color: #555555;
        vertical-align: middle;
        background-color: #ffffff;
        border: 1px solid #cccccc;
        border-radius: 4px;
        -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        -webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
        transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    }
    .addinput:focus {
        border-color: #66afe9;
        outline: 0;
        -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, 0.6);
        box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, 0.6);
    }
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
    <link rel="stylesheet" type="text/css" media="all" href="${pageContext.request.contextPath}/assets/css/style1.css">
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
                    <h2 class="mb-0"> 欢迎回来</h2>
                    <p class="my-2">登录以管理您的帐户</p>
                </div>
                <form method="post" id="forma" action="${pageContext.request.contextPath}/user/login.do">

                    <div class="uk-form-group">
                        <label class="uk-form-label"> 电子邮箱</label>

                        <div class="uk-position-relative w-100">
                                <span class="uk-form-icon">
                                    <i class="icon-feather-mail"></i>
                                </span>
                            <input class="uk-input" type="email" id="email" name="email" placeholder="name@example.com">
                        </div>

                    </div>

                    <div class="uk-form-group">
                        <label class="uk-form-label"> 密码</label>

                        <div class="uk-position-relative w-100">
                                <span class="uk-form-icon">
                                    <i class="icon-feather-lock"></i>
                                </span>
                            <input class="uk-input" type="password" id="password" name="password" placeholder="********">
                        </div>

                    </div>

                    <div class="uk-form-group">
                        <label class="uk-form-label"> 确认密码</label>

                        <div class="uk-position-relative w-100">
                                <span class="uk-form-icon">
                                    <i class="icon-feather-lock"></i>
                                </span>
                            <input class="uk-input" type="password" id="passwordc" name="passwordc" placeholder="********">
                        </div>

                    </div>

                    <div class="mt-4 uk-flex-middle uk-grid-small" uk-grid>
                        <div class="uk-width-expand@s">
                            <p> 没有账号&nbsp; <a href="${pageContext.request.contextPath}/register.jsp">注册</a></p>
                            &nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin_login.jsp">【管理端】</a>
                        </div>
                        <a href="#headmodal" class="modaltrigger" class="reply">忘记密码</a>
                        <div class="uk-width-auto@s">
                            <button type="button" class="button warning" onclick="submit1()">开始使用</button>
                        </div>
                    </div>

                </form>
            </div><!--  End column two -->
        </div>
    </div>
</div>
<div id="headmodal" style="display:none;">
    <h2>找回密码</h2>
    <span>用户名称：</span><input type="text" name="username1" id="username1" placeholder="Full name" class="addinput">
    <span>电子邮箱：</span><input id="email1" name="email1" placeholder="name@example.com" class="addinput">
    <br>
    <a href="#" class="modaltrigger" id="go" onclick="findUser()"><i class="icon-line-awesome-undo"></i>下一步</a>
</div>
<div id="headmodal2" style="display:none;">
    <div id="exist">
        <h2>重置密码</h2>
        <span>设置密码：</span><input type="password" class="addinput" name="psw1" id="psw1">
        <span>确定密码：</span><input type="password" class="addinput" name="psw2" id="psw2">
        <input type="button" name="updatePsw" id="updatePsw" class="flatbtn-blu" value="确定" tabindex="1" onclick="updatePsw()">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" name="quxiao" id="quxiao" class="flatbtn-blu" value="取消" tabindex="2">
    </div>
    <div id="noexist" style="display: none;text-align: center;">
        <span>用户不存在！</span>
    </div>
    <div style="display: none;">
        <span id="ema"></span>
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

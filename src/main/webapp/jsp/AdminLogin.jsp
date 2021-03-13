<!DOCTYPE html>
<html>
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>登录</title>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/adminLogin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/style.css">
    <style>
        .login-main{
            margin-top: 300px;
            margin-left: 650px;
        }
    </style>
</head>
<body>
<div class="wrap">
    <img src="${pageContext.request.contextPath}/layui/images/back.jpg" class="imgStyle">
    <div class="loginForm">
        <div class="login-main">
        <form class="layui-form">
            <div class="layui-input-inline">
                <input type="text" name="account" id="account" required lay-verify="required" placeholder="用户名"
                       autocomplete="off"
                       class="layui-input">
            </div>
            <div class="layui-input-inline">
                <input type="password" name="password" id="password" required lay-verify="required" placeholder="密码"
                       autocomplete="off"
                       class="layui-input">
            </div>
            <div class="layui-input-inline">
                <input type="text" name="code" id="code" value="" placeholder="请输入验证码（不区分大小写）" class="layui-input"
                       autocomplete="off" style="width: 240px" required lay-verify="required">
                <canvas id="canvas" width="100" height="43" autocomplete="off"></canvas>
            </div>
            <div class="layui-input-inline login-btn">
                <button lay-submit lay-filter="login" class="layui-btn">登录</button>
            </div>
            <hr/>
        </form>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript"></script>
<script>
    layui.use(['form', 'layer', 'jquery'], function () {
        // 操作对象
        var form = layui.form;
        var $ = layui.jquery;
        var show_num = [];
        draw(show_num);
        num = show_num.join("");
        $("#canvas").on('click', function () {
            draw(show_num);
            num = show_num.join("");
        })
        form.on('submit(login)', function (data) {
            var account = $("#account").val();
            var pwd = $("#password").val();
            var code = $("#code").val();
            $.ajax({
                url: '/admin/login',
                data: "account=" + account + "&pwd=" + pwd + "&code=" + code + "&num=" + num,
                dataType: 'text',
                type: 'get',
                success: function (data) {
                    if (data == '验证码错误') {
                        draw(show_num);
                        num = show_num.join("");
                        layer.msg('验证码错误');
                    } else if (data == '登录成功') {
                        layer.msg('登录成功');
                        location.href="/admin/adminMenu?account="+account;
                    } else {
                        layer.msg('账号或密码错误');
                        draw(show_num);
                        num = show_num.join("");
                    }
                }
            })
            return false;
        })


    });
    $(function () {
        var show_num = [];
        draw(show_num);
        $("#canvas").on('click',function(){
            draw(show_num);
            num = show_num.join("");
        })
    })

    function draw(show_num) {
        var canvas_width = $('#canvas').width();
        var canvas_height = $('#canvas').height();
        var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
        var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
        canvas.width = canvas_width;
        canvas.height = canvas_height;
        var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
        var aCode = sCode.split(",");
        var aLength = aCode.length;//获取到数组的长度

        for (var i = 0; i <= 3; i++) {
            var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
            var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
            var txt = aCode[j];//得到随机的一个内容
            show_num[i] = txt.toLowerCase();
            var x = 10 + i * 20;//文字在canvas上的x坐标
            var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
            context.font = "bold 23px 微软雅黑";

            context.translate(x, y);
            context.rotate(deg);

            context.fillStyle = randomColor();
            context.fillText(txt, 0, 0);

            context.rotate(-deg);
            context.translate(-x, -y);
        }
        for (var i = 0; i <= 5; i++) { //验证码上显示线条
            context.strokeStyle = randomColor();
            context.beginPath();
            context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.stroke();
        }
        for (var i = 0; i <= 30; i++) { //验证码上显示小点
            context.strokeStyle = randomColor();
            context.beginPath();
            var x = Math.random() * canvas_width;
            var y = Math.random() * canvas_height;
            context.moveTo(x, y);
            context.lineTo(x + 1, y + 1);
            context.stroke();
        }
    }

    function randomColor() {//得到随机的颜色值
        var r = Math.floor(Math.random() * 256);
        var g = Math.floor(Math.random() * 256);
        var b = Math.floor(Math.random() * 256);
        return "rgb(" + r + "," + g + "," + b + ")";
    }
</script>

</body>
<div class="registerPage">
    <div class="registerDiv">
        <form>
            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>用户名:</label>
                </div>
                <div class="usernameDiv">
                    <i class="layui-icon layui-icon-username adminIcon"></i>
                    <input id="registerUsername" class="layui-input adminInput" type="text" name="username" placeholder="输入用户名" >
                </div>
            </div>
            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>密码:</label>
                </div>
                <div class="passwordDiv">
                    <i class="layui-icon layui-icon-password adminIcon"></i>
                    <input id="registerPassword" class="layui-input adminInput" type="password" name="password" placeholder="输入密码">
                </div>
            </div>
            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>确认密码:</label>
                </div>
                <div class="passwordDiv">
                    <i class="layui-icon layui-icon-password adminIcon"></i>
                    <input id="registerWellPassword" class="layui-input adminInput" type="password" name="password" placeholder="输入密码">
                </div>
            </div>
            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>角色类型:</label>
                </div>
                <div class="passwordDiv">
                    <select id="roleSelect" class="layui-select">
                        <option value="">请选择...</option>
                        <option value="0">经纪人</option>
                        <option value="1">房东</option>
                    </select>
                </div>
            </div>
        </form>
    </div>
</div>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/8/11 0011
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>登录页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/style.css">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>

</head>
<%--<style>--%>
<%--    @media only screen and (max-width: 500px) {--%>
<%--        body {--%>
<%--            background-color: lightblue;--%>
<%--        }--%>
<%--    }--%>
<%--</style>--%>
<body>

<div class="login-main">
    <header class="layui-elip">文档系统</header>
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

        <p><a href="${pageContext.request.contextPath}/jsp/Register.jsp" class="fl">立即注册</a><a href="javascript:;"
                                                                                               class="fr">忘记密码？</a></p>
    </form>
</div>


<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript">

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
            // console.log(data.field);
            var account = $("#account").val();
            var pwd = $("#password").val();
            var code = $("#code").val();
            $.ajax({
                url: '${pageContext.request.contextPath}/user/login',
                data: "account=" + account + "&pwd=" + pwd + "&code=" + code + "&num=" + num,
                dataType: 'text',
                type: 'post',
                success: function (data) {
                    if (data == '验证码错误') {
                        layer.msg('验证码错误');
                    } else if (data == '登录成功') {
                        layer.msg('登录成功');
                        location.href = "${pageContext.request.contextPath}/user/getMenu";
                    } else {
                        layer.msg('账号或密码错误');
                    }
                }
            })
            return false;
        })

    });
    $(function () {
        var show_num = [];
        draw(show_num);
        // $("#canvas").on('click',function(){
        //     draw(show_num);
        //     num = show_num.join("");
        // })
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
</html>

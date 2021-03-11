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
<body>

<div class="login-main" style="margin-top:-50px">
    <header class="layui-elip">文档系统</header>
    <form class="layui-form">
        <div class="layui-input-inline">
            <input type="text" name="account" id="account" required lay-verify="required" placeholder="用户名"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" name="password" id="password" required lay-verify="pass" placeholder="密码"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" name="password2" id="password2" lay-verify="required|confirmPass" placeholder="密码校验"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别：</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男" checked="">
                <input type="radio" name="sex" value="女" title="女">
            </div>
        </div>

        <div class="layui-input-inline">
            <input type="text" name="tel" id="tel" required lay-verify="tel" placeholder="手机" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="text" name="email" id="email" required lay-verify="email" placeholder="邮箱" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline login-btn">
            <button lay-submit lay-filter="login" class="layui-btn">注册</button>
        </div>
        <hr/>

        <p><a href="${pageContext.request.contextPath}/jsp/Login.jsp" class="fl">立即登录</a></p>
    </form>
</div>


<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer', 'jquery'], function () {

        // 操作对象
        var form = layui.form;
        var $ = layui.jquery;
        var pass = $("#password").val();
        var pass1 = $("#password2").val();
        form.verify({
            pass: [
                /^[\S]{6,12}$/
                , '密码必须6到12位，且不能出现空格'
            ],
            confirmPass: function (value) {
                if ($('#password').val() !== value)
                    return '两次密码输入不一致！';
            },
            tel: [
                /^1[3456789]\d{9}$/
                , '手机号码格式不正确'
            ],
            email: [
                /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/
                , '邮箱格式不正确'
            ]
        });


        form.on('submit(login)', function (data) {
            // console.log(data.field);
            $.ajax({
                url: '${pageContext.request.contextPath}/user/register',
                data: data.field,
                dataType: 'text',
                type: 'post',
                success: function (data) {
                    layer.msg(data);
                    if (data == '注册成功') {
                        var flag = confirm("要跳转登录界面吗？");
                        if (flag) {
                            location.href = "${pageContext.request.contextPath}/jsp/Login.jsp";
                        }
                    }
                }
            })
            return false;
        })

    });
</script>
</body>
</html>

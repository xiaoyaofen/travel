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
    <header class="layui-elip">个人信息展示</header>
    <form class="layui-form">

        <div class="layui-input-inline login-btn">
            <button class="layui-btn">用户名：${account}</button>
        </div>
        <div class="layui-input-inline login-btn">
            <button class="layui-btn">性别：${sex}</button>
        </div>
        <div class="layui-input-inline login-btn">
            <button class="layui-btn">手机：${tel}</button>
        </div>
        <div class="layui-input-inline login-btn">
            <button class="layui-btn">邮箱：${email}</button>
        </div>
        <%--        <div class="layui-input-inline login-btn">--%>
        <%--            <button class="layui-btn">职业：${role}</button>--%>
        <%--        </div>--%>
        <div class="layui-input-inline login-btn">
            <button class="layui-btn">积分：${point}</button>
        </div>
    </form>
</div>

</body>
</html>

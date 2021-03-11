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
    <title>后台登录页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/style.css">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>

</head>

<body>

<div class="login-main">
    <header class="layui-elip">后台文档系统</header>
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
        <div class="layui-input-inline login-btn">
            <button lay-submit lay-filter="login" class="layui-btn">登录</button>
        </div>

    </form>
</div>


<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript">

    layui.use(['form', 'layer', 'jquery'], function () {
        // 操作对象
        var form = layui.form;
        var $ = layui.jquery;

        form.on('submit(login)', function (data) {
            // console.log(data.field);
            var account = $("#account").val();
            var pwd = $("#password").val();
            $.ajax({
                <%--url: '${pageContext.request.contextPath}/l?methodName=managelogin',--%>
                url: '${pageContext.request.contextPath}/admin/login/' + account + '/' + pwd,
                // data: "account=" + account + "&pwd=" + pwd,
                dataType: 'text',
                type: 'post',
                success: function (data) {
                    layer.msg(data);
                    if (data == '登录成功') {
                        <%--location.href = "${pageContext.request.contextPath}/l?methodName=mangerMenu";--%>
                        location.href = "${pageContext.request.contextPath}/admin/mangerMenu";
                    }
                }
            })
            return false;
        })

    });


</script>
</body>
</html>

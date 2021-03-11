<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/8/11 0011
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>登录页</title>--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/style.css">--%>
<%--&lt;%&ndash;    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>&ndash;%&gt;--%>
<%--    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/zui/{$version}/css/zui.min.css">--%>
<%--</head>--%>
<%--<body>--%>

<%--<div class="login-main" style="margin-top:-50px">--%>
<%--    <header class="layui-elip">请选择文档类型</header>--%>
<%--       <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">.doc/.docx&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--%>
<%--    <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">.xls/.xlsx&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--%>
<%--    <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">.ppt/.pptx<br>--%>
<%--    <div class="checkbox-primary"><input type="checkbox" id="primaryCheckbox1"><label for="primaryCheckbox1">未选中</label></div>--%>
<%--    <div class="checkbox-primary"><input type="checkbox" checked="checked" id="primaryCheckbox2"><label for="primaryCheckbox2">选中</label></div>--%>
<%--    <div class="checkbox-primary"><input type="checkbox" checked="checked" disabled="disabled" id="primaryCheckbox3"><label for="primaryCheckbox3">禁用</label></div>--%>
<%--</div>--%>

<%--</body>--%>
<%--</html>--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/style.css">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>


<form class="layui-form" action="" lay-filter="example">
    <div class="layui-form-item" style="float: left;margin-left: 200px;margin-top: 70px">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>请选择文档类型</legend>
        </fieldset>
        <div class="layui-input-block">
            <input type="checkbox" name="like[write]" title=".doc/.docx">&nbsp&nbsp&nbsp
            <input type="checkbox" name="like[read]" title=".xls/.xlsx">&nbsp&nbsp&nbsp
            <input type="checkbox" name="like[daze]" title=".ppt/.pptx"><br><br>
            <input type="checkbox" name="like[write]" title=".jpg">&nbsp&nbsp&nbsp
            <input type="checkbox" name="like[read]" title=".txt">&nbsp&nbsp&nbsp
            <input type="checkbox" name="like[daze]" title=".png"><br><br>
            <input type="checkbox" name="like[write]" title=".war">&nbsp&nbsp&nbsp
            <input type="checkbox" name="like[read]" title=".zip">&nbsp&nbsp&nbsp
            <input type="checkbox" name="like[daze]" title=".7z"><br><br>
            <input type="checkbox" name="like[write]" title=".java">&nbsp&nbsp&nbsp
            <input type="checkbox" name="like[read]" title=".class"><br><br>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-normal" id="LAY-component-form-setval">提交</button>
                &nbsp&nbsp&nbsp
                <button type="button" class="layui-btn layui-btn-normal" id="LAY-component-form-getval">返回</button>
            </div>
        </div>
    </div>

</form>


<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }
            , pass: [
                /^[\S]{6,12}$/
                , '密码必须6到12位，且不能出现空格'
            ]
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function (data) {
            layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });

        //表单赋值
        layui.$('#LAY-component-form-setval').on('click', function () {
            form.val('example', {
                "username": "贤心" // "name": "value"
                , "password": "123456"
                , "interest": 1
                , "like[write]": true //复选框选中状态
                , "close": true //开关状态
                , "sex": "女"
                , "desc": "我爱 layui"
            });
        });

        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function () {
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });
</script>

</body>
</html>

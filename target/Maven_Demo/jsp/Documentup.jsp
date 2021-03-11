<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/8/28 0028
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="login-main" style="margin-top:100px">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>选完文件后不自动上传</legend>
    </fieldset>
    <div class="layui-inline">
        <input class="layui-input" id="title" placeholder="文档标题" style="width: 200px">
    </div>
    <br><br>
    <div class="layui-inline">
        <input class="layui-input" id="score" placeholder="文档下载积分" style="width: 200px">
    </div>
    <br><br>
    <div class="layui-upload">
        <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
        <button type="button" class="layui-btn" id="titsubmit">提交</button>
        <button type="button" class="layui-btn" id="test9" style="height: 0">开始上传</button>
    </div>
</div>

<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js" charset="UTF-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>

    $("#titsubmit").on("click", function () {
        var title = $("#title").val()
        var score = $("#score").val()
        if (title == null || title == "") {
            layer.msg('标题不可为空');
        } else {
            var flag = /^\+?((0|([1-9]+\d*))|((0\.\d+)|([1-9]+\d*\.\d+)))$/.test(score);
            if (flag) {
                $("#test9").click();
            } else {
                layer.msg('积分必须是正数');
            }
        }
    })
    layui.use('upload', function () {
        var $ = layui.jquery
            , upload = layui.upload;

        //选完文件后不自动上传
        upload.render({
            accept: "file",
            elem: '#test8'
            , url: '${pageContext.request.contextPath}/document/upload' //改成您自己的上传接口
            , auto: false
            , data: {
                title: function () {
                    return $("#title").val();
                },
                score: function () {
                    return $("#score").val();
                }
            }
            //,multiple: true
            , bindAction: '#test9'
            , before: function () {
                layer.tips('接口地址：' + this.url, this.item, {tips: 1});
            }
            , done: function (res) {
                layer.msg('上传成功');
                console.log(res)
            }
            , error: function () {
                layer.msg('上传失败');
            }
        });
    });
</script>

</body>
</html>

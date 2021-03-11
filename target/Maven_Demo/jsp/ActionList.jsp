<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/8/12 0012
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/X-admin/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/X-admin/css/xadmin.css">
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">--%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/X-admin/js/xadmin.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">演示</a>
            <a>
              <cite>导航元素</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <div class="demoTable">
                        注册时间：
                        <div class="layui-inline">
                            <input class="layui-input" name="start" id="start" autocomplete="off" placeholder="开始日">
                        </div>
                        至
                        <div class="layui-inline">
                            <input class="layui-input" name="end" id="end" autocomplete="off" placeholder="截止日">
                        </div>
                        管理员：
                        <div class="layui-inline">
                            <input class="layui-input" name="manage" id="manage" autocomplete="off" placeholder="管理员">
                        </div>
                        <button class="layui-btn" data-type="reload">搜索</button>
                    </div>
                    <form class="layui-form layui-col-space5">

                        <div class="layui-input-inline">
                            <button id="btnRole" type="button" class="layui-btn layui-btn-primary layui-btn-radius">
                                新增角色
                            </button>
                        </div>

                    </form>
                </div>

                <table class="layui-hide" id="test" lay-filter="test"></table>

            </div>
        </div>
    </div>
</div>
</div>
</div>

<div class="layui-row" id="popSearchRoleTest" style="display:none;">
    <div class="layui-col-md11">
        <form class="layui-form">
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp用户名：
            <div class="layui-input-inline">
                <input type="text" id="account" name="account" required lay-verify="required" placeholder="用户名"
                       autocomplete="off"
                       class="layui-input">
            </div>
            <br><br>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp密码：
            <div class="layui-input-inline">
                <input type="password" name="password" id="password" required lay-verify="pass" placeholder="密码"
                       autocomplete="off"
                       class="layui-input">
            </div>
            <br><br>
            <div class="layui-form-item">
                <label class="layui-form-label">选择等级：</label>
                <div class="layui-input-inline">
                    <select name="juese" lay-filter="juese" id="juese" lay-verify="required|confirmPass">
                        <option value="-1"></option>
                        <option value="2">普通管理员</option>
                        <option value="3">超级管理员</option>
                    </select>
                </div>
            </div>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <div class="layui-input-inline login-btn">
                <button lay-submit lay-filter="register" class="layui-btn">注册</button>
            </div>
            <hr/>
        </form>
    </div>
</div>


</body>


<script>
    layui.use('table', function () {
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#test'
            , height: 312
            // ,url: '/demo/table/user/' //数据接口
            , url: '${pageContext.request.contextPath}/action/getAction' //数据接口

            , cols: [[ //表头
                // {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
                {field: 'id', title: '序号', align: 'center', width: 160}
                , {field: 'name', title: '操作人', width: 160, align: 'center', sort: true}
                , {field: 'time', title: '记录时间', align: 'center', width: 160}
                , {field: 'thing', title: '记录事件', align: 'center', width: 160}
                , {title: '操作', width: 160, align: 'center', toolbar: '#barDemo'}
            ]]
            , page: true
        });
        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if (layEvent === 'detail') { //查看
                //do somehing
            } else if (layEvent === 'del') { //删除
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: '${pageContext.request.contextPath}/action/delAction',
                        data: data,
                        dataType: 'text',
                        type: 'post',
                        success: function (data) {
                            layer.msg(data);
                            if (data == '删除成功') {
                                obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                layer.close(index);
                            }
                        }
                    })

                    //向服务端发送删除指令
                });
            }
        });

    });


</script>
<script type="text/jsp" id="barDemo">
    <div class="layui-btn-container">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </div>
</script>

</html>


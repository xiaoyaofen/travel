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
                        文档标题：
                        <div class="layui-inline">
                            <input class="layui-input" name="title" id="title" autocomplete="off" placeholder="标题">
                        </div>
                        上传人：
                        <div class="layui-inline">
                            <input class="layui-input" name="worker" id="worker" autocomplete="off" placeholder="上传人">
                        </div>
                        文档类型：
                        <div class="layui-inline">
                            <select name="type" lay-filter="type" style="width: 60px;height: 25px" id="type">
                                <option value=""></option>
                                <option value="PPT">PPT</option>
                                <option value="JPG">JPG</option>
                                <option value="TXT">TXT</option>
                                <option value="DOC">DOC</option>
                            </select>
                        </div>
                        <br><br>
                        上传时间：
                        <div class="layui-inline">
                            <input class="layui-input" name="start" id="start" autocomplete="off" placeholder="开始日">
                        </div>
                        至
                        <div class="layui-inline">
                            <input class="layui-input" name="end" id="end" autocomplete="off" placeholder="截止日">
                        </div>
                        <button class="layui-btn" data-type="reload">搜索</button>
                    </div>
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
                <input type="text" id="account" required lay-verify="required" placeholder="用户名" autocomplete="off"
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
    $("#btnRole").on("click", function () {
        layer.open({
            //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
            type: 1,
            title: "新增管理员",
            area: ['50%', '50%'],
            content: $("#popSearchRoleTest")
        });
    });


    layui.use(['laydate', 'form', 'jquery'], function () {
        var laydate = layui.laydate;
        var form = layui.form;
        var $ = layui.jquery;


        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });

    /*用户-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {

            if ($(obj).attr('title') == '启用') {

                //发异步把用户状态进行更改
                $(obj).attr('title', '停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!', {icon: 5, time: 1000});

            } else {
                $(obj).attr('title', '启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!', {icon: 5, time: 1000});
            }

        });
    }

    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }


    function delAll(argument) {

        var data = tableCheck.getData();

        layer.confirm('确认要删除吗？' + data, function (index) {
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }


</script>


<script>
    layui.use('table', function () {
        var table = layui.table;

        var $ = layui.$, active = {
            reload: function () {
                var start = $('#start');
                var end = $('#end');
                var title = $('#title');
                var worker = $('#worker');
                var type = $('#type');
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        key: {
                            start: start.val(),
                            end: end.val(),
                            worker: worker.val(),
                            title: title.val(),
                            type: type.val()
                        }
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //第一个实例
        table.render({
            elem: '#test'
            , height: 312
            // ,url: '/demo/table/user/' //数据接口
            , url: '${pageContext.request.contextPath}/document/getDocMsg' //数据接口

            , cols: [[ //表头
                // {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
                {field: 'title', title: '文档标题', align: 'center', width: 120}
                , {field: 'name', title: '上传人', width: 120, align: 'center', sort: true}
                , {field: 'time', title: '上传时间', align: 'center', width: 120}
                , {field: 'record', title: '积分', align: 'center', width: 120}
                , {field: 'type', title: '类型', align: 'center', width: 120}
                , {title: '操作', width: 260, align: 'center', toolbar: '#barDemo'}
            ]]
            , page: {
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'],     // 自定义分页布局
                curr: 1,      // 设置默认起始页1
                groups: 5,   //只显示10个连续页码,就是说显示10个可见页其他的省略
                first: false, // 不显示首页
                last: false   // 不显示尾页
            },
            // limit: 3,
            limits: [5, 10, 15, 20, 25]
            , id: "testReload"
        });


        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if (layEvent === 'detail') { //查看
                //do somehing
            } else if (layEvent === 'del') { //删除
                layer.confirm('真的删除行么', function (index) {


                    //向服务端发送删除指令
                });
            } else if (layEvent === 'edit') { //编辑


            } else if (layEvent === 'LAYTABLE_TIPS') {
                layer.alert('Hi，头部工具栏扩展的右侧图标。');
            }
        });
    });
    layui.use(['form', 'layer', 'jquery'], function () {

        // 操作对象
        var form = layui.form;
        var $ = layui.jquery;

        form.on('submit(demo11)', function (data) {
            var hidename = $("#hidename").html();
            var flag = confirm("确定修改吗？");
            if (flag) {
                $.ajax({
                    async: false,
                    url: '${pageContext.request.contextPath}/l?methodName=fixAdmin',
                    dataType: 'text',
                    type: 'POST',
                    data: {"newname": data.field.newname, "newlevel": data.field.newlevel, "hidename": hidename},
                    success: function (data) {
                        layer.msg(data);
                        if (data == '修改成功') {
                            location.href = "${pageContext.request.contextPath}/jsp/MangerList.jsp";
                        }
                    },
                    error: function () {
                        layer.msg("网络繁忙");
                    }
                })
                return false;
            }
        })


    });


</script>

<script type="text/jsp" id="barDemo">
    <div class="layui-btn-container">
        <a class="layui-btn layui-btn-xs" lay-event="detail">下载</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">审核通过</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">审核不通过</a>
    </div>
</script>

<div class="layui-row" id="popUpdateTest" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" action="" style="margin-top:20px">
            <div class="layui-form-item">
                <label class="layui-form-label">管理员账号</label>
                <div class="layui-input-block">
                    <input type="text" name="newname" required lay-verify="required" autocomplete="off"
                           placeholder="请输入新账号" class="layui-input">
                    <span id="hidename" hidden></span>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">管理员等级</label>
                <div class="layui-input-block">
                    <select name="newlevel" lay-filter="eqptType">
                        <option value="2">普通管理员</option>
                        <option value="3">超级管理员</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item" style="margin-top:40px">
                <div class="layui-input-block">
                    <button class="layui-btn  layui-btn-submit " lay-submit="" lay-filter="demo11" id="surefix">确认修改
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

</html>



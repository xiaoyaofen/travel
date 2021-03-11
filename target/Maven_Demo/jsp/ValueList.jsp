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

                <table class="layui-hide" id="test" lay-filter="test"></table>

            </div>
        </div>
    </div>
</div>
</div>
</div>

</body>

<script>
    layui.use('table', function () {
        var table = layui.table;

        var $ = layui.$, active = {
            reload: function () {
                var start = $('#start');
                var end = $('#end');
                var manage = $('#manage');
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        key: {
                            start: start.val(),
                            end: end.val(),
                            manage: manage.val()
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
            , height: 400
            // ,url: '/demo/table/user/' //数据接口
            , url: '${pageContext.request.contextPath}/document/getValue' //数据接口

            , cols: [[ //表头
                // {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
                {field: 'id', title: '序号', align: 'center', width: 160}
                , {field: 'name', title: '文档类型', width: 160, align: 'center', sort: true}
                , {field: 'value', title: '积分', align: 'center', width: 160}
                , {title: '操作', width: 192, align: 'center', toolbar: '#barDemo'}
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
                    $.ajax({
                        url: '${pageContext.request.contextPath}/document/delValue',
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
            } else if (layEvent === 'edit') { //编辑
                $("#hideid").html(data.id)
                $("#document").val(data.name)
                $("#point").val(data.value)
                layer.open({
                    //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                    type: 1,
                    title: "文档信息修改",
                    area: ['420px', '330px'],
                    content: $("#popUpdateTest"),//引用的弹出层的页面层的方式加载修改界面表单
                });
                //动态向表传递赋值可以参看文章进行修改界面的更新前数据的显示，当然也是异步请求的要数据的修改数据的获取
                // setFormValue(obj,data);

            } else if (layEvent === 'LAYTABLE_TIPS') {
                layer.alert('Hi，头部工具栏扩展的右侧图标。');
            }
        });
    });
    layui.use(['form', 'layer', 'jquery'], function () {

        // 操作对象
        var form = layui.form;
        var $ = layui.jquery;
        var pass = $("#password").val();
        form.verify({
            point: [
                /^\+?((0|([1-9]+\d*))|((0\.\d+)|([1-9]+\d*\.\d+)))$/
                , '积分必须是正数'
            ]
        });

        form.on('submit(demo11)', function (data) {
            var hideid = $("#hideid").html();
            var flag = confirm("确定修改吗？");
            if (flag) {
                $.ajax({
                    async: false,
                    url: '${pageContext.request.contextPath}/document/fixValue',
                    dataType: 'text',
                    type: 'POST',
                    data: {"document": data.field.document, "point": data.field.point, "hideid": hideid},
                    success: function (data) {
                        layer.msg(data);
                        if (data == '修改成功') {
                            location.href = "${pageContext.request.contextPath}/jsp/ValueList.jsp";
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
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </div>
</script>

<div class="layui-row" id="popUpdateTest" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" action="" style="margin-top:20px">
            <div class="layui-form-item">
                <label class="layui-form-label">文档类型</label>
                <div class="layui-input-block">
                    <input type="text" name="document" required lay-verify="required" autocomplete="off"
                           class="layui-input" disabled="true" id="document">
                    <span id="hideid" hidden></span>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">积分</label>
                <div class="layui-input-block">
                    <input type="text" name="point" required lay-verify="point" autocomplete="off"
                           placeholder="请输入新积分" class="layui-input" id="point">
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


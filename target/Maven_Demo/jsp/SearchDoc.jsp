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
                        搜索文档：
                        <div class="layui-inline">
                            <input class="layui-input" name="doc" id="doc" autocomplete="off" placeholder="请输入文档名字"
                                   style="width: 300px">
                        </div>
                        <button class="layui-btn" data-type="reload">搜索</button>
                        <br><br>
                        &nbsp搜索结果：
                    </div>
                </div>

                <table class="layui-hide" id="test" lay-filter="test"></table>

            </div>
        </div>
    </div>
</div>
</div>
</div>


</body>

<script>


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


</script>


<script>
    layui.use('table', function () {
        var table = layui.table;

        var $ = layui.$, active = {
            reload: function () {
                var doc = $('#doc');
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        key: {
                            doc: doc.val(),
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
            , url: '${pageContext.request.contextPath}/document/getSearchDoc' //数据接口
            , text: {
                none: '暂无数据'
            }
            , cols: [[ //表头
                // {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
                {field: 'title', title: '文档标题', align: 'center', width: 160}
                , {field: 'name', title: '上传时间', width: 160, align: 'center', sort: true}
                , {field: 'time', title: '上传时间', align: 'center', width: 160}
                , {field: 'record', title: '下载积分', align: 'center', width: 160}
                , {field: 'type', title: '下载类型', align: 'center', width: 160}
                , {field: 'count', title: '下载次数', align: 'center', width: 160}
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
        })

    });


</script>


</html>


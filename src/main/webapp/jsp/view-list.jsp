<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/X-admin/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/X-admin/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/X-admin/js/xadmin.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <!--[if lt IE 9]>
    <!--<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>-->
    <!--<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>-->
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
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5">
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input"  autocomplete="off" placeholder="请输入乡村风景名称" name="name" id="name">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="img"  placeholder="请输入图片路径" autocomplete="off" class="layui-input" id="img">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn"  lay-submit="" lay-filter="sreach" id="sreach"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button type="button" class="layui-btn layui-btn-sm" id="addBtn"><i class="layui-icon"></i></button>
                        </div>
                    </form>
                </div>

                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-hide" id="demo" lay-filter="demo"></table>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
<script>


    layui.use(['laydate','table','form','layer'], function(){
        var laydate = layui.laydate;
        var form = layui.form;
        var table = layui.table;
        var layer = layui.layer;

        //执行一个 table 实例
        table.render({
            elem: '#demo'
            ,height: 420
            ,url: '/country/getCountryView' //数据接口
            ,title: '乡村风景信息'
            ,page:{
                layout: [ 'prev', 'page', 'next', 'count','limit', 'refresh', 'skip']//自定义布局顺序
                ,groups:5 	//最多几个跳页按钮
                ,first: false //不显示首页
                ,last: false //不显示尾页
            }
            , limit: 5	//初始  每页几条数据
            , limits: [5, 10, 15]	//可以选择的 每页几条数据
            , id: "testReload"
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,defaultToolbar: ['filter', 'exports']
            ,totalRow: true //开启合计行
            ,cols: [
                [ //表头
                    {field: 'id',title: '序号',width:200}
                    ,{field: 'name', title: '乡村风景名称', width: 300}
                    ,{field: 'img', title: '图片路径', width: 150}
                    ,{field: 'click', title: '点赞次数', width: 200}
                    ,{field: 'createTime', title: '创建时间', width: 200}
                    ,{field: 'belong', title: '所属乡镇', width: 200}
                    ,{fixed: 'right' ,title: '操作', width: 200, align:'center', toolbar: '#barDemo'}
                ]
            ]
        });

        table.on('tool(demo)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if (layEvent === 'detail') { //查看



            } else if (layEvent === 'del') { //删除
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: '/country/delCountry',
                        data: data,
                        dataType: 'text',
                        type: 'get',
                        success: function (data) {
                            layer.msg(data);
                            if (data == 'success') {
                                location.href="${pageContext.request.contextPath}/jsp/view-list.jsp";
                            }
                        }
                    })

                    //向服务端发送删除指令
                });
            } else if (layEvent === 'edit') { //编辑
                $("#hideid").val(data.id);
                $("#name1").val(data.name);
                $("#img1").val(data.img);
                $.ajax({
                    url: '/country/findCountryName',
                    // data: data,
                    dataType: 'json',
                    type: 'get',
                    success: function (data) {
                        $("#countryid1").append("<opyion value=''></opyion>")
                        $(data).each(function (i,n) {
                            $("#countryid1").append("<option value='"+n.name+"'>"+n.name+"</option>")
                        })
                        form.render('select')
                    }
                })
                layer.open({
                    //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                    type: 1,
                    title: "乡村风景信息更改",
                    area: ['420px', '400px'],
                    content: $("#fixKnow"),//引用的弹出层的页面层的方式加载修改界面表单
                    success: function (layero, index) {
                        layui.form.render();
                    }
                });


            } else if (layEvent === 'LAYTABLE_TIPS') {
                layer.alert('Hi，头部工具栏扩展的右侧图标。');
            }
        });

        $("#addBtn").on("click", function () {
            $.ajax({
                url: '/country/findCountryName',
                // data: data,
                dataType: 'json',
                type: 'get',
                success: function (data) {
                    $("#countryid2").append("<opyion value=''></opyion>")
                    $(data).each(function (i,n) {
                        $("#countryid2").append("<option value='"+n.name+"'>"+n.name+"</option>")
                    })
                    form.render('select')
                }
            })
            layer.open({
                //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                type: 1,
                title: "新增乡村风景",
                area: ['420px', '400px'],
                content: $("#addUser")
            });
        });

        $("#sreach").on('click',function () {
            var name=$("#name").val();
            var img=$("#img").val();
            table.reload('testReload',{
                url:'/country/getCountryView',
                where:{
                    name:name,
                    img:img
                },
                page: {
                    curr: 1 //重新从第 1 页开始
                }
            })
            return false;
        })

        form.on('submit(demo12)', function (data) {
            var name = $("#name1").val();
            var img=$("#img1").val();
            var time=$("#time1").val();
            var country=$("#countryid1").val();
            var id=$("#hideid").val();
            var flag=confirm("确定修改乡村风景信息吗？");
            if (flag){
                $.ajax({
                    url: '/country/updateCountryView',
                    data:  {"name": name, "img": img, "id":id,"time":time,"country":country},
                    dataType: 'text',
                    type: 'get',
                    success: function (data) {
                        layer.msg(data);
                        if (data == 'success') {
                            location.href="${pageContext.request.contextPath}/jsp/view-list.jsp";
                        }
                    }
                })
            }
            return false;
        })

        form.on('submit(demo13)', function (data) {
            var name = $("#name2").val();
            var img=$("#img2").val();
            var time=$("#time2").val();
            var country=$("#countryid2").val();
            $.ajax({
                url: '/country/addCountryView',
                data:  {"name": name, "img": img,"time":time,"country":country},
                dataType: 'text',
                type: 'get',
                success: function (data) {
                    layer.msg(data);
                    if (data == 'success') {
                        location.href="${pageContext.request.contextPath}/jsp/view-list.jsp";
                    }
                }
            })
            return false;
        })

    });

</script>

<script type="text/jsp" id="barDemo">
    <div class="layui-btn-container">

        <a title="编辑" href="javascript:;" lay-event="edit">
            <i class="layui-icon">&#xe642;</i>
        </a>

        <a title="删除"  href="javascript:;" lay-event="del">
            <i class="layui-icon">&#xe640;</i>
        </a>

    </div>
</script>

<!--修改界面-->
<div class="layui-row" id="fixKnow" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" action="" style="margin-top:20px">
            <div class="layui-form-item">
                <label class="layui-form-label">乡村风景名称:</label>
                <div class="layui-input-block">
                    <input type="text" name="name1" required lay-verify="required" autocomplete="off"
                           class="layui-input" id="name1">
                </div>
                <span id="hideid" hidden></span>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">图片路径:</label>
                <div class="layui-input-block">
                    <input type="text" name="img1" required lay-verify="required" autocomplete="off"
                           class="layui-input" id="img1">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">创建时间:</label>
                <div class="layui-input-block">
                    <input type="date" name="time1" required lay-verify="required" autocomplete="off"
                           class="layui-input" id="time1">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">所属乡镇:</label>
                <div class="layui-inline layui-show-xs-block">
                    <select name="countryid1" id="countryid1" lay-verify="select">

                    </select>
                </div>
            </div>

            <div class="layui-form-item" style="margin-top:40px">
                <div class="layui-input-block">
                    <button class="layui-btn  layui-btn-submit " lay-submit="" lay-filter="demo12" id="surefix1">确认修改
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<!--新增界面-->
<div class="layui-row" id="addUser" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" action="" style="margin-top:20px">
            <div class="layui-form-item">
                <label class="layui-form-label">风景名称：</label>
                <div class="layui-input-block">
                    <input type="text" name="name2" autocomplete="off" placeholder="请输入乡村风景名称" class="layui-input" id="name2" required lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">图片路径：</label>
                <div class="layui-input-block">
                    <input type="text" name="img2" required lay-verify="required" autocomplete="off"
                           class="layui-input" id="img2" placeholder="请输入图片路径">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">创建时间：</label>
                <div class="layui-input-block">
                    <input type="date" name="time2" required lay-verify="required" autocomplete="off"
                           class="layui-input" id="time2" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">所属乡镇：</label>
                <div class="layui-input-block">
                    <select name="countryid2" id="countryid2" lay-verify="select">

                    </select>
                </div>
            </div>
            <div class="layui-form-item" style="margin-top:40px">
                <div class="layui-input-block">
                    <button class="layui-btn  layui-btn-submit " lay-submit="" lay-filter="demo13" id="surefix2">确认新增
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
</html>

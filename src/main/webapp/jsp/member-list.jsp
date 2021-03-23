<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
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
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5">
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" autocomplete="off" name="account" id="account1" placeholder="请输入账号">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="sex" placeholder="请输入性别" autocomplete="off" class="layui-input" id="sex1">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" lay-submit="" lay-filter="sreach" id="sreach"><i
                                    class="layui-icon">&#xe615;</i></button>
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


    layui.use(['laydate', 'table', 'form', 'layer'], function () {
        var laydate = layui.laydate;
        var form = layui.form;
        var table = layui.table;
        var layer = layui.layer;

        //执行一个 table 实例
        table.render({
            elem: '#demo'
            , height: 420
            , url: '/admin/adminList' //数据接口
            , title: '会员信息'
            , page: {
                layout: ['prev', 'page', 'next', 'count', 'limit', 'refresh', 'skip']//自定义布局顺序
                , groups: 5 	//最多几个跳页按钮
                , first: false //不显示首页
                , last: false //不显示尾页
            }
            , limit: 5	//初始  每页几条数据
            , limits: [5, 10, 15]	//可以选择的 每页几条数据
            , id: "testReload"
            , toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            , defaultToolbar: ['filter', 'exports']
            , totalRow: true //开启合计行
            , cols: [
                [ //表头
                    {field: 'id', title: '序号', width: 200}
                    , {field: 'account', title: '账号', width: 300}
                    , {field: 'email', title: '邮箱', width: 150}
                    , {field: 'tel', title: '电话', width: 300}
                    , {field: 'sex', title: '性别', width: 200}
                    , {field: 'state', title: '审核状态', width: 200}
                    , {fixed: 'right', fixed: 'right', title: '操作', width: 200, align: 'center', toolbar: '#barDemo'}
                ]
            ]
        });

        $("#sreach").on('click',function () {
            var account=$("#account1").val();
            var sex=$("#sex1").val();
            table.reload('testReload',{
                url:'/admin/adminList',
                where:{
                    account:account,
                    sex:sex
                },
                page: {
                    curr: 1 //重新从第 1 页开始
                }
            })
            return false;
        })

        table.on('tool(demo)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if (layEvent === 'detail') { //查看
                $("#hidename").html(data.id);
                $("#lingyu").val(data.scope);
                layer.open({
                    //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                    type: 1,
                    title: "子级知识点添加",
                    area: ['420px', '330px'],
                    content: $("#popUpdateTest"),//引用的弹出层的页面层的方式加载修改界面表单
                });
            } else if (layEvent === 'del') { //删除
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: '/user/delUser',
                        data: data,
                        dataType: 'text',
                        type: 'get',
                        success: function (data) {
                            layer.msg(data);
                            if (data == 'success') {
                                location.href="${pageContext.request.contextPath}/jsp/member-list.jsp";
                            }
                        }
                    })

                    //向服务端发送删除指令
                });
            } else if (layEvent === 'edit') { //编辑
                $("#hideid").html(data.id);
                $("#account").val(data.account);
                $("#email").val(data.email);
                $("#tel").val(data.tel);
                $("#sex").val(data.sex);
                // $("#time").val(data.pPriceTime);
                layer.open({
                    //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                    type: 1,
                    title: "用户信息更改",
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

        form.on('submit(demo12)', function (data) {
            var id = $("#hideid").html();
            var account=$("#account").val();
            var email=$("#email").val();
            var sex=$("#sex").val();
            var tel=$("#tel").val();
            var flag=confirm("确定修改用户信息吗？");
            if (flag){
                $.ajax({
                    url: '/user/updateUserInfo',
                    data:  {"account": account, "email": email, "id": id,"sex":sex,"tel":tel},
                    dataType: 'text',
                    type: 'get',
                    success: function (data) {
                        layer.msg(data);
                        if (data == 'success') {
                            location.href="${pageContext.request.contextPath}/jsp/member-list.jsp";
                        }
                    }
                })
            }
            return false;

        })


        $("#addBtn").on("click", function () {
            layer.open({
                //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                type: 1,
                title: "新增用户",
                area: ['420px', '400px'],
                content: $("#addUser")
            });
        });

        form.on('submit(demo13)', function (data) {
            var account = $("#account2").val();
            var tel=$("#tel2").val();
            var sex=$("#sex2").val();
            var email=$("#email2").val();
            $.ajax({
                url: '/user/addUser',
                data:  {"account": account, "tel": tel,"sex":sex,"email":email},
                dataType: 'text',
                type: 'get',
                success: function (data) {
                    layer.msg(data);
                    if (data == 'success') {
                        location.href="${pageContext.request.contextPath}/jsp/member-list.jsp";
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
                <label class="layui-form-label">账号:</label>
                <div class="layui-input-block">
                    <input type="text" name="account" required lay-verify="required" autocomplete="off"
                           class="layui-input" id="account">
                </div>
                <span id="hideid" hidden></span>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱:</label>
                <div class="layui-input-block">
                    <input type="text" name="email" required lay-verify="required" autocomplete="off"
                           class="layui-input" id="email">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">电话:</label>
                <div class="layui-input-block">
                    <input type="text" name="tel" required lay-verify="required" autocomplete="off"
                           class="layui-input" id="tel">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">性别:</label>
                <div class="layui-input-block">
                    <input type="text" name="sex" required lay-verify="required" autocomplete="off"
                           class="layui-input" id="sex">
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
                <label class="layui-form-label">账号：</label>
                <div class="layui-input-block">
                    <input type="text" name="account2" autocomplete="off" placeholder="请输入账号" class="layui-input" id="account2" required lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱：</label>
                <div class="layui-input-block">
                    <input type="text" name="email2" required lay-verify="required" autocomplete="off"
                           class="layui-input" id="email2" placeholder="请输入邮箱">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">电话：</label>
                <div class="layui-input-block">
                    <input type="text" name="tel2" required lay-verify="required" autocomplete="off"
                           class="layui-input" id="tel2" placeholder="请输入电话">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别：</label>
                <div class="layui-input-block">
                    <input type="text" name="sex2" required lay-verify="required" autocomplete="off"
                           class="layui-input" id="sex2" placeholder="请输入性别">
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

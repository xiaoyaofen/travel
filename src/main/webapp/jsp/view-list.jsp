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
                            <input class="layui-input"  autocomplete="off" placeholder="开始日" name="start" id="start">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input"  autocomplete="off" placeholder="截止日" name="end" id="end">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
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
    //     var laydate = layui.laydate;
    //     var  form = layui.form;
    //
    //
    //     // 监听全选
    //     form.on('checkbox(checkall)', function(data){
    //
    //         if(data.elem.checked){
    //             $('tbody input').prop('checked',true);
    //         }else{
    //             $('tbody input').prop('checked',false);
    //         }
    //         form.render('checkbox');
    //     });
    //
    //     //执行一个laydate实例
    //     laydate.render({
    //         elem: '#start' //指定元素
    //     });
    //
    //     //执行一个laydate实例
    //     laydate.render({
    //         elem: '#end' //指定元素
    //     });
    //
    //
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
                ,limit:5	//初始  每页几条数据
                ,limits:[5,10,15]	//可以选择的 每页几条数据
                ,groups:5 	//最多几个跳页按钮
                ,first: false //不显示首页
                ,last: false //不显示尾页
            }
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
                    ,{fixed: 'right' ,fixed: 'right' ,title: '操作', width: 200, align:'center', toolbar: '#barDemo'}
                ]
            ]
        });
    });

    // /*用户-停用*/
    // function member_stop(obj,id){
    //     layer.confirm('确认要停用吗？',function(index){
    //
    //         if($(obj).attr('title')=='启用'){
    //
    //             //发异步把用户状态进行更改
    //             $(obj).attr('title','停用')
    //             $(obj).find('i').html('&#xe62f;');
    //
    //             $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
    //             layer.msg('已停用!',{icon: 5,time:1000});
    //
    //         }else{
    //             $(obj).attr('title','启用')
    //             $(obj).find('i').html('&#xe601;');
    //
    //             $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
    //             layer.msg('已启用!',{icon: 5,time:1000});
    //         }
    //
    //     });
    // }

    // /*用户-删除*/
    // function member_del(obj,id){
    //     layer.confirm('确认要删除吗？',function(index){
    //         //发异步删除数据
    //         $(obj).parents("tr").remove();
    //         layer.msg('已删除!',{icon:1,time:1000});
    //     });
    // }



    // function delAll (argument) {
    //     var ids = [];
    //
    //     // 获取选中的id
    //     $('tbody input').each(function(index, el) {
    //         if($(this).prop('checked')){
    //             ids.push($(this).val())
    //         }
    //     });
    //
    //     layer.confirm('确认要删除吗？'+ids.toString(),function(index){
    //         //捉到所有被选中的，发异步进行删除
    //         layer.msg('删除成功', {icon: 1});
    //         $(".layui-form-checked").not('.header').parents('tr').remove();
    //     });
    // }
</script>
</html>

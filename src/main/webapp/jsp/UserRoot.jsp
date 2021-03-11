<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/8/28 0028
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<input type="text" id="hideid" value="${param.hideid}" hidden>
<div id="test12" class="demo-tree-more"></div>

<div class="layui-btn-container">
    <button type="button" class="layui-btn" lay-demo="getChecked">保存</button>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['tree', 'util'], function () {
        var id = $("#hideid").val();
        var tree = layui.tree
            , layer = layui.layer
            , util = layui.util
        $.ajax({
            async: false,
            url: '${pageContext.request.contextPath}/admin/getQuanxian',
            data: {"roleid": id},
            dataType: 'json',
            type: 'post',
            success: function (data) {
                //基本演示
                tree.render({
                    elem: '#test12'
                    , data: [data]
                    , showCheckbox: true  //是否显示复选框
                    , id: 'demoId1'
                    , isJump: true //是否允许点击节点时弹出新窗口跳转
                    , click: function (obj) {
                        var data = obj.data;  //获取当前点击的节点数据
                        layer.msg('状态：' + obj.state + '<br>节点数据：' + JSON.stringify(data));
                    }
                });
            },

        })


        //按钮事件
        util.event('lay-demo', {
            getChecked: function (othis) {
                var checkedData = tree.getChecked('demoId1'); //获取选中节点的数据
                var nodeIds = new Array();
                nodeIds = getCheckedId(checkedData);
                var permList = nodeIds;
                permList = "[" + permList + "]";

                // 获取选中节点的id
                function getCheckedId(jsonObj) {
                    var id = "";
                    $.each(jsonObj, function (index, item) {
                        if (id != "") {
                            id = id + "," + item.id;
                        } else {
                            id = item.id;
                        }
                        var i = getCheckedId(item.children);
                        if (i != "") {
                            id = id + "," + i;
                        }
                    });
                    return id;
                }

                var id = $("#hideid").val();
                $.ajax({
                    // async: false,
                    url: '${pageContext.request.contextPath}/admin/fixQuanxian',
                    data: {"permList": permList, "roleid": id},
                    dataType: 'text',
                    type: 'post',
                    success: function (data) {
                        layer.msg(data)
                        if (data == "权限修改成功") {
                            // var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                            // parent.layer.close(index); //再执行关闭
                            layer.confirm('刷新菜单界面吗？', function (index) {
                                parent.parent.location.href = "${pageContext.request.contextPath}/admin/mangerMenu"
                            })
                        }
                    },
                    error: function () {
                        layer.msg("网络繁忙")
                    }
                })

                // layer.alert(JSON.stringify(checkedData), {shade:0});
                // console.log(checkedData);
            }
            , setChecked: function () {
                tree.setChecked('demoId1', [12, 16]); //勾选指定节点
            }
            , reload: function () {
                //重载实例
                tree.reload('demoId1', {});

            }
        });
    });
</script>

</body>
</html>

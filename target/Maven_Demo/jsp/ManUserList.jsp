<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/8/22 0022
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/X-admin/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/X-admin/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/X-admin/js/xadmin.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

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


<!--列表-->
<div id="app">
    <div class="demoTable">
        注册时间：
        <div class="layui-inline">
            <input class="layui-input" name="start" id="start" autocomplete="off" placeholder="开始日">
        </div>
        至
        <div class="layui-inline">
            <input class="layui-input" name="end" id="end" autocomplete="off" placeholder="截止日">
        </div>
        用户名：
        <div class="layui-inline">
            <input class="layui-input" name="manage" id="manage" autocomplete="off" placeholder="管理员" v-model="keyname">
        </div>
        <button class="layui-btn" data-type="reload">搜索</button>
    </div>
    <table class="layui-table" lay-filter="test">
        <thead>
        <tr>
            <th hidden>ID</th>
            <th>用户名</th>
            <th>注册时间</th>
            <th>积分</th>
            <th>上传文档数</th>
            <th>下载文档数</th>
            <th>用户状态</th>
        </tr>
        <tbody>
        <tr v-for="item in userlist">
            <td hidden>{{item.id}}</td>
            <td>{{item.name}}</td>
            <td>{{item.time | dateFormat}}</td>
            <td>{{item.point}}</td>
            <td>{{item.downCount}}</td>
            <td>{{item.uploadCount}}</td>
            <td>
                <button class="layui-btn" @click="check(item.state,item.id)" v-if="item.state =='注册待审核'">
                    {{item.state}}
                </button>
                <button class="layui-btn layui-btn-danger" @click="check(item.state,item.id)"
                        v-else="item.state =='已审核'">{{item.state}}
                </button>
            </td>
        </tr>
        </tbody>
        </thead>
    </table>
</div>
<!--分页容器-->
<div id="pagination"></div>
<script src="https://cdn.bootcdn.net/ajax/libs/vue-resource/1.5.1/vue-resource.js"></script>
<script>
    Vue.filter('dateFormat', function (dateStr) {
        var dt = new Date(dateStr)
        var y = dt.getFullYear();
        var m = (dt.getMonth() + 1).toString().padStart(2, '0');
        var d = dt.getDate().toString().padStart(2, '0');
        var hh = dt.getHours().toString().padStart(2, '0');
        var mm = dt.getMinutes().toString().padStart(2, '0');
        var ss = dt.getSeconds().toString().padStart(2, '0');
        return y + "-" + m + "-" + d + "   " + hh + ":" + mm + ":" + ss
    })

    var vm = new Vue({
        el: '#app',
        data: {
            keyname: '',
            userlist: null
        },
        created() {
            this.getAllList();
        },
        methods: {
            check(state, id) {
                if (state == '注册待审核') {
                    var flag = confirm("确认通过审核吗？")
                    if (flag) {
                        this.$http.post('${pageContext.request.contextPath}/user/checkUser', {id: id}, {emulateJSON: true}).then(result => {
                            if (result.status === 200) {
                                alert(result.body)
                                if (result.body === '审核通过') {
                                    location.href = '${pageContext.request.contextPath}/jsp/ManUserList.jsp';
                                }
                            } else {
                                alert("请求失败")
                            }
                        })
                    }
                }
            },

        }
    })

    //使用layui分页
    layui.use('laypage', function () {
        var laypage = layui.laypage;
        laypage.render({
            elem: 'pagination'
            , count: totalCount
            , layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
            , jump: function (obj, first) {
                //点击非第一页页码时的处理逻辑。比如这里调用了ajax方法，异步获取分页数据
                if (!first) {
                    pagination(obj.curr, obj.limit);//第二个参数不能用变量pageSize，因为当切换每页大小的时候会出问题
                }
            }
        });
    });

    var pageIndex = 1;
    var pageSize = 10;
    var totalCount = 0;
    pagination(pageIndex, pageSize);

    function pagination(pageIndex, pageSize) {
        //查询条件
        var param = {
            pageIndex: pageIndex,
            pageSize: pageSize,
            //其它查询条件可在下面添加
        };
        json = JSON.stringify(param)
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/user/getManUser',
            dataType: 'text',
            data: "param=" + json,
            async: false,//这里设置为同步执行，目的是等数据加载完再调用layui分页组件，不然分页组件拿不到totalCount的值
            success: function (data) {
                var list = JSON.parse(data);
                vm.userlist = list[0];
                // this.userlist=list[0]
                totalCount = list[1];
            }
        });
    };

</script>

</body>
</html>

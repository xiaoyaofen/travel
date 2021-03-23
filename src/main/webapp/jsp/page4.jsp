<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: BOSSliu666
  Date: 2021/1/1
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>乡村官网主页</title>
</head>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript"></script>

<meta http-equiv="X-UA-Compatible" content="IE=Edge，chrome=1">
<meta name="format-detection" content="telephone=no,email=no,address=no">

<meta name="renderer" content="webkit">
<meta name="applicable-device" content="pc,mobile">
<script type="text/javascript" src=" ../html/files/isclose.asp"></script>
<script type="text/javascript" src=" ../html/files/jquery.min.js"></script>
<script type="text/javascript" src=" ../html/files/bootstrap.min.js"></script>
<link href=" ../html/files/bootstrap.min.css" rel="stylesheet">
<!--<link href=" ../html/files/style.csvalign="top"s" rel="stylesheet">-->
<script type="text/javascript" src=" ../html/files/msclass.js"></script>
<script type="text/javascript" src=" ../html/files/jquery.event.move.js"></script>

<link rel="shortcut icon" type="image/x-icon" href="http://cn.ganjiyihuo.com/favicon.ico">
<link rel="bookmark" type="image/x-icon" href="http://cn.ganjiyihuo.com/favicon.ico">

<title>乡村热点_中国美丽乡村旅游网</title>
<meta name="Keywords" content="">
<meta name="Description" content="">
<link rel="stylesheet" type="text/css" href=" ../html/files/list.css">
<link rel="stylesheet" type="text/css" href=" ../html/files/right.css">

<!--<base target="_blank">--><base href="." target="_blank">
<script type="text/javascript" src=" ../html/files/qrcode.js"></script>

<script src=" ../html/files/ti_u_5d92464c9a3c5f94.js"></script>
</head>
<body>
<link rel="stylesheet" type="text/css" href=" ../html/files/style(1).css">
<link rel="stylesheet" type="text/css" href=" ../html/files/main.css">
<link rel="stylesheet" type="text/css" href=" ../html/files/public.css">
<link rel="stylesheet" type="text/css" href=" ../html/files/hbcss.css">
<script src=" ../html/files/sity_data.js"></script>








<div class="container trblock clearfix " id="trblock178888">
    <div class=" col-lg-9" id="trleft178888">
        <%--<iframe scrolling="no" src="index_one.jsp"
                width="100%" height="800px"  frameborder="0" id="iframe">
        </iframe>--%>


        <div class="hlgd-title">
            <div class="hlgdttxt"><a href="http://cn.ganjiyihuo.com/list.asp?id=4">乡村热点</a></div>
            <hr>
        </div>

        <!--标题-->
        <div class="hlgd-content">

            <!--数据-->
            <e:forEach items="${StoryList}"  var="item">
                <c:if test="${StoryList!=null}">
                    <div class="hlgd-box">
                        <dl>
                            <dt class="dis">
                                <a target="_blank" href="http://cn.ganjiyihuo.com/show.asp?id=1093">
                                    <img width="250" height="165" border="0" alt="${item.name}" src="${item.img}">
                                </a>
                            </dt>
                            <a target="_blank" href="http://cn.ganjiyihuo.com/show.asp?id=1093"></a>
                            <dd class="">
                                <a target="_blank" href="http://cn.ganjiyihuo.com/show.asp?id=1093"></a>
                                <h3>
                                    <a target="_blank" href="http://cn.ganjiyihuo.com/show.asp?id=1093">
                                <span class="dj">
                                乡村热点
                                </span>
                                    </a>
                                    <a href="http://cn.ganjiyihuo.com/show.asp?id=1093"><b>${item.name}</b></a>
                                </h3>

                                <p> ${item.detail} </p>
                                <p>
                                        ${item.createTime}   &nbsp;&nbsp;&nbsp;        浏览量：${item.click}
                                </p>
                            </dd>
                        </dl>
                    </div>
                </c:if>
            </e:forEach>

        </div>

    </div>
</div>

<script>

    ////////////////////////////////////////////////修改界面
    function  pageTurn(node) {
        iframe = document.getElementById("iframe");
        iframe.src=node.title;
    }
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
</script>





</body>
</html>

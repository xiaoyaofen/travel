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

<title>乡村美景_中国美丽乡村旅游网</title>
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
            <div class="hlgdttxt"><a href="http://cn.ganjiyihuo.com/list.asp?id=4">乡村美景</a></div>
            <hr>
        </div>

        <!--标题-->
        <div class="hlgd-content">

            <!--数据-->



            <e:forEach items="${viewList}"  var="item">
                <c:if test="${viewList!=null}">
                <div class="hlgd-box">
                    <dl>
                        <dt class="dis">
                            <a target="_blank" href="http://cn.ganjiyihuo.com/show.asp?id=1093">
                                <img width="250" height="165" border="0" alt="${item.name}" src=" ../html/files/nian.jpg">
                            </a>
                        </dt>
                        <a target="_blank" href="http://cn.ganjiyihuo.com/show.asp?id=1093"></a>
                        <dd class="">
                            <a target="_blank" href="http://cn.ganjiyihuo.com/show.asp?id=1093"></a>
                            <h3>
                                <a target="_blank" href="http://cn.ganjiyihuo.com/show.asp?id=1093">
                                <span class="dj">
                                乡村美景
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


            <div class="hlgd-box">
                <dl>
                        <dt class="dis">
                            <a target="_blank" href="http://cn.ganjiyihuo.com/show.asp?id=1093">
                                <img width="250" height="165" border="0" alt="汶川阿坝的神仙村简直太美了，可惜少有人知道" src=" ../html/files/nian.jpg">
                            </a>
                        </dt>
                        <a target="_blank" href="http://cn.ganjiyihuo.com/show.asp?id=1093"></a>
                    <dd class="">
                            <a target="_blank" href="http://cn.ganjiyihuo.com/show.asp?id=1093"></a>
                        <h3>
                            <a target="_blank" href="http://cn.ganjiyihuo.com/show.asp?id=1093">
                                <span class="dj">
                                乡村美景
                                </span>
                             </a>
                            <a href="http://cn.ganjiyihuo.com/show.asp?id=1093"><b></b></a>
                        </h3>

                        <p>
                            “云端上的村落”萝卜寨是世界上最大、最古老的黄泥羌寨古寨旖旎风光依旧不瘦，引来无数游客青睐及喜爱，他们亲切的称之为“神仙村”萝卜寨建筑相当特别，很有特色古色古香的古强债黄泥巴墙是他的特点适合拍照的很，..
                        </p>
                        <p>
                            2018/11/16 10:05:40
                        </p>
                    </dd>
                </dl>
            </div>

            <%-- <div class="hlgd-box">
                <dl>
                    <dt class="dis">
                        <a target="_blank" href="http://cn.ganjiyihuo.com/show.asp?id=1094">
                            <img width="250" height="165" border="0" alt="中国这条“普通”的国道，最美最低调" src=" ../html/files/nian.jpg">
                        </a></dt><a target="_blank" href="http://cn.ganjiyihuo.com/show.asp?id=1094">
                </a><dd class=""><a target="_blank" href="http://cn.ganjiyihuo.com/show.asp?id=1094">
                </a><h3><a target="_blank" href="http://cn.ganjiyihuo.com/show.asp?id=1094">
                <span class="dj">
                乡村美景
                </span>
                </a><a href="http://cn.ganjiyihuo.com/show.asp?id=1094"><b>
                    中国这条“普通”的国道，最美最低调
                </b></a></h3>
                    <p>
                        国道是国家干线公路的简称，每条公路干线常采用三位数字作编号来表示。在我国，很多国道都是无数自驾者心中最理想、最原味、最传奇的选择，就如国道318线，被誉为“中国人的景观大道”，这条国道横跨中国东中西部，..
                    </p>
                    <p>
                        2018/11/16 10:06:30
                    </p>
                </dd></dl>
            </div>--%>

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

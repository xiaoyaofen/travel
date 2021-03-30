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
<script  src="${pageContext.request.contextPath}/layui/jframe.js"></script>
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
<%--<link rel="stylesheet" type="text/css" href=" ../html/files/public.css">--%>
<link rel="stylesheet" type="text/css" href=" ../html/files/hbcss.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/X-admin/css/xadmin.css">
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/X-admin/css/read.min.css">--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/X-admin/js/xadmin.js"></script>
<script src=" ../html/files/sity_data.js"></script>

<!---1--->

<div class="top1">
    <div class="wp clearfix">
        <div class="fl" style="font-size:12px;">
            <a  onclick="xadmin.open('登陆','${pageContext.request.contextPath}/jsp/user-login.jsp',470,250)">登录</a>
          <%--  <a href="http://www.ganjiyihuo.com/passport.html" mini-login="login">
                <span class="login_ico denglu_ico"></span>登录</a>
                |
                <a href="http://www.ganjiyihuo.com/passport-signup-member.html">注册</a>  | <a href="http://cn.ganjiyihuo.com/">返回主站</a>--%>
            | <a onclick="xadmin.open('注册账号','${pageContext.request.contextPath}/jsp/user-add.jsp',600,400)">注册</a>
            <c:if test="${userLogin!=null}">
                | <a>${userLogin.account}</a>
            </c:if>
            <c:if test="${userLogin==null}">
                | <a>未登录</a>
            </c:if>

        </div>


        <div class="fr " style="font-size:12px;">
            <!---城市---->


            </region>
            <!--<script type="text/javascript">(function(K, $){Widget.Region("88A1813A16DAAE71551765CEFE600659");})(window.KT, window.jQuery);</script>-->



            </p>

            </form>
            <style type="text/css">
                <!--
                .csch {

                    height: 2px;
                    width: 100ps;
                    position: absolute;
                    visibility: hidden;

                }
                -->
            </style>


            <script type="text/javascript">

                function gotocity(){

                    var city_id = $("select[name='data_city_id']")[0].value;

                    window.location.href=$('#city_'+city_id).attr("href");

                }

                (function(K, $){

                    $("#py_list a").click(function(){

                        $("#py_list a").removeClass("current");

                        $(this).addClass("current");

                        var py = $(this).attr("py");

                        $("#city_box a").removeClass("current");

                        $("#city_box a[py='"+py+"']").addClass("current");

                    });



                })(window.KT, window.jQuery);

            </script>


            <!---城市end---->

            <script type="text/javascript">

                $(document).ready(function() {

                    //头部登录后效果

                    $(".top_nav_login li").mouseover(function(){

                        $(this).find('.top_nav_login_son').show();

                    }).mouseout(function(){

                        $(this).find('.top_nav_login_son').hide();

                    });

                    $("font.tpApp ").mouseover(function(){

                        $(this).find('a.appLink').addClass('on');

                        $('font.tpApp ').find('.tpApp_box').show();

                    }).mouseout(function(){

                        $(this).find('a.appLink').removeClass('on');

                        $('font.tpApp ').find('.tpApp_box').hide();

                    });



                    $("font.tp_contactus ").mouseover(function(){

                        $(this).find('a.over').addClass('on');

                        $('font.tp_contactus ').find('.tp_contactus_box').show();

                        $('font.tp_contactus ').find('span.con_ico').addClass('con_ico_over');

                    }).mouseout(function(){

                        $(this).find('a.over').removeClass('on');

                        $('font.tp_contactus ').find('.tp_contactus_box').hide();

                        $('font.tp_contactus ').find('span.con_ico').removeClass('con_ico_over');

                    });

                })

            </script>

        </div>
    </div>
</div>
<!--banger---->

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="header_gs">
    <tbody><tr>
        <td valign="top">

            <img style="-webkit-user-select: none;max-width: 100%;margin: auto;background-color: hsl(0, 0%, 90%);transition: background-color 300ms;" src="http://cn.ganjiyihuo.com/img/banng.jpg">


        </td>
    </tr>
    </tbody></table>

<!--end----->


<div class="main_nav">

    <div class="mainwd hoverno" style="height: 100%">

        <ul>
            <table width="1100" border="0" align="center" cellpadding="0" cellspacing="0" style="height: 100%">
                <tbody><tr style="margin: auto"><%--style="margin-left: 500px;"--%>
                    <td><li><a  title="index_one.jsp" onclick="pageTurn(this)" style="margin-left: 500px;" >网站首页</a></li>
                        <li><a  title="/page/getViewList" onclick="pageTurn(this)">乡村美景</a></li>
                        <li><a  title="/page/getCountryEat" onclick="pageTurn(this)">当地特产</a></li>
                        <li><a  title="/page/getCountryNew" onclick="pageTurn(this)">乡村热点</a></li>
                        <li><a  title="/page/getCountryStory" onclick="pageTurn(this)">乡镇风采</a></li>
                    </td>
                </tr>
                </tbody></table>


        </ul>


    </div>

</div>





<iframe scrolling="no" src="index_one.jsp"
        width="100%" height="1500px"  frameborder="0" id="iframe">
</iframe>

<script>

    ////////////////////////////////////////////////修改界面

    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
</script>


<div class="container trad3">
    <!--<script type="text/javascript"> _55tr_com('tr5')</script>-->
</div>

<div class="trpublicline clearfix "> </div>
<div class="foot">
    <div class="footlink"><div class="wp">
        <a href="http://cn.ganjiyihuo.com/about.asp?id=650">关于我们 </a>
    </div>





    </div>
    <div class="footcon">
        主办单位：六只技术菜鸡的工作室 <br>
        联系电话：010000001 邮 箱：12389@163.com<br>
        地址：厦门88888号

    </div>
    <div>
        <style>
            .anquan{ width:800px; margin: 0 auto; padding-bottom:20px;}
            .anquan li{ width:110px; height:40px; border:1px solid #CCC; background-color:#FFF; padding:4px; line-height:20px; float:left; margin-left:20px;}
            .anname{ float:left; line-height:18px; width:60px; margin-top:2px;}
        </style>


        <div class="clear"></div>


    </div>
</div>

</body>
</html>

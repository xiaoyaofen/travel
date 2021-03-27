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
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href=" ../html/files/main.css">
<%--<link rel="stylesheet" type="text/css" href=" ../html/files/public.css">--%>
<link rel="stylesheet" type="text/css" href=" ../html/files/hbcss.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/X-admin/css/xadmin.css">
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/X-admin/css/read.min.css">--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/X-admin/js/xadmin.js"></script>
<link rel="stylesheet" href="css/master.css" />
<link rel="stylesheet" href="css/gloable.css" />
<link rel="stylesheet" href="css/nprogress.css" />
<link rel="stylesheet" href="css/blog.css" />
<script src=" ../html/files/sity_data.js"></script>

<!---1--->

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

                </tr>
                </tbody></table>


        </ul>


    </div>

</div>




<div class="doc-container" id="doc-container">
    <div class="container-fixed">
        <div class="col-content" style="width:100%">
            <div class="inner">
                <article class="article-list">
                    <input type="hidden" value="@Model.BlogTypeID" id="blogtypeid" />
                    <section class="article-item">
                        <aside class="title" style="line-height:1.5;">
                            <h4>${viewModel.name}</h4>
                            <p class="fc-grey fs-14">
                                <small class="ml10">浏览量：<i class="readcount">${viewModel.click}</i></small>
                                <small class="ml10">时间： <label>${viewModel.createTime}</label> </small>
                            </p>
                        </aside>

                        <div class="content artiledetail" style="border-bottom: 1px solid #e1e2e0; padding-bottom: 20px;">
                            ${viewModel.detail}
                              <div class="copyright mt20">
                                <p class="f-toe fc-black">
                                    非特殊说明，本文版权归 < 六只技术菜鸡的工作室 > 所有，转载请注明出处.
                                </p>
                            </div>
                        </div>
                        <div class="bdsharebuttonbox share" data-tag="share_1">
                            <ul>
                                <li class="f-praise"><span><a class="s-praise"></a></span></li>
                                <li class="f-weinxi"><a class="s-weinxi" data-cmd="weixin"></a></li>
                                <li class="f-sina"><a class="s-sina" data-cmd="tsina"></a></li>
                                <li class="f-qq" href="#"><i class="fa fa-qq"></i></li>
                                <li class="f-qzone"><a class="s-qzone" data-cmd="qzone"></a></li>
                            </ul>
                        </div>
                        <div class="f-cb"></div>
                        <div class="mt20 f-fwn fs-24 fc-grey comment" style="border-top: 1px solid #e1e2e0; padding-top: 20px;">
                        </div>
                        <fieldset class="layui-elem-field layui-field-title">
                            <legend>点赞文章</legend>
                            <div class="layui-field-box">
                                <div class="leavemessage" style="text-align:initial">
                                    <form class="layui-form blog-editor" action="">
                                        <input type="hidden" name="articleid" id="articleid" value="@Model.ID">
                                        <div class="layui-form-item">
                                            <textarea name="editorContent" lay-verify="content" id="remarkEditor" placeholder="请输入内容" class="layui-textarea layui-hide"></textarea>
                                        </div>
                                        <div class="layui-form-item">
                                            <button class="layui-btn" lay-submit="formLeaveMessage" lay-filter="formLeaveMessage">提交留言</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </fieldset>
                        <ul class="blog-comment" id="blog-comment"></ul>
                    </section>
                </article>
            </div>
        </div>
    </div>
</div>

<script src="js/yss/gloable.js"></script>
<script src="js/plugins/nprogress.js"></script>
<script src="js/pagecomment.js"></script>
<script>NProgress.start();</script>
<script>
    window.onload = function () {
        NProgress.done();
    };
</script>

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

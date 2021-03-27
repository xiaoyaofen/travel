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
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width" />
	<meta name="author" content="www.lzqcode.com" />
    <title>文章阅读</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/master.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/gloable.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/nprogress.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/blog.css" />
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
</head>
<body>


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
                                <small class="ml10">点赞量：<i class="readcount"><i class="layui-icon layui-icon-praise"></i>${viewModel.goodNum}</i></small>

                                <small class="ml10">时间： <label>${viewModel.createTime}</label> </small>
                            </p>
                        </aside>

                        <div class="content artiledetail" style="border-bottom: 1px solid #e1e2e0; padding-bottom: 20px;">
                            ${viewModel.detail}
<br>
                                <img src="${viewModel.img}"  style="width:70%;margin: 180px;margin-top: 20px;margin-bottom: 20px">
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
                                    <div class="layui-form-item">

                                            <button class="layui-btn"  onclick="goodNum()"  style="margin-left: 1100px"><i class="layui-icon layui-icon-praise"></i>点赞该文章</button>

                                    </div>
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

    <script src="${pageContext.request.contextPath}/jsp/js/yss/gloable.js"></script>
    <script src="${pageContext.request.contextPath}/jsp/js/plugins/nprogress.js"></script>
    <script src="${pageContext.request.contextPath}/jsp/js/pagecomment.js"></script>
<script>
    function goodNum(){
        $.ajax({
            url:"${pageContext.request.contextPath}/page/getGood",
            data: {
                "type": 1,
                "id":  ${viewModel.id},
            },
            method:'post',
            dataType:'text',
            success:function (data) {
                console.info(data)
                if (data=="1"){
                    layer.msg("感谢您的支持！");
                    window.location.reload()
                }else{
                    layer.msg("您还未登陆！请先登录");
                }
            }
        });
    }
</script>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script>NProgress.start();</script>

    <script> 
        window.onload = function () {
            NProgress.done();
        };



    </script>
</body>
</html>

<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../taglib.jsp" %>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>PFinance</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<style>
    .greenDiv {
        background-color: #b7c9ff;
    }

    .blueDiv {
        background-color: #84a8ff;
    }

    .sectionDiv {
        margin-top: 30px;
    }

    .header1 {
        font-size: 40px;
    }

    .header2 {
        font-size: 30px;
    }

    .header3 {
        font-size: 20px;
    }

    .header4 {
        font-size: 10px;
    }

    .borderDiv {
        border: 1px solid rgba(13, 2, 10, 0.94);
    }

</style>
<script>
    $(function () {
        $('#myTab a').click(function (e) {
            e.preventDefault();
            $(this).tab('show');
        });
        $("#home").load("index", function () {
            $('#financeButton').on('click', function (e) {
                a = $('#myTab a[href="#center"]');
                a.click();
            });
            $('#charactorButton').on('click', function (e) {
                a = $('#myTab a[href="#center"]');
                a.click();
//                $("#home").load("personalResult4Home");
            });
            $('#newsButton').on('click', function (e) {
                e.preventDefault();
                a = $('#myTab a[href="#news"]');
                alert(a.attr("href"));
//                $('#myTab a:last').tab('show');
                a.click();
            });
            $('#productButton').on('click', function (e) {
                e.preventDefault();
                a = $('#myTab a[href="#product"]');
                a.click();
            });
            $('#homeToQuestionEvaluate').on('click', function (e) {
                e.preventDefault();
                a = $('#myTab a[href="#pFinanace"]');
                a.click();
            });
        });
        $("#product").load("productIndex");
        $("#pFinanace").load("pFinanceIndex");
        $("#news").load("newsIndex");
        $("#center").load("personIndex");
        $("#comment").load("commentIndex");

//        alert(1);
//        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
//            // 获取已激活的标签页的名称
//            var activeTab = $(e.target).attr("href");
//            if (activeTab=="#home"){
//                $("#home").load("index");
//            } else if(activeTab=="#product"){
//                $("#product").load("productIndex");
//            } else if(activeTab=="#pFinanace"){
//                $("#pFinanace").load("pFinanceIndex");
//            } else if(activeTab=="#news"){
//                $("#news").load("newsIndex");
//            } else if(activeTab=="#center"){
//                $("#center").load("personIndex");
//            } else if(activeTab=="#comment"){
//                $("#comment").load("commentIndex");
//            }
//        });
    });

</script>
<%--<script>--%>
<%--$(function(){--%>
<%--$('#financeButton').on('click', function (e) {--%>
<%--// 获取已激活的标签页的名称--%>
<%--alert(2);--%>

<%--$("#home").load("personalProduct4Home");--%>
<%--});--%>
<%--$('#charactorButton').on('click', function (e) {--%>
<%--// 获取已激活的标签页的名称--%>
<%--alert(2);--%>

<%--//                $('#myTab a[href="#home"]').click();--%>
<%--$("#home").load("personalResult4Home");--%>
<%--});--%>
<%--$('#newsButton').on('click',function (e) {--%>
<%--alert(2);--%>
<%--$('#myTab a[href="#news"]').click();--%>
<%--alert(2);--%>

<%--});--%>
<%--$('#productButton').on('click',function (e) {--%>
<%--$('#myTab a[href="#product"]').tab(show);--%>
<%--});--%>
<%--});--%>
<%--</script>--%>

​
<div class="container">

    <nav class="navbar navbar-default" role="navigation">

        <div class="navbar-header">
            <a class="navbar-brand" href="#">PFinance</a>
        </div>
        <ul id="myTab" class="nav nav-tabs navbar-center col-md-offset-3">
            <li class="active"><a href="#home" data-toggle="tab">首页</a></li>
            <li><a href="#product" data-toggle="tab">理财产品</a></li>
            <li><a href="#pFinanace" data-toggle="tab">专属理财</a></li>
            <li><a href="#news" data-toggle="tab">资讯中心</a></li>
            <li><a href="#center" data-toggle="tab">个人中心</a></li>
            <li><a href="#comment" data-toggle="tab">意见箱</a></li>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
            </ul>
        </ul>
    </nav>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="home">


        </div>
        <%--</div>--%>


        <div class="tab-pane fade" id="product">

        </div>
        <div class="tab-pane fade" id="pFinanace">

        </div>
        <div class="tab-pane fade" id="news">
            <p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的 J2EE 上。
            </p>
        </div>
        <div class="tab-pane fade" id="center">
            <p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的 J2EE 上。
            </p>
        </div>
        <div class="tab-pane fade" id="comment">
            <p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的 J2EE 上。
            </p>
        </div>

    </div>

</div>
<script>
    $(function () {
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            // 获取已激活的标签页的名称
            var activeTab = $(e.target).text();
            // 获取前一个激活的标签页的名称
            var previousTab = $(e.relatedTarget).text();
            $(".active-tab span").html(activeTab);
            $(".previous-tab span").html(previousTab);
        });
    });
</script>
​
</body>
</html>

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
    <script src="http://apps.bdimg.com/libs/Chart.js/0.2.0/Chart.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/dwz/chart/raphael.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/dwz/chart/g.raphael.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/dwz/chart/g.bar.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/dwz/chart/g.line.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/dwz/chart/g.pie.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/echarts/3.5.4/echarts.common.js"></script>

</head>
<body style="background-color:rgb(253, 255, 191);">
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
        $("#home").load("index");
//        $("#product").load("productIndex");
//        $("#pFinanace").load("pFinanceIndex", function () {
//        });
//        $("#news").load("newsIndex");
//        $("#center").load("personIndex");
//        $("#comment").load("commentIndex");
        $('a[data-toggle="tab"]').on('click', function (e) {
            // 获取已激活的标签页的名称
            var activeTab = $(e.target).attr("href");
            if (activeTab=="#home"){
                $("#home").load("index");
            } else if(activeTab=="#product"){
                $("#product").load("productIndex");
            } else if(activeTab=="#pFinanace"){
                $("#pFinanace").load("pFinanceIndex", function () {
                });
            } else if(activeTab=="#news"){
                $("#news").load("newsIndex");
            } else if(activeTab=="#center"){
                $("#center").load("personIndex");
            } else if(activeTab=="#comment"){
                $("#comment").load("commentIndex");
            }
        });
    });


</script>

​
<div class="container" style="background-color: rgb(253, 255, 191);padding-left: 0px;padding-right: 0px;">

    <nav class="navbar navbar-default" role="navigation" style="background-color: #9ff5ef;height: 80px;">

        <div class="navbar-header" style="color: #e99647;font-size: 40px;height: 80px;margin-right: 20px;margin-top: 5px;">
            PFinance
        </div>
        <ul id="myTab" class="nav nav-tabs navbar-center col-md-offset-3" style="height: 80px;">
            <li class="active"><a href="#home" data-toggle="tab" style="line-height: 58px;font-size: 20px">首页</a></li>
            <li><a href="#product" data-toggle="tab" style="line-height: 58px;font-size: 20px">理财产品</a></li>
            <li><a href="#pFinanace" data-toggle="tab" style="line-height: 58px;font-size: 20px">专属理财</a></li>
            <li><a href="#news" data-toggle="tab" style="line-height: 58px;font-size: 20px">资讯中心</a></li>
            <li><a href="#center" data-toggle="tab" style="line-height: 58px;font-size: 20px">个人中心</a></li>
            <li><a href="#comment" data-toggle="tab" style="line-height: 58px;font-size: 20px">反馈小站</a></li>
            <ul class="nav navbar-nav navbar-right" style="height: 80px;">
                <%--<li><a href="#"><span class="glyphicon glyphicon-user"></span> 注册</a></li>--%>
                <li><a href="loginIndex" style="line-height: 58px;font-size: 20px"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
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
        </div>
        <div class="tab-pane fade" id="center">
        </div>
        <div class="tab-pane fade" id="comment">
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

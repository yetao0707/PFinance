<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp" %>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>详情</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<script>
//    $(function () {
//        //Get the context of the canvas element we want to select
//        var ctx = document.getElementById("myChart").getContext("2d");
//        var myNewChart = new Chart(ctx).PolarArea(data);
//        //Get context with jQuery - using jQuery's .get() method.
//        var ctx = $("#myChart").get(0).getContext("2d");
//        //This will get the first returned node in the jQuery collection.
//        var myNewChart = new Chart(ctx);
//    });
</script>

<div class="container">
    <div class="row">
        <div class="col-md-3">

        </div>
        <div class="col-md-6">

            <p>
            <h2>李小齐的理财特征报告</h2></p>
        </div>
        <div class="col-md-3">

        </div>
    </div>
    <div class="row">
        <div class="col-md-2">

        </div>
        <div class="col-md-8">

            <p>
            <h2>您属于：积累期 理想主义 保守型 理财人格</h2></p>
        </div>
        <div class="col-md-2">

        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <div class="row">
                <img src="3.jpg" alt=""/>
            </div>
            <div class="row">
                <p>家庭理财生命周期维度</p>
            </div>
        </div>
        <div class="col-md-9">

            <p>
                您处于家庭理财生命周期的累积阶段，这个阶段的你，</p><p>年纪较轻，处于家庭的形成期。收入以家庭核心成员的工资为主，追求较高的收入成长率，支出随着家庭成员的</p>增加而上升。在本阶段，随着家庭成员的增加您应提高寿险保额，信贷运用方面以信用卡和小额信贷为主，建议核心资产配置的大致比例是以股票为主，债券和货币为辅。</p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <div class="row">
                <img src="3.jpg" alt=""/>
            </div>
            <div class="row">
                <p>家庭理财生命周期维度</p>
            </div>
        </div>
        <div class="col-md-9">

            <p>
                您处于家庭理财生命周期的累积阶段，这个阶段的你，年纪较轻，处于家庭的形成期。
                收入以家庭核心成员的工资为主，追求较高的收入成长率，支出随着家庭成员的增加而上升
                。在本阶段，随着家庭成员的增加您应提高寿险保额，信贷运用方面以信用卡和小额信贷为主，
                建议核心资产配置的大致比例是以股票为主，债券和货币为辅。</p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <div class="row">
                <img src="3.jpg" alt=""/>
            </div>
            <div class="row">
                <p>家庭理财生命周期维度</p>
            </div>
        </div>
        <div class="col-md-9">

            <p>
                您处于家庭理财生命周期的累积阶段，这个阶段的你，年纪较轻，处于家庭的形成期。收入以家庭核心成员的工资为主，追求较高的收入成长率，支出随着家庭成员的增加而上升。在本阶段，随着家庭成员的增加您应提高寿险保额，信贷运用方面以信用卡和小额信贷为主，建议核心资产配置的大致比例是以股票为主，债券和货币为辅。</p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">

        </div>
        <div class="col-md-6">
            <p>综上所述，您的最佳资产配置比为：</p>
        </div>
        <div class="col-md-3">

        </div>
    </div>
    <div class="row">
        <div class="col-md-3">

        </div>
        <div class="col-md-6">
            <h2>股票型产品50%，债券型产品30%，货币型产品20%。
            </h2>
        </div>
        <div class="col-md-3">

        </div>

    </div>
    <div class="row">
        <div class="col-md-3">

        </div>
        <div class="col-md-6">
            <canvas id="myChart" width="400" height="400"></canvas>
        </div>
        <div class="col-md-3">

        </div>

    </div>
    <div class="row">
        <div class="col-md-3">

        </div>
        <div class="col-md-6">
            <button type="button" class="btn btn-primary btn-sm">理财推荐</button>
        </div>
        <div class="col-md-3">

        </div>

    </div>

</div>

</body>
</html>

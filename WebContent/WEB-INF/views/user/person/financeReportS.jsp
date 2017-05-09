<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp" %>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    $(function () {
        $("#reportRecommendButton").on("click", function () {
            $("#pFinanace").load("getPersonalFinance");
        })
    })
</script>
<style>
    .reportTitle {
        font-size: 40px;
        margin-top: 20px;
        color: #0099ff;
        padding-left: 300px;
    }

    .personDescIndex {
        font-size: 20px;
        margin-top: 30px;
        color: #ace795;
        padding-left: 300px;

    }

    .personDesc {
        color: #1400e4;
    }

    .personCharactor {
        margin-top: 30px;
        font-size: 20px;
    }

    .personCharactor.image {

    }
    .textDesc {
        margin-top: 30px;
        font-size: 30px;
        color: #7e936f;
    }
</style>

<div class="container">
    <div class="row reportTitle">
            李小齐的理财特征报告
    </div>
    <div class="row personDescIndex">
        <front>您属于：</front>
        <front class="personDesc">积累期 理想主义 保守型</front>
        <front>理财人格</front>
    </div>
    <div class="row personCharactor ">
        <div class="col-md-1">
        </div>
        <div class="col-md-3 text-right">
            <div class="row">
                <img src="<%=basePath%>images/daer.jpeg" alt="" class="img-responsive center-right"/>
            </div>
            <div class="row">
                <p>家庭理财生命周期维度</p>
            </div>
        </div>
        <div class="col-md-5">

            <p>
                您处于家庭理财生命周期的累积阶段，这个阶段的你，</p>
            <p>年纪较轻，处于家庭的形成期。收入以家庭核心成员的工资为主，追求较高的收入成长率，支出随着家庭成员的</p>
            增加而上升。在本阶段，随着家庭成员的增加您应提高寿险保额，信贷运用方面以信用卡和小额信贷为主，建议核心资产配置的大致比例是以股票为主，债券和货币为辅。</p>
        </div>
    </div>
    <div class="row personCharactor ">
        <div class="col-md-1">
        </div>
        <div class="col-md-3 text-right">
            <div class="row">
                <img src="<%=basePath%>images/daer.jpeg" alt="" class="img-responsive center-right"/>
            </div>
            <div class="row">
                <p>家庭理财生命周期维度</p>
            </div>
        </div>
        <div class="col-md-5">

            <p>
                您处于家庭理财生命周期的累积阶段，这个阶段的你，年纪较轻，处于家庭的形成期。
                收入以家庭核心成员的工资为主，追求较高的收入成长率，支出随着家庭成员的增加而上升
                。在本阶段，随着家庭成员的增加您应提高寿险保额，信贷运用方面以信用卡和小额信贷为主，
                建议核心资产配置的大致比例是以股票为主，债券和货币为辅。</p>
        </div>
    </div>
    <div class="row personCharactor">
        <div class="col-md-1">
        </div>
        <div class="col-md-3 text-right">
            <div class="row">
                <img src="<%=basePath%>images/daer.jpeg" alt="" class="img-responsive center-right"/>
            </div>
            <div class="row">
                <p>家庭理财生命周期维度</p>
            </div>
        </div>
        <div class="col-md-5">

            <p>
                您处于家庭理财生命周期的累积阶段，这个阶段的你，年纪较轻，处于家庭的形成期。收入以家庭核心成员的工资为主，追求较高的收入成长率，支出随着家庭成员的增加而上升。在本阶段，随着家庭成员的增加您应提高寿险保额，信贷运用方面以信用卡和小额信贷为主，建议核心资产配置的大致比例是以股票为主，债券和货币为辅。
            </p>
        </div>
    </div>
    <div class="row textDesc text-center">
        <p>综上所述，您的最佳资产配置比为：</p>
        <p>股票型产品50%，债券型产品30%，货币型产品20%。</p>
    </div>
    <div class="row">
        <div class="col-md-3">

        </div>
        <div class="col-md-6" style="height: 300px">
            <img src="<%=basePath%>images/test.png" alt="" class="img-responsive center-center"/>

            <%--<canvas id="myChart" width="400" height="400"></canvas>--%>
        </div>
        <div class="col-md-3">

        </div>

    </div>
    <div class="row text-center">
        <button type="button" class="btn btn-primary btn-lg center-block" id="reportRecommendButton" >理财推荐</button>


    </div>

</div>


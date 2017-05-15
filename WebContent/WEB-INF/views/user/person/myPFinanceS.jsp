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
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<style>

    .earnYes {
        font-size: 40px;
        color: #dba334;
    }
</style>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-2">
            <div class="row earnYes text-center">
                ${purchaseDTO.dayEarning}
            </div>
            <div class="row text-center" style="font-size: 30px;">
                昨日收益
            </div>

            <div class="row text-center">
                <front style="font-size: 30px">理财总额:</front>
                <front style="font-size: 30px;color: #dba334;">${purchaseDTO.purchaseSum}</front>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3 col-md-offset-1">

            <div class="row text-center" style="font-size: 30px;color: #dba334;">234</div>
            <div class="row text-center" style="font-size: 30px">累计收益（元）</div>
        </div>
        <div class="col-md-3 col-md-offset-2">

            <div class="row text-center" style="font-size: 30px;color: #dba334;">6.2380</div>
            <div class="row text-center" style="font-size: 30px">七日年化（%）</div>
        </div>
    </div>
    <div class="row ">
        <div class="col-md-10 sectionDiv">
            <table class="table">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>产品名称</th>
                    <th>产品类型</th>
                    <th>年化收益率（%）</th>
                    <th>购买金额（元）</th>
                    <th>购买日期</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${purchaseDTO.fundPurchaseDTOs}" var="pojo" varStatus="index">
                    <tr>
                        <td>${index.count}</td>
                        <td>${pojo.fundDTO.fundName}</td>
                        <td>
                            <c:choose>
                                <c:when test="${pojo.fundDTO.fundType==1}">
                                    货币型基金
                                </c:when>
                                <c:when test="${pojo.fundDTO.fundType==2}">
                                    债券型基金
                                </c:when>
                                <c:when test="${pojo.fundDTO.fundType==3}">
                                    基金型基金
                                </c:when>
                                <c:when test="${pojo.fundDTO.fundType==4}">
                                    混合型基金
                                </c:when>
                            </c:choose>
                        </td>
                        <td>${pojo.fundDTO.expectedYield }</td>
                        <td>${pojo.num}</td>
                        <td>${pojo.purchaseDate}</td>
                    </tr>
                </c:forEach>
                <c:forEach items="${purchaseDTO.currencyPurchaseDTOs}" var="pojo" varStatus="index">
                    <tr>
                        <td>${purchaseDTO.fundPurchaseDTOs.size()+index.count}</td>
                        <td>${pojo.currencyDTO.currencyName}</td>
                        <td>货币型产品</td>
                        <td>${pojo.currencyDTO.profitYield }</</td>
                        <td>${pojo.num}</td>
                        <td>${pojo.purchaseDate}</td>
                    </tr>
                </c:forEach>


                </tbody>
            </table>
        </div>
    </div>
    <div class="row sectionDiv">
        <div class="col-md-10 sectionDiv">

            <table class="table">
                <caption>历史交易</caption>

                <thead>
                <tr>
                    <th>序号</th>
                    <th>产品名称</th>
                    <th>产品类型</th>
                    <th>年化收益率（%）</th>
                    <th>购买金额（元）</th>
                    <th>购买日期</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

</div>

</body>
</html>

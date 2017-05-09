<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp"%>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<script>
    $(function(){
        $("#singlePurchaseBackButton").on("click",function () {
            if (localStorage.purchaseType==1) {
                $("#product").load("currencyDetail?id=" + localStorage.purchaseProductId);
            }else {
                $("#product").load("fundDetail?id=" + localStorage.purchaseProductId);
            }
        });
        $("#singlePpurchaseBuyButton").on("click",function(){
            localStorage.purchaseMoney = $("#buyMoneyInput").val();
            $("#product").load("customerRead");
        });
        $("#singlePurchaseMoneyConfirmButton").on("click",function () {
            $(".moneyP").text($("#buyMoneyInput").val());

            $("#hiddenDefaultDiv").attr("hidden", false);

        })
    });
</script>
<style>
    .purchaseGroup {
        margin-left: 300px;
    }
    .header {
        margin-top: 30px;
        font-size: 40px;
    }
    .recommendProjectBuyDiv {
        size: 300px;
    }
</style>
<div class="container">
    <div class="row input-group col-md-6 purchaseGroup sectionDiv">
        <span class="input-group-addon">购买金额(元):</span>
        <input type="text" class="form-control" id="buyMoneyInput">
        <span class="input-group-btn">
                <button type="button" class="btn btn-primary btn-sm"
                        id="singlePurchaseMoneyConfirmButton">确定</button>
             </span>
    </div>
    <div class="row" id="hiddenDefaultDiv"  hidden="true">

    <div class="row header">
        您将购买以下产品
    </div>
    <div class="row">

        <table class="table">
            <thead>
            <tr>
                <th>序号</th>
                <th>产品名称</th>
                <th>产品类型</th>
                <th>年化收益率（%）</th>
                <th>购买金额（元）</th>
                <th>投资时长（天）</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <c:if test="${type==1}">
                    <td>1</td>
                    <td>${dto.currencyName}</td>
                    <td><p>货币型产品</p></td>
                    <td>${dto.profitYield}</td>
                    <td><p class="moneyP"></p></td>
                    <td>${dto.durationDays}</td>
                </c:if>
                <c:if test="${type==2}">
                    <td>1</td>
                    <td>${dto.fundName}</td>
                    <td><p>基金型产品</p></td>
                    <td>${dto.id}</td>
                    <td><p class="moneyP"></p></td>
                    <td>${dto.duration}</td>
                </c:if>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="col-md-6">
                <button type="button" class="btn btn-primary btn-sm" id="singlePurchaseBackButton">返回</button>
            </div>
            <div class="col-md-6">
                <button type="button" class="btn btn-primary btn-sm" id="singlePpurchaseBuyButton">开始交易</button>
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>
    </div>

</div>


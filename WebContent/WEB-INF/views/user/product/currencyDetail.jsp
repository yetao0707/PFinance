<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp" %>

<%@page session="false" %>
<%@ page isELIgnored="false" %>
<script>
    $(function () {
        $("#currencyDetailBackButton").on("click", function () {
            $("#product").load("productIndex");
        });
        $("#currencyDetailBuyButton").on("click", function () {
            localStorage.purchaseProductId = $("#currencyPurchaseId").val();
            localStorage.purchaseType = 1;
            $("#product").load("singlePurchase", {
                paramStr: localStorage.purchaseProductId + "_" + localStorage.purchaseType
            });
        });
    });
</script>
<style>
    .borderDiv {
        border: 1px solid rgba(147, 144, 151, 0.94);
    }
</style>


<div class="row container">
    <div class="row sectionDiv col-md-offset-2 col-md-8" style="background-color: #bffaff">
        <div class="row">
            <div class="col-md-2">
                <p>
                    <button type="button" class="btn btn-primary btn-lg" id="currencyDetailBackButton">返回</button>
                    <input type="text" hidden="hidden" value="${dto.id}" id="currencyPurchaseId">
                </p>
            </div>
            <div class="col-md-8 text-center">

                <div class="row" style="font-size: 30px;margin-top: 20px">${dto.currencyName}</div>
                <div class="row" style="font-size: 20px;margin-top: 20px">${dto.registerId}</div>
                <div class="row" style="font-size: 15px;margin-top: 40px">
                    标签: 货币型产品 管理人 : PFinance银行股份有限公司
                </div>
            </div>
            <div class="col-md-2">

                <div class="text-right" style="margin-top: 160px">
                    <button type="button" class="btn btn-primary btn-sm" id="currencyDetailBuyButton">立即购买</button>
                </div>
            </div>

        </div>

    </div>
    <div class="row sectionDiv col-md-offset-2 col-md-8" style="background-color: #bffaff;padding-left: 50px;padding-bottom: 50px;">
        <div class="row sectionDiv" >
            <div class="row" >
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    PFinance银行股份有限公司
                </div>
                <div class="col-md-6 borderDiv text-center header3">
                    ${dto.registerId}
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    产品类型
                </div>
                <div class="col-md-6 borderDiv text-center header3">
                    货币型产品
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    认购起始日
                </div>
                <div class="col-md-6 borderDiv text-center header3">
                    ${dto.subscriptionStartDate}
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    认购结束日
                </div>
                <div class="col-md-6 borderDiv text-center header3">
                    ${dto.subscriptionEndDate}
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    成立日
                </div>
                <div class="col-md-6 borderDiv text-center header3">
                    ${dto.foundingDate}
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    到期兑付日
                </div>
                <div class="col-md-6 borderDiv text-center header3">
                    ${dto.cashingDay}
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    起购金额（元）
                </div>
                <div class="col-md-6 borderDiv text-center header3">
                    ${dto.purchaseAmount}
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    续买递增金额（元）
                </div>
                <div class="col-md-6 borderDiv text-center header3">
                    ${dto.incrementalAmount}
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    客户年化参考收益率
                </div>
                <div class="col-md-6 borderDiv text-center header3">
                    ${dto.cashingDay}
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    客户年化参考收益率
                </div>
                <div class="col-md-6 borderDiv text-center header3">
                    ${dto.profitYield}
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    购买渠道
                </div>
                <div class="col-md-6 borderDiv text-center header3">
                    ${dto.purchaseChannel}
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    拟募集规模（亿）
                </div>
                <div class="col-md-6 borderDiv text-center header3">
                    ${dto.recruitmentScale}
                </div>
            </div>
        </div>
    </div>
</div>


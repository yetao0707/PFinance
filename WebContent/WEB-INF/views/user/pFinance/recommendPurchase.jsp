<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp" %>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<script>
    $(function () {
        $("#recommendPurchaseBackButton").on("click", function () {
            $("#pFinanace").load("pFinanceIndex");

        });
        $("#recommendPurchaseBuyButton").on("click", function () {
            var str = "";
            $(".recommendProjectBuyDiv").each(function () {
                if ($(this).find("input:checkbox").is(":checked")) {
                    var moneyInput = $(this).find("input:text");
                    str = str + moneyInput.attr("id") + "_" + moneyInput.val() + ",";
                }
            });
            str = str.substring(0, str.length - 1);
            alert(str);
            localStorage.paramStr = str;
            $("#pFinanace").load("pFinanceCustomerRead");
        });
        $("#recommendPurchaseMoneyConfirmButton").on("click", function () {
            localStorage.moneyToBuy = $("#buyMoneyInput").val();
            $("#pFinanace").load("getPersonalFinance?money=" + $("#buyMoneyInput").val(), function () {
                $("#hiddenDefaultDiv").attr("hidden", false);
            });


        });
    });
</script>
<style>
    .purchaseGroup {
        margin-left: 300px;
    }
</style>
<div class="container">
    <div class="row" style="height: 50px"></div>
    <div class="row input-group col-md-6 purchaseGroup">
        <span class="input-group-addon">购买金额(元):</span>
        <input type="text" class="form-control" id="buyMoneyInput">
        <span class="input-group-btn">
                <button type="button" class="btn btn-primary btn-sm"
                        id="recommendPurchaseMoneyConfirmButton">确定</button>
             </span>
    </div>

    <div class="row text-center" id="hiddenDefaultDiv" hidden="true">

        <div class="row">
            <p class="text-center">您将购买以下产品</p>
        </div>
        <div class="row">

            <table class="table">
                <caption>基本的表格布局</caption>
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
                <c:forEach items="${recommendDTO.recommendCurrencys}" var="pojo" varStatus="index">
                    <tr>
                        <td>${index.count}</td>
                        <td>${pojo.currencyName}</td>
                        <td><p>货币型产品</p></td>
                        <td>${pojo.profitYield}</td>
                        <td><p class="moneyP"></p></td>
                        <td>${pojo.durationDays}</td>
                    </tr>
                </c:forEach>
                <c:forEach items="${recommendDTO.recommendFunds}" var="pojo" varStatus="index">
                    <tr>
                        <td>${recommendDTO.recommendCurrencys.size()+index.count}</td>
                        <td>${pojo.fundName}</td>
                        <td><p>基金型产品</p></td>
                        <td>${pojo.id}</td>
                        <td><p class="moneyP"></p></td>
                        <td>${pojo.duration}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="row">
                <p>请选择要购买的产品和交易顺序</p>
            </div>
            <div class="row">
                <p>请选择要购买的产品和交易顺序</p>
            </div>
            <div class="row">
                <c:forEach items="${recommendDTO.recommendCurrencys}" var="pojo" varStatus="index">
                    <div class="row recommendProjectBuyDiv">
                        <div class="col-md-3">
                            <input type="text" class="inputMoney" id="${pojo.id}_1" value="${pojo.recommendMoney2Buy}">
                        </div>
                        <div class="col-md-3">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" checked="checked">
                                    <p>${pojo.currencyName}</p>
                                </label>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:forEach items="${recommendDTO.recommendFunds}" var="pojo" varStatus="index">
                    <div class="row recommendProjectBuyDiv">
                        <div class="col-md-3">
                            <input type="text" class="inputMoney2" id="${pojo.id}_2" value="${pojo.recommendMoney2Buy}">
                        </div>
                        <div class="col-md-3">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" checked="checked">
                                    <p>${pojo.fundName}</p>
                                </label>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="col-md-6">
                    <button type="button" class="btn btn-primary btn-sm" id="recommendPurchaseBackButton">返回</button>
                </div>
                <div class="col-md-6">
                    <button type="button" class="btn btn-primary btn-sm" id="recommendPurchaseBuyButton">开始交易</button>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>

</div>


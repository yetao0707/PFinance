<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp"%>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<script>
    $(function () {
        $("#protocolBackButton").on("click",function () {
            $("#product").load("customerRead");
        });
        $("#protocolNextButton").on("click",function () {
            if($("input:checkbox").is(":checked")) {
                $("#product").load("purchaseConfirm",{
                    paramStr:localStorage.purchaseProductId+"_"+localStorage.purchaseType+"_"+localStorage.purchaseMoney
                });
            }else {
                alert("请阅读协议内容!");
            }
        })
    });
</script>
<div class="container">
    <div class="row">
        <p class="text-center"><h1>PFinance理财产品客户协议书</h1></p>
    </div>
    <div class="row">
        <p class="text-center"><h3>尊敬的客户：为了保护您的合法权益，请您在投资理财产品前认真阅读以下内容</h3></p>
    </div>
    <div class="row" style="height: 100px;">
        <div class="row">
            <div class="checkbox">
                <label>
                    <input type="checkbox"><p>我已认真阅读《PFinance理财产品客户协议书》，并同意遵守此协议</p>
                </label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">

        </div>
        <div class="col-md-4">
            <div class="row">
                <div class="col-md-6">
                    <button type="button" class="btn btn-primary btn-sm" id="protocolBackButton">返回上一步</button>
                </div>
                <div class="col-md-6">
                    <button type="button" class="btn btn-primary btn-sm" id="protocolNextButton">下一步</button>
                </div>
            </div>
        </div>
        <div class="col-md-4">

        </div>
    </div>

</div>


<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp"%>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<script>
    $(function () {
        $("#customerReadBacButton").on("click",function () {
            $("#product").load("singlePurchase",{
                paramStr:localStorage.purchaseProductId+"_"+localStorage.purchaseType
            });
        });
        $("#customerReadNextButton").on("click",function () {
            if($("input:checkbox").is(":checked")) {
                $("#product").load("protocolRead");
            }else {
                alert("请阅读协议内容!");
            }
        })

    });
</script>

<style>
    .header1 {
        font-size: 30px;
        margin-top: 30px;
    }

    .header2 {
        font-size: 20px;
        margin-top: 30px;

    }
    .customerReadContent {
        height: 200px;
        margin-top: 30px;
        overflow:auto;

    }
</style>

<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="row header1 text-center">
                PFinance理财产品客户权益须知
            </div>
            <div class="row header2 text-center">
                尊敬的客户：为了保护您的合法权益，请您在投资理财产品前认真阅读以下内容
            </div>
            <div class="row text-center customerReadContent">
                <p>
                    尊敬的客户：为了保护您的合法权益，请您在投资理财产品前认真阅读以下内容
                    尊敬的客户：为了保护您的合法权益，请您在投资理财产品前认真阅读以下内容
                    尊敬的客户：为了保护您的合法权益，请您在投资理财产品前认真阅读以下内容
                    尊敬的客户：为了保护您的合法权益，请您在投资理财产品前认真阅读以下内容
                    尊敬的客户：为了保护您的合法权益，请您在投资理财产品前认真阅读以下内容
                    尊敬的客户：为了保护您的合法权益，请您在投资理财产品前认真阅读以下内容
                    尊敬的客户：为了保护您的合法权益，请您在投资理财产品前认真阅读以下内容
                    尊敬的客户：为了保护您的合法权益，请您在投资理财产品前认真阅读ddd以下内容
                    尊敬的客户：为了保护您的合法权益，请您在投资理财产品前认真阅读ddd以下内容
                    尊敬的客户：为了保护您的合法权益，请您在投资理财产品前认真阅读ddd以下内容
                    尊敬的客户：为了保护您的合法权益，请您在投资理财产品前认真阅读ddd以下内容
                    尊敬的客户：为了保护您的合法权益，请您在投资理财产品前认真阅读ddd以下内容
                    尊敬的客户：为了保护您的合法权益，请您在投资理财产品前认真阅读ddd以下内容
                    尊敬的客户：为了保护您的合法权益，请您在投资理财产品前认真阅读ddd以下内容
                </p>
            </div>
            <div class="row sectionDiv" >
                <div class="checkbox">
                    <label>
                        <input type="checkbox">
                        <p>我已认真阅读《PFinance理财产品客户权益须知》，并同意遵守须知的约定</p>
                    </label>
                </div>
            </div>
            <div class="row sectionDiv">
                <div class="col-md-4">

                </div>
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-6">
                            <button type="button" class="btn btn-primary btn-sm " id="customerReadBacButton">返回上一步
                            </button>
                        </div>
                        <div class="col-md-6">
                            <button type="button" class="btn btn-primary btn-sm" id="customerReadNextButton">下一步
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                </div>
            </div>
        </div>
    </div>


</div>

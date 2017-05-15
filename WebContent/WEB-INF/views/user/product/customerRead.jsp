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

<div class="container" style="background-color: #9ff5ef">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="row header1 text-center">
                PFinance理财产品客户权益须知
            </div>
            <div class="row header2 text-center">
                尊敬的客户：为了保护您的合法权益，请您在投资理财产品前认真阅读以下内容
            </div>
            <div class="row customerReadContent" style="text-indent: 2em;font-size: 15px;">
                <p>
                    (一）	个人客户在我行网点购买理财产品，需持在我行开立的活期存款账户（理财卡、储蓄卡或活期存折等）作为交易账户，并出示本人有效身份证件原件。机构客户在我行网点购买理财产品，需持在我行开立的基本存款账户或一般存款账户作为交易介质（不允许使用临时账户、贷转存一般存款账户或专用账户）。机构客户法定代表人或单位负责人办理，需持组织机构代码证、营业执照正本复印件、法定代表人或单位负责人有效身份证件原件；授权其代理人办理时，应由代理人提供组织机构代码证、营业执照正本复印件、授权委托书、代理人有效身份证件原件在开户行对公柜台办理。通过其他渠道（包括但不限于网上银行等）购买理财产品须遵从我行相关规定。
                </p>
                <p>
                （二）	您在首次购买我行理财产品前，需在我行网点进行风险承受能力评估。超出评估有效期或在有效期内您的风险承受能力发生变化的，再次购买理财产品时，您需要重新进行评估，请您主动在我行网点或通过网上银行进行风险承受能力评估。客户风险评估结果按风险承受能力从弱到强分为5级：保守型、收益型、稳健型、进取型、积极进取型。请您根据您的风险承受能力评估结果选择与您风险承受能力相匹配的理财产品。您的风险承受能力评估结果应以您在购买理财产品前的最近一次有效评估结果为准，请您参考该次评估结果来选择与您风险承受能力相匹配的理财产品。如果您在理财产品持有期间发生风险承受能力变化，导致您购买的理财产品与您自身风险承受能力不匹配的，对于您依据产品说明书约定有权提前赎回的理财产品，建议您尽快赎回；但是，对于您依据产品说明书约定没有权利提前赎回的理财产品，您将无权以风险承受能力不再匹配为由进行赎回，所以，请您在投资前审慎决策。
                </p>
            </div>
            <div class="row sectionDiv" style="font-size: 15px;">
                <div class="checkbox">
                    <label>
                        <input type="checkbox">
                        <p>我已认真阅读《PFinance理财产品客户权益须知》，并同意遵守须知的约定</p>
                    </label>
                </div>
            </div>
            <div class="row sectionDiv" style="margin-bottom: 100px;">
                <div class="col-md-4">

                </div>
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-6">
                            <button type="button" class="btn btn-primary btn-lg " id="customerReadBacButton">返回上一步
                            </button>
                        </div>
                        <div class="col-md-6">
                            <button type="button" class="btn btn-primary btn-lg" id="customerReadNextButton">下一步
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

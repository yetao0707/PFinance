<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp" %>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<script>
    $(function () {
        $("#purchaseConfirmBackButton").on("click", function () {
            $("#product").load("protocolRead");
        });
        $("#purchaseConfirmBuyButton").on("click", function () {
            if (localStorage.paramStr == undefined) {
                localStorage.paramStr = localStorage.purchaseProductId + "_" + localStorage.purchaseType + "_" + localStorage.purchaseMoney;
            }
            $.ajax({
                type: "POST",
                url: "purchase",
                data: {
                    paramStr: localStorage.paramStr
                },
                dataType: "json",
                success: function (result) {
                    alert(result.errMsg);
                }
            });
            localStorage.removeItem("paramStr");
        })
    });
</script>
<style>

</style>

<div class="container">
    <div class="row">
        <div class="col-md-2">

        </div>
        <div class="col-md-8">
            <div class="row sectionDiv header1 text-center">
                理财产品购买确认
            </div>
            <div class="row sectionDiv text-left header2 text-left">
                尊敬的客户：
            </div>
            <div class="row sectionDiv header2 text-center">
                <front>姓名:</front>
                <front class="text-center">${customerDTO.userName}</front>
            </div>
            <div class="row sectionDiv header2 text-center">
                <front>购买金额:</front>
                <front class="text-center">${money}</front>
            </div>
            <div class="row sectionDiv header2 text-left">
                产品信息:
            </div>
            <div class="row sectionDiv">
                <c:forEach items="${currencyDTOS}" var="pojo">
                    <div class="row sectionDiv">
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                产品名称
                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                    ${pojo.currencyName}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                购买金额:
                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                    ${pojo.recommendMoney2Buy}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                产品登记码
                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                    ${pojo.registerId}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                产品类型
                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                    ${pojo.productType}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                预期年化（%）
                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                    ${pojo.tradeRate}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                产品期限（天）
                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                    ${pojo.tradeRate}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                销售管理费率（%）                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                    ${pojo.currencyName}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                成立日                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                    ${pojo.foundingDate}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                到期日                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                    ${pojo.dueDate}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                兑付日                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                    ${pojo.cashingDay}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                管理人                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                PFinance银行股份有限公司
                            </div>
                        </div>


                    </div>

                </c:forEach>
                <c:forEach items="${fundDTOs}" var="pojo">
                    <div class="row sectionDiv">
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                产品名称
                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                    ${pojo.fundName}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                购买金额:
                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                    ${pojo.recommendMoney2Buy}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                产品登记码
                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                    ${pojo.registerId}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                产品类型
                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                    ${pojo.fundType}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                预期年化（%）
                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                    ${pojo.expectedYield}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                推广起始日
                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                    ${pojo.startDate}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                推广截止日                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                    ${pojo.endDate}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                管理人                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                PFinance银行股份有限公司
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 borderDiv text-center header3">
                                托管人                            </div>
                            <div class="col-md-8 borderDiv text-center header3">
                                PFinance银行股份有限公司
                            </div>
                        </div>


                    </div>

                </c:forEach>

            </div>
            <div class="row sectionDiv">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="col-md-6">
                        <button type="button" class="btn btn-primary btn-sm" id="purchaseConfirmBackButton">返回上一步
                        </button>
                    </div>
                    <div class="col-md-6">
                        <button type="button" class="btn btn-primary btn-sm" id="purchaseConfirmBuyButton">确认购买</button>
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
        <div class="col-md-2">

        </div>
    </div>


</div>


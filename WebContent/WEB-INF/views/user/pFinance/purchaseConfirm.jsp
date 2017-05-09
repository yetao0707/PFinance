<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp"%>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<script>
    $(function () {
        $("#purchaseConfirmBackButton").on("click",function () {
            $("#pFinanace").load("pFinanceProtocolRead");
        });
        $("#purchaseConfirmBuyButton").on("click",function () {
            alert(localStorage.paramStr);
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
                                购买金额
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

<%--<div class="container">--%>
    <%--<div class="row">--%>
        <%--<p class="text-center"><h2>理财产品购买确认</h2></p>--%>
    <%--</div>--%>
    <%--<div class="row">--%>
        <%--<p class="text-left"><h3>尊敬的客户：</h3></p>--%>
    <%--</div>--%>
    <%--<div class="row">--%>
        <%--<label>姓名:</label><p class="text-center">${customerDTO.userName}</p>--%>
    <%--</div>--%>
    <%--<div class="row">--%>
        <%--<label>购买金额</label><p class="text-center">${money}</p>--%>
    <%--</div>--%>
    <%--<div class="row">--%>
        <%--<p>产品信息:</p>--%>
    <%--</div>--%>
    <%--<div class="row">--%>
        <%--<c:forEach items="${currencyDTOS}" var="pojo">--%>
            <%--<div class="row">--%>
                <%--<div class="col-md6">--%>
                    <%--<p class="text-center">--%>
                        <%--产品名称--%>
                    <%--</p>--%>
                <%--</div>--%>
                <%--<div class="col-md6">--%>
                    <%--<p class="text-center">--%>
                        <%--${pojo.currencyName}--%>
                    <%--</p>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="row">--%>
                <%--<div class="col-md6">--%>
                    <%--<p class="text-center">--%>
                        <%--产品名称--%>
                    <%--</p>--%>
                <%--</div>--%>
                <%--<div class="col-md6">--%>
                    <%--<p class="text-center">--%>
                            <%--${pojo.currencyName}--%>
                    <%--</p>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="row">--%>
                <%--<div class="col-md6">--%>
                    <%--<p class="text-center">--%>
                        <%--产品名称--%>
                    <%--</p>--%>
                <%--</div>--%>
                <%--<div class="col-md6">--%>
                    <%--<p class="text-center">--%>
                            <%--${pojo.currencyName}--%>
                    <%--</p>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="row">--%>
                <%--<div class="col-md6">--%>
                    <%--<p class="text-center">--%>
                        <%--产品名称--%>
                    <%--</p>--%>
                <%--</div>--%>
                <%--<div class="col-md6">--%>
                    <%--<p class="text-center">--%>
                            <%--${pojo.currencyName}--%>
                    <%--</p>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="row">--%>
                <%--<div class="col-md6">--%>
                    <%--<p class="text-center">--%>
                        <%--产品名称--%>
                    <%--</p>--%>
                <%--</div>--%>
                <%--<div class="col-md6">--%>
                    <%--<p class="text-center">--%>
                            <%--${pojo.currencyName}--%>
                    <%--</p>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</c:forEach>--%>
    <%--</div>--%>
    <%--<div class="row">--%>
        <%--<div class="col-md-3"></div>--%>
        <%--<div class="col-md-6">--%>
            <%--<div class="col-md-6">--%>
                <%--<button type="button" class="btn btn-primary btn-sm" id="purchaseConfirmBackButton">返回上一步</button>--%>
            <%--</div>--%>
            <%--<div class="col-md-6">--%>
                <%--<button type="button" class="btn btn-primary btn-sm" id="purchaseConfirmBuyButton">确认购买</button>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="col-md-3"></div>--%>
    <%--</div>--%>

<%--</div>--%>


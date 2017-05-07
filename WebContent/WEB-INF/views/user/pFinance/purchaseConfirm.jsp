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
        <p class="text-center"><h2>理财产品购买确认</h2></p>
    </div>
    <div class="row">
        <p class="text-left"><h3>尊敬的客户：</h3></p>
    </div>
    <div class="row">
        <label>姓名:</label><p class="text-center">${customerDTO.userName}</p>
    </div>
    <div class="row">
        <label>购买金额</label><p class="text-center">${money}</p>
    </div>
    <div class="row">
        <p>产品信息:</p>
    </div>
    <div class="row">
        <c:forEach items="${currencyDTOS}" var="pojo">
            <div class="row">
                <div class="col-md6">
                    <p class="text-center">
                        产品名称
                    </p>
                </div>
                <div class="col-md6">
                    <p class="text-center">
                        ${pojo.currencyName}
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md6">
                    <p class="text-center">
                        产品名称
                    </p>
                </div>
                <div class="col-md6">
                    <p class="text-center">
                            ${pojo.currencyName}
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md6">
                    <p class="text-center">
                        产品名称
                    </p>
                </div>
                <div class="col-md6">
                    <p class="text-center">
                            ${pojo.currencyName}
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md6">
                    <p class="text-center">
                        产品名称
                    </p>
                </div>
                <div class="col-md6">
                    <p class="text-center">
                            ${pojo.currencyName}
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md6">
                    <p class="text-center">
                        产品名称
                    </p>
                </div>
                <div class="col-md6">
                    <p class="text-center">
                            ${pojo.currencyName}
                    </p>
                </div>
            </div>
        </c:forEach>
        <table class="table">
            <caption>预计理财收益（元）</caption>
            <thead>
            <tr>
                <th>产品名称</th>
                <th>产品登记码</th>
                <th>成立日</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="col-md-6">
                <button type="button" class="btn btn-primary btn-sm" id="purchaseConfirmBackButton">返回上一步</button>
            </div>
            <div class="col-md-6">
                <button type="button" class="btn btn-primary btn-sm" id="purchaseConfirmBuyButton">确认购买</button>
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>

</div>


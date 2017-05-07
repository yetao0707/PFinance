<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp"%>
<%@page session="false" %>
<%@ page isELIgnored="false" %>

<script>
    $(function(){
        $("#fundDetailBackButton").on("click",function(){
            $("#product").load("productIndex");
        });
        $("#fundDetailBuyButton").on("click",function(){
            localStorage.purchaseProductId = $("#fundPurchaseId").val();
            localStorage.purchaseType=2;
            $("#product").load("singlePurchase",{
                paramStr:localStorage.purchaseProductId+"_"+localStorage.purchaseType
            });
        });
    });
</script>


<div class="container">
    <div class="row">
        <div class="row">
            <div class="col-md-3">
                <p>
                    <button type="button" class="btn btn-primary btn-sm" id="fundDetailBackButton">返回</button>
                    <input type="text" hidden="hidden" value="${dto.id}" id="fundPurchaseId">
                </p>
            </div>
            <div class="col-md-3">
                <p>name</p>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6">
                        <p>单位净值：${dto.id}1.03 元</p>
                        <p>累计净值：1.52 元</p>
                    </div>
                    <div class="col-md-6">
                        <p>月：10.52%↑</p>
                        <p>周：10.52%↑</p>
                        <p>日：10.52%↑</p>
                    </div>

                </div>
                <div>
                    <button type="button" class="btn btn-primary btn-sm" id="fundDetailBuyButton">立即购买</button>
                </div>
            </div>

        </div>

    </div>
    <div class="row" style="height: 50px"></div>
    <div>
        <table class="table">
            <tbody>
            <tr>
                <td>产品成立日</td>
                <td><p>${dto.foundingDate}</p></td>
            </tr>
            <tr>
                <td>计划类型</td>
                <td>Mumbai</td>
            </tr>
            <tr>
                <td>管理人</td>
                <td><p></p></td>
            </tr>
            <tr>
                <td>托管人</td>
                <td><p></p></td>
            </tr>
            <tr>
                <td>推广起始日</td>
                <td><p></p></td>
            </tr>
            <tr>
                <td>推广截止日</td>
                <td><p></p></td>
            </tr>
            <tr>
                <td>存续期</td>
                <td><p></p></td>
            </tr>
            <tr>
                <td>募集资金</td>
                <td><p></p></td>
            </tr>
            <tr>
                <td>最低参与金额</td>
                <td><p></p></td>
            </tr>
            <tr>
                <td>投资目标</td>
                <td><p></p></td>
            </tr>
            </tbody>
        </table>
    </div>

</div>




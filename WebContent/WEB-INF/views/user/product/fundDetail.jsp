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

<style>
    .borderDiv {
        border: 1px solid rgba(147, 144, 151, 0.94);
    }
    .tableLeft {
        color: #72fff8;
    }
</style>


<div class="row container">
    <div class="row sectionDiv col-md-offset-2 col-md-8" style="background-color: #bffaff">
        <div class="row">
            <div class="col-md-2">
                <p>
                    <button type="button" class="btn btn-primary btn-lg" id="fundDetailBackButton">返回</button>
                    <input type="text" hidden="hidden" value="${dto.id}" id="fundPurchaseId">
                </p>
            </div>
            <div class="col-md-8 text-center">

                <div class="row" style="font-size: 30px;margin-top: 20px">${dto.fundName}</div>
                <div class="row" style="font-size: 20px;margin-top: 20px">${dto.registerId}</div>
                <div class="row" style="font-size: 15px;margin-top: 40px">
                    标签: 货币型产品 管理人 : PFinance银行股份有限公司
                </div>
            </div>
            <div class="col-md-2">

                <div class="text-right" style="margin-top: 160px">
                    <button type="button" class="btn btn-primary btn-sm" id="fundDetailBuyButton">立即购买</button>
                </div>
            </div>

        </div>

    </div>
    <div class="row sectionDiv col-md-offset-2 col-md-8">
        <div class="row sectionDiv">
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    产品成立日
                </div>
                <div class="col-md-7 borderDiv text-center header3">
                    ${dto.foundingDate}
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    计划类型
                </div>
                <div class="col-md-7 borderDiv text-center header3">
                    <c:choose>
                        <c:when test="${dto.planType==1}">
                            限定性
                        </c:when>
                        <c:when test="${dto.planType==2}">
                            非限定性
                        </c:when>
                        <c:when test="${dto.planType==3}">
                            限额特定理财
                        </c:when>
                    </c:choose>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    管理人
                </div>
                <div class="col-md-7 borderDiv text-center header3">
                    ${dto.custodian}
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    托管人
                </div>
                <div class="col-md-7 borderDiv text-center header3">
                    ${dto.trustee}
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    推广起始日
                </div>
                <div class="col-md-7 borderDiv text-center header3">
                    ${dto.startate}
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    推广截止日
                </div>
                <div class="col-md-7 borderDiv text-center header3">
                    ${dto.endDate}
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    存续期
                </div>
                <div class="col-md-7 borderDiv text-center header3">
                    ${dto.duration}
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    募集资金
                </div>
                <div class="col-md-7 borderDiv text-center header3">
                    ${dto.totalecruitment}
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    最低参与金额
                </div>
                <div class="col-md-7 borderDiv text-center header3">
                    ${dto.purchaseAmount}
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 borderDiv text-center header3 tableLeft">
                    投资目标
                </div>
                <div class="col-md-7 borderDiv text-center header3">
                    ${dto.objective}
                </div>
            </div>

        </div>
    </div>
</div>




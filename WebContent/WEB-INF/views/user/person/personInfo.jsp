<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp" %>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<style>

    .title {
        font-size: 20px;
        color: #5485d2;
    }
</style>
<div class="container">
    <div class="row sectionDiv">
        <div class="col-md-4 text-center title">
            <div class="row">
                <p>个人信息</p>
            </div>
            <div class="row" style="height: 10px">
                <div class="row" >
                    <img src="<%=basePath%>images/head.jpg" alt=""
                         class="img-responsive center-block img-circle" width="100px"/>
                </div>
            </div>

        </div>
        <div class="col-md-7" style="font-size: 20px;">
            <p>姓名: ${customerDTO.name}</p>
            <p>手机号: ${customerDTO.phoneNum}</p>
            <p>身份证号: ${customerDTO.idNum}</p>
            <p>邮箱地址: ${customerDTO.email}</p>
            <p>居住地址: ${customerDTO.adderss}</p>
        </div>
    </div>
    <div class="row sectionDiv">
        <div class="col-md-4 text-center title">
            <div class="row">
                <p>资金账户</p>
            </div>
            <div class="row" style="height: 10px">

            </div>

        </div>
        <div class="col-md-7" style="font-size: 20px;">
            <p>账户总额（元）:${customerAccountDTO.allMoney}</p>
            <p>活期存款（元）:${customerAccountDTO.extraMoney}</p>
            <p>已理财额（元）:<fmt:formatNumber type="number" value="${customerAccountDTO.allMoney-customerAccountDTO.extraMoney}" maxFractionDigits="2"/></p>
            <p>日收益（元）:${purchaseDTO.dayEarning}</p>
        </div>
    </div>

</div>

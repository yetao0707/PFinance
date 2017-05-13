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
                    <img src="<%=basePath%>images/dayi.jpg" alt=""
                         class="img-responsive center-block img-circle" width="100px"/>
                </div>
            </div>

        </div>
        <div class="col-md-7">
            <p>姓名: 李小齐</p>
            <p>手机号: ${userDTO.phoneNum}</p>
            <p>身份证号: ${userDTO.idNum}</p>
            <p>邮箱地址: ${userDTO.email}</p>
            <p>居住地址: ${userDTO.address}</p>
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
        <div class="col-md-7">
            <p>账户总额（元）:100</p>
            <p>活期存款（元）:100</p>
            <p>已理财额（元）:100</p>
            <p>昨日收益（元）:100</p>
        </div>
    </div>

</div>

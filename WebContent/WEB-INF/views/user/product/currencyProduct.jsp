<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp"%>
<%@page session="false" %>
<%@ page isELIgnored="false" %>

<script>
    $(function(){
        $(".btn-primary.btn-sm.currency").on("click",function(){
            $("#product").load("currencyDetail?id=" + $(this).attr("name"));
        });
        $("#currencySearchButton").on("click",function(){
            $("#currencyProduct").load("searchCurrencyList?currencyName=" + $(".form-control.currencyNameSearch").val());
        });
    });
</script>

<div class="container">
    <div class="row" style="height: 20px"></div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-6">
            <div class="input-group">
                <input type="text" class="form-control currencyNameSearch">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button" id="currencySearchButton">搜索</button>
                </span>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>
    <div class="row" style="height: 20px"></div>

    <div class="row">
        <c:forEach items="${page.list}" var="pojo" varStatus="status">
            <c:if test="${status.index%3==0}">
                <div class="row">
                    <div class="col-md-1">
                    </div>
            </c:if>
                    <div class="col-md-2 well">
                        <p class="text-center">${pojo.currencyName}</p>
                        <p class="text-center">期限(天):${pojo.durationDays}</p>
                        <p class="text-center">货币型 ${pojo.productType}</p>
                        <p class="text-left">预计年化：</p>
                        <p class="text-center">10%</p>
                        <p class="text-center">
                            <button type="button" class="btn btn-primary btn-sm currency" name="${pojo.id}">立即投资</button>
                        </p>
                    </div>
                    <div class="col-md-1">
                    </div>
            <c:if test="${status.count%3==0}">

                </div>
            </c:if>

        </c:forEach>

    </div>

</div>


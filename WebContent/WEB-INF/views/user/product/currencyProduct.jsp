<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp"%>
<%@page session="false" %>
<%@ page isELIgnored="false" %>

<script>
    $(function(){
        $(".btn.btn-primary.btn-lg.currency").on("click",function(){
            $("#product").load("currencyDetail?id=" + $(this).attr("name"));
        });
        $("#currencySearchButton").on("click",function(){
            $("#currencyProduct").load("searchCurrencyList",{
                currencyName:$(".form-control.currencyNameSearch").val()
            });
        });
        $(".pageButton").on("click",function(){
            $("#currencyProduct").load("currencyList" ,{
                currentPage:$(this).attr("name"),
                numPerPage:9
            });
        });
    });
</script>

<div class="container">
    <div class="row" style="height: 20px"></div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-6">
            <div class="input-group">
                <input type="text" class="form-control currencyNameSearch" style="height: 50px;">
                <span class="input-group-btn" style="height: 50px;">
                    <button class="btn btn-default" type="button" id="currencySearchButton" style="height: 50px;width: 100px;color:#FFFFFF;font-size: 25px;background-color: #337ab7">搜索</button>
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

            </c:if>
                    <div class="col-md-3 well" style="width: 300px;margin-left: 30px;">
                        <p class="text-center" style="font-size: 25px;">${pojo.currencyName}</p>
                        <p class="text-center" style="font-size: 18px;">期限(天):${pojo.durationDays}</p>
                        <p class="text-center" style="font-size: 18px;">货币型产品</p>
                        <p class="text-left" style="font-size: 18px;">预计年化：</p>
                        <p class="text-center" style="font-size: 30px;color: #c5323d"><fmt:formatNumber type="number" value="${pojo.profitYield}" maxFractionDigits="2"/>%</p>
                        <p class="text-center">
                            <button type="button" class="btn btn-primary btn-lg currency" name="${pojo.id}">立即投资</button>
                        </p>
                    </div>

            <c:if test="${status.count%3==0}">

                </div>
            </c:if>

        </c:forEach>

    </div>
    <div class="row col-md-offset-1" style="font-size: 50px;">
        <ul class="pagination" >
            <li>
                <button type="button" class="btn btn-link pageButton" name="1" style="font-size: 30px;">&laquo;</button>
            </li>
            <li class="active">
                <button type="button" class="btn btn-link pageButton" name="1" style="font-size: 30px;">1</button>
            </li>
            <c:forEach begin="2" end="${page.page.totalPage}" step="1" varStatus="index">
                <li class="active">
                    <button type="button" class="btn btn-link pageButton" name="${index.count+1}" style="font-size: 30px;">${index.count+1}</button>
                </li>
            </c:forEach>
            <li>
                <button type="button" class="btn btn-link pageButton" name="${page.page.totalPage}" style="font-size: 30px;">&raquo;</button>
            </li>
        </ul>
    </div>

</div>


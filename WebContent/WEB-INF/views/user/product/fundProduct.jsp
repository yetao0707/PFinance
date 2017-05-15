<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp"%>
<%@page session="false" %>
<%@ page isELIgnored="false" %>

<script>
    $(function(){
        $(".btn-primary.btn-lg.fund").on("click",function(){
            $("#product").load("fundDetail?id=" + $(this).attr("name"));
        });
        $("#fundSearchButton").on("click",function(){
            $("#fundProduct").load("searchFundList",{
                fundName:$(".form-control.fundNameSearch").val()
            });
        });
        $(".pageButton").on("click",function(){
            $("#fundProduct").load("fundList" ,{
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
                    <button class="btn btn-default" type="button" id="fundSearchButton" style="height: 50px;width: 100px;color:#FFFFFF;font-size: 25px;background-color: #337ab7">搜索</button>
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
                <p class="text-center" style="font-size: 25px;">${pojo.fundName}</p>
                <p class="text-center" style="font-size: 18px;">期限(天):${pojo.duration}</p>
                <p class="text-center" style="font-size: 18px;">
                    <c:choose>
                        <c:when test="${pojo.fundType==1}">
                            货币型基金
                        </c:when>
                        <c:when test="${pojo.fundType==2}">
                            债券型基金
                        </c:when>
                        <c:when test="${pojo.fundType==3}">
                            股票型基金
                        </c:when>
                        <c:otherwise>
                            其他基金
                        </c:otherwise>
                    </c:choose>
                </p>
                <p class="text-left" style="font-size: 18px;">预计年化：</p>
                <p class="text-center" style="font-size: 30px;color: #c5323d"><fmt:formatNumber type="number" value="${pojo.expectedYield}" maxFractionDigits="2"/>%</p>
                <p class="text-center">
                    <button type="button" class="btn btn-primary btn-lg fund" name="${pojo.id}">立即投资</button>
                </p>
            </div>
            <c:if test="${status.count%3==0}">

                </div>
            </c:if>

        </c:forEach>

    </div>
    <div class="row col-md-offset-1">
        <ul class="pagination">
            <li>
                <button type="button" class="btn btn-link pageButton" name="1" style="font-size: 30px;">&laquo;</button>
            </li>
            <li class="active">
                <button type="button" class="btn btn-link pageButton" name="1" style="font-size: 30px;">1</button>
            </li>
            <c:forEach begin="2" end="${page.page.totalPage}" step="1" varStatus="index" >
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

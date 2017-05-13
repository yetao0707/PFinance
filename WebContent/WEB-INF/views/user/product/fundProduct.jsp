<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp"%>
<%@page session="false" %>
<%@ page isELIgnored="false" %>

<script>
    $(function(){
        $(".btn-primary.btn-sm.fund").on("click",function(){
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
                <input type="text" class="form-control fundNameSearch">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button" id="fundSearchButton">搜索</button>
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
                <p class="text-center">${pojo.fundName}</p>
                <p class="text-center">期限(天):${pojo.duration}</p>
                <p class="text-center">基金型 ${pojo.planType}</p>
                <p class="text-left">预计年化：</p>
                <p class="text-center">10%</p>
                <p class="text-center">
                    <button type="button" class="btn btn-primary btn-sm fund" name="${pojo.id}">立即投资</button>
                </p>
            </div>
            <div class="col-md-1">
            </div>
            <c:if test="${status.count%3==0}">

                </div>
            </c:if>

        </c:forEach>

    </div>
    <div class="row col-md-offset-1">
        <ul class="pagination">
            <li>
                <button type="button" class="btn btn-link pageButton" name="1">&laquo;</button>
            </li>
            <li class="active">
                <button type="button" class="btn btn-link pageButton" name="1">1</button>
            </li>
            <c:forEach begin="2" end="${page.page.totalPage}" step="1" varStatus="index">
                <li class="active">
                    <button type="button" class="btn btn-link pageButton" name="${index.count+1}">${index.count+1}</button>
                </li>
            </c:forEach>
            <li>
                <button type="button" class="btn btn-link pageButton" name="${page.page.totalPage}">&raquo;</button>
            </li>
        </ul>
    </div>

</div>

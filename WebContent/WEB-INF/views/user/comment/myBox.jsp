<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp"%>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<script>
    $(function () {
        $("#myBoxBackButton").on("click",function () {
            $("#comment").load("commentIndex")
        })
    })
</script>
<div class="container">
    <div class="row">
        <button type="button" class="btn btn-primary btn-sm" id="myBoxBackButton">返回</button>
    </div>
    <div class="container">
        <div class="row">
            <c:forEach items="${customerCommentDTOs}" var="pojo" varStatus="status">
                <div class="row">

                </div>
            </c:forEach>
            <div class="row">

            </div>
            <div class="row">

            </div>
        </div>
    </div>


</div>

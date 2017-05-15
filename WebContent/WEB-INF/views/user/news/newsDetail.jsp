<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp" %>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<script>
    $(function () {
        $("#newsDetailBackButton").on("click", function () {
            $("#news").load("newsIndex");
        });
    });
</script>
<div class="container">
    <div class="row col-md-offset-2 cole-md-8">
        <p class="text-left">
            <button type="button" class="btn btn-primary btn-sm " id="newsDetailBackButton">返回上一步</button>
        </p>
        <div class="row text-center" style="font-size: 40px;margin-top: 30px;">
            ${newsDTO.title}
        </div>
        <div class="row" style="margin-top: 30px;">
            <img src="<%=basePath%>user/img?id=${newsDTO.id}" alt=""
                 class="img-responsive center-block" width="500px"/></div>
        <div class="row" style="text-indent: 2em;display:inline-block;margin-top: 30px;">
            <p>${newsDTO.content}</p>
        </div>
    </div>

</div>


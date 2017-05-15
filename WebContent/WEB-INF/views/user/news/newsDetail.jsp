<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp"%>
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
    <p class="text-left">
        <button type="button" class="btn btn-primary btn-sm " id="newsDetailBackButton">返回上一步</button>
    </p>
    <div class="row">
        <h2>${newsDTO.title}</h2>
    </div>
    <div class="row">
        <img src="<%=basePath%>user/img?id=${newsDTO.id}" alt=""
             class="img-responsive center-block img-circle" width="100px"/>    </div>
    <div class="row">
        ${newsDTO.content}
    </div>

</div>


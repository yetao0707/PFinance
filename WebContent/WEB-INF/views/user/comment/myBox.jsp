<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp" %>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<script>
    $(function () {
        $("#myBoxBackButton").on("click", function () {
            $("#comment").load("commentIndex")
        })
    })
</script>
<div class="container">
    <div class="row  col-md-8 col-md-offset-2">


        <div class="row">
            <button type="button" class="btn btn-primary btn-sm" id="myBoxBackButton">返回</button>
        </div>
        <div class="row">
            <c:forEach items="${customerCommentDTOs}" var="pojo">
                <div class="row">
                    <div class="row well" style="background-color: #f1f2f6; margin-top: 10px">
                        <div class="row">
                            <div class="row" style="margin-left: 20px">
                                <div class="col-md-7" >
                                    <span style="font-size: 30px">${pojo.title}</span>
                                    <c:if test="${empty pojo.replyText}">
                                        <span style="font-size: 15px;color: #f5a389">待回复</span>
                                    </c:if>
                                    <c:if test="${!empty pojo.replyText}">
                                        <span style="font-size: 15px;color: #9ff5ef">已回复</span>
                                    </c:if>
                                    <c:forEach items="${pojo.tagList}" var="tag">
                                    <span style="margin-left: 2px;background-color: #a8a3bf">
                                            ${tag}
                                    </span>
                                    </c:forEach>
                                </div>
                                <div class="row col-md-3 col-md-offset-1 text-right">
                                    <div class="row">
                                            ${pojo.addTime}
                                    </div>
                                </div>
                            </div>
                            <div class="row " style="margin-left: 10px;text-indent: 2em;margin-left: 20px">
                                    ${pojo.commentText}
                            </div>
                        </div>
                        <c:if test="${!empty pojo.replyText}">
                            <hr>
                            <div class="row sectionDiv">
                                <div class="row">
                                    <div class="row col-md-3 " style="margin-left: 20px">
                                        <p style="display:inline-block;">${pojo.replyBy}</p><br>
                                        <p style="display:inline-block;">工号: A00002</p>
                                    </div>
                                    <div class="row col-md-3 col-md-offset-5 text-right">
                                        <div class="row">
                                                ${pojo.addTime}
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin-left: 10px;text-indent: 2em;margin-left: 20px">
                                        ${pojo.replyText}
                                </div>
                            </div>
                        </c:if>


                    </div>

                </div>
            </c:forEach>

        </div>

    </div>
</div>

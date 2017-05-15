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
    <div class="row" style="background-color: #9ff5ef;">

        <div class="row  col-md-8 col-md-offset-2">


            <div class="row" style="margin-top: 30px;">
                <button type="button" class="btn btn-primary btn-sm" id="myBoxBackButton">返回</button>
            </div>
            <div class="row">
                <c:forEach items="${customerCommentDTOs}" var="pojo">
                    <div class="row">
                        <div class="row well" style="background-color: #f1f2f6; margin-top: 10px">
                            <div class="row" style="font-size: 20px;">
                                <div class="row" style="margin-left: 20px">
                                    <div class="col-md-7">
                                        <span style="font-size: 30px">${pojo.title}</span>
                                        <c:if test="${empty pojo.replyText}">
                                            <span style="font-size: 20px;color: #f56058">待回复</span>
                                        </c:if>
                                        <c:if test="${!empty pojo.replyText}">
                                            <span style="font-size: 20px;color: #40a8eb">已回复</span>
                                        </c:if>
                                        <c:forEach items="${pojo.tagList}" var="tag">
                                    <span style="margin-left: 2px;background-color: #a8a3bf;color: #FFFFFF;font-weight: normal;font-size: 15px;">
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
                                <div class="row " style="margin-left: 10px;text-indent: 2em;margin-left: 20px;margin-top: 20px;">
                                       <p> ${pojo.commentText}</p>
                                </div>
                            </div>
                            <c:if test="${!empty pojo.replyText}">
                                <div class="row sectionDiv" style="font-size: 20px;border-top:solid 1px rgba(0, 0, 0, 0.2);padding-top: 5px;">
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
                                           <p> ${pojo.replyText}</p>
                                    </div>
                                </div>
                            </c:if>


                        </div>

                    </div>
                </c:forEach>

            </div>

        </div>
    </div>

</div>

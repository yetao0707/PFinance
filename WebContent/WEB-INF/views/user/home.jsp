<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../taglib.jsp" %>
<%@page session="false" %>
<%@ page isELIgnored="false" %>

<%--<script>--%>
<%--$(function(){--%>
<%--$('#financeButton').on('click', function (e) {--%>
<%--// 获取已激活的标签页的名称--%>
<%--alert(2);--%>

<%--$("#home").load("personalProduct4Home");--%>
<%--});--%>
<%--$('#charactorButton').on('click', function (e) {--%>
<%--// 获取已激活的标签页的名称--%>
<%--alert(2);--%>

<%--//                $('#myTab a[href="#home"]').click();--%>
<%--$("#home").load("personalResult4Home");--%>
<%--});--%>
<%--$('#newsButton').on('click',function (e) {--%>
<%--alert(2);--%>
<%--$('#myTab a[href="#news"]').click();--%>
<%--alert(2);--%>

<%--});--%>
<%--$('#productButton').on('click',function (e) {--%>
<%--$('#myTab a[href="#product"]').tab('show');--%>
<%--});--%>
<%--});--%>
<%--</script>--%>
<style>
    .productRecommend {
        margin-left: 50px;
        width: 240px;
    }

    .personDetail {
        margin-top: 30px;
        height: 10px;
    }

    .personInfoDiv {
        height: 390px;
        margin-left: 30px;
        width: 335px;
    }

    .profitYesterday {
        margin-top: 15px;
    }

    .customerDesc {
        margin-top: 30px;
    }
</style>
<script>
    $(function () {
        $("#homeLoginButton").on("click", function () {
            location.href = "loginIndex";
        });
        $(".homenews").on("click",function (e) {
            $("#news").load("newsDetail", {
                id: $(this).attr("name")
            });
            a = $('#myTab a[href="#news"]');
//                $('#myTab a:last').tab('show');
            a.click();
        });
        $('#financeButton').on('click', function (e) {
            a = $('#myTab a[href="#center"]');
            a.click();
        });
        $('#charactorButton').on('click', function (e) {
            a = $('#myTab a[href="#center"]');
            a.click();
//                $("#home").load("personalResult4Home");
        });
        $('#newsButton').on('click', function (e) {
            e.preventDefault();
            a = $('#myTab a[href="#news"]');
//                $('#myTab a:last').tab('show');
            a.click();
        });
        $('#productButton').on('click', function (e) {
            e.preventDefault();
            a = $('#myTab a[href="#product"]');
            a.click();
        });
        $('.homeProductButton.currency').on('click', function (e) {
            e.preventDefault();
            $("#product").load("currencyDetail?id=" + $(this).attr("name"));
            a = $('#myTab a[href="#product"]');
            a.click();
        });
        $('.homeProductButton.fund').on('click', function (e) {
            e.preventDefault();
            $("#product").load("fundDetail?id=" + $(this).attr("name"));
            a = $('#myTab a[href="#product"]');
            a.click();
        });
        $('#homeToQuestionEvaluate').on('click', function (e) {
            e.preventDefault();
            a = $('#myTab a[href="#pFinanace"]');
            a.click();
        });
    });
</script>


<div class="container" style="background-color: #a1c9ff;">

    <div class="row" style="background-color: #9ff5ef">

        <div class="col-md-7 imageDiv" style=" width: 700px;">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>PFinance银行理财，您身边的理财专家</h4>
                </div>
                <div class="panel-body">
                    <div id="myCarousel" class="carousel slide">
                        <!-- 轮播（Carousel）指标 -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                        </ol>
                        <!-- 轮播（Carousel）项目 -->
                        <div class="carousel-inner" style="height: 300px">
                            <div class="item active">
                                <img src="<%=basePath%>images/home1.jpg" alt="First slide"
                                     class="img-responsive center-block">
                            </div>
                            <div class="item">
                                <img src="<%=basePath%>images/home2.jpg" alt="Second slide"
                                     class="img-responsive center-block">
                            </div>
                            <div class="item">
                                <img src="<%=basePath%>images/home3.jpg" alt="Third slide"
                                     class="img-responsive center-block">
                            </div>
                        </div>
                        <!-- 轮播（Carousel）导航 -->
                        <a class="carousel-control left" href="#myCarousel"
                           data-slide="prev">&lsaquo;</a>
                        <a class="carousel-control right" href="#myCarousel"
                           data-slide="next">&rsaquo;</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4 well personInfoDiv" style="margin-left: 10px;">
            <c:if test="${customerDTO!=null}">
                <div class="row personDetail">
                        <%--<div class="row">--%>
                    <div class="col-md-5">
                        <img src="<%=basePath%>images/head.jpg" alt=""
                             class="img-responsive center-block img-circle"/>
                    </div>
                    <div class="col-md-7">
                        <div class="row">
                            <h3 class="text-center">
                                    ${customerDTO.userName}
                            </h3>
                        </div>
                        <div class="row" style="height: 30px;">

                        </div>
                        <div class="row profitYesterday">
                            <h4 class="text-center">
                                <p>昨日收益:</p>
                                <p>
                                    <c:if test="${purchaseDTO!=null}">${purchaseDTO.dayEarning}</c:if>
                                </p>
                            </h4>
                        </div>
                    </div>
                        <%--</div>--%>
                </div>


                <div class="row">


                    <c:if test='${empty customerDTO.evaluateResult}'>\
                        <div class="col-md-12 ">
                            <p class="text-center">
                                <button type="button" id="homeToQuestionEvaluate"
                                        class="btn btn-default btn-lg btn-block">填写问券
                                </button>
                            </p>
                        </div>
                    </c:if>
                    <c:if test='${!empty customerDTO.evaluateResult}'>
                        <div class="col-md-12 customerDesc">
                            <h4 class="text-center">您属于：${customerDTO.desc}</h4>
                        </div>

                    </c:if>

                </div>

                <%--<div class="row">--%>
                    <%--<div class="col-md-12">--%>
                        <%--<img src="t.jpg" alt="" class="img-responsive center-block"/>--%>
                    <%--</div>--%>

                <%--</div>--%>
                <div class="row" style="margin-top: 30px">
                    <div class="col-md-6">
                        <p>
                            <button type="button" id="charactorButton" class="btn btn-primary btn-lg btn-block">我的特性
                            </button>
                        </p>
                    </div>
                    <div class="col-md-6">
                        <p>
                            <button type="button" id="financeButton" class="btn btn-primary btn-lg btn-block">我的理财
                            </button>
                        </p>
                    </div>
                </div>
            </c:if>
            <c:if test="${customerDTO==null}">
                <div class="row">
                    <p class="text-center">
                        <button type="button" id="homeLoginButton" class="btn btn-default btn-lg center-block">请登录
                        </button>
                    </p>
                </div>
            </c:if>


        </div>

    </div>

    <div class="row well greenDiv" style="margin-top: 30px;">
        <div class="row">
            <div class="col-md-3">
                <p class="text-left">产品优选 </p>
            </div>
            <div class="col-md-6">
            </div>
            <div class="col-md-3">
                <p class="text-right" style="margin-right: 20px">
                    <button type="button" class="btn btn-link" id="productButton">查看更多</button>
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 well productRecommend " style="margin-left: 10px">
                <p class="text-center">dfsdf</p>
                <p class="text-center">期限(天):20</p>
                <p class="text-center">货币型 非保本浮动收益</p>
                <p class="text-left">预计年化：</p>
                <p class="text-center">10%</p>
                <p class="text-center">
                    <button type="button" class="btn btn-primary btn-lg homeProductButton currency" name="1">立即投资</button>
                </p>
            </div>
            <div class="col-md-2 well productRecommend">
                <p class="text-center">dfsdf</p>
                <p class="text-center">期限(天):20</p>
                <p class="text-center">货币型 非保本浮动收益</p>
                <p class="text-left">预计年化：</p>
                <p class="text-center">10%</p>
                <p class="text-center">
                    <button type="button" class="btn btn-primary btn-lg homeProductButton currency" name="2">立即投资</button>
                </p>
            </div>
            <div class="col-md-2 well productRecommend">
                <p class="text-center">dfsdf</p>
                <p class="text-center">期限(天):20</p>
                <p class="text-center">货币型 非保本浮动收益</p>
                <p class="text-left">预计年化：</p>
                <p class="text-center">10%</p>
                <p class="text-center">
                    <button type="button" class="btn btn-primary btn-lg homeProductButton fund" name="1">立即投资</button>
                </p>
            </div>
            <div class="col-md-2 well productRecommend">
                <p class="text-center">dfsdf</p>
                <p class="text-center">期限(天):20</p>
                <p class="text-center">货币型 非保本浮动收益</p>
                <p class="text-left">预计年化：</p>
                <p class="text-center">10%</p>
                <p class="text-center">
                    <button type="button" class="btn btn-primary btn-lg homeProductButton fund" name="2">立即投资</button>
                </p>
            </div>


        </div>
    </div>
    <div class="row well greenDiv">

        <div class="row">
            <div class="col-md-3">
                <p class="text-left">资讯中心 </p>
            </div>
            <div class="col-md-6">
            </div>
            <div class="col-md-3">
                <p class="text-right">
                    <button type="button" class="btn btn-link" id="newsButton">查看更多</button>
                </p>
            </div>
        </div>
        <div class="row well">
            <div class="col-md-5">
                <div id="myCarousel2" class="panel panel-default carousel slide">


                    <!-- 轮播（Carousel）指标 -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <!-- 轮播（Carousel）项目 -->
                    <div class="carousel-inner" style="height: 200px">
                        <div class="item active">
                            <img src="<%=basePath%>images/news/1.png" alt="First slide"
                                 class="img-responsive center-block">
                        </div>
                        <div class="item">
                            <img src="<%=basePath%>images/news/2.png" alt="Second slide"
                                 class="img-responsive center-block">
                        </div>
                        <div class="item">
                            <img src="<%=basePath%>images/news/3.png" alt="Third slide"
                                 class="img-responsive center-block">
                        </div>
                    </div>
                    <!-- 轮播（Carousel）导航 -->
                    <a class="carousel-control left" href="#myCarousel2"
                       data-slide="prev">&lsaquo;</a>
                    <a class="carousel-control right" href="#myCarousel2"
                       data-slide="next">&rsaquo;</a>

                </div>

            </div>
            <div class="col-md-7">
                <table class="table">
                    <c:forEach items="${newsDTOs}" var="pojo">
                        <tr>
                            <td>${pojo.title}</td>
                            <td>${pojo.addTime}</td>
                        </tr>
                        </tr>
                    </c:forEach>

                    <tbody>
                    <tr>
                        <td><button type="button" class="btn btn-link homenews" name="1">【财经】14只雄安概念股明日复盘</button></td>
                        <td>2014-04-16</td>
                    </tr>
                    <tr>
                        <td><button type="button" class="btn btn-link homenews" name="1">【财经】14只雄安概念股明日复盘</button></td>
                        <td>2014-04-16</td>
                    </tr>
                    <tr>
                        <td><button type="button" class="btn btn-link homenews" name="1">【财经】14只雄安概念股明日复盘</button></td>
                        <td>2014-04-16</td>
                    </tr>
                    <tr>
                        <td><button type="button" class="btn btn-link homenews" name="1">【财经】14只雄安概念股明日复盘</button></td>
                        <td>2014-04-16</td>
                    </tr>
                    <tr>
                        <td><button type="button" class="btn btn-link homenews" name="1">【财经】14只雄安概念股明日复盘</button></td>
                        <td>2014-04-16</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div>

</div>



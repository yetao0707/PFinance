<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp"%>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<script>
    $(function () {
        $(".newsDetailButton").on("click",function () {
            $("#news").load("newsDetail", {
                id: $(this).attr("name")
            });
        })
    })
</script>
<style>
</style>

<div class="container">
    <div class="row">
        <div class="col-md-8 well" style="height: 350px;">
            <div id="myCarousel3" class="panel panel-default carousel slide">


                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <!-- 轮播（Carousel）项目 -->
                <div class="carousel-inner" style="height: 300px">
                    <div class="item active">
                        <img src="<%=basePath%>images/news.png" alt="First slide"
                             class="img-responsive center-block">
                    </div>
                    <div class="item">
                        <img src="<%=basePath%>images/news.png" alt="Second slide"
                             class="img-responsive center-block">
                    </div>
                    <div class="item">
                        <img src="<%=basePath%>images/news.png" alt="Third slide"
                             class="img-responsive center-block">
                    </div>
                </div>
                <!-- 轮播（Carousel）导航 -->
                <a class="carousel-control left" href="#myCarousel3"
                   data-slide="prev">&lsaquo;</a>
                <a class="carousel-control right" href="#myCarousel3"
                   data-slide="next">&rsaquo;</a>

            </div>
        </div>
        <div class="col-md-4 sectionDIv well" style="height: 360px;overflow: auto" >
            <div class="row">
                <h2>周小川：中国能够实现
                </h2>
            </div>
            <div class="row">
                <h2>今年约6.5%的经济增长目标
                </h2>
            </div>
            <div class="row">
                <p>据新华社英文报道，中国央行行长周小川在IMF网站发布的公告中表示，中国能够实现今年6.5%左右的经济增长目标，中国“完全有信心”预防和消除系统性金融风险；未来货币政策仍将保持“稳健中性”。</p>
            </div>
            <div class="row">
                <p>据新华社英文报道，中国央行行长周小川在IMF网站发布的公告中表示，中国能够实现今年6.5%左右的经济增长目标，中国“完全有信心”预防和消除系统性金融风险；未来货币政策仍将保持“稳健中性”。</p>
            </div>
            <div class="row">
                <p>据新华社英文报道，中国央行行长周小川在IMF网站发布的公告中表示，中国能够实现今年6.5%左右的经济增长目标，中国“完全有信心”预防和消除系统性金融风险；未来货币政策仍将保持“稳健中性”。</p>
            </div>
            <div class="row">
                <p>据新华社英文报道，中国央行行长周小川在IMF网站发布的公告中表示，中国能够实现今年6.5%左右的经济增长目标，中国“完全有信心”预防和消除系统性金融风险；未来货币政策仍将保持“稳健中性”。</p>
            </div>
        </div>
    </div>
    <div class="row">
        <table class="table">
            <tbody>
                <c:forEach items="${newsDTOS}" var="pojo" varStatus="status">
                    <tr>
                        <td><p class="text-center"><button type="button" class="btn btn-link newsDetailButton" name="${pojo.id}">${pojo.title}</button></p></td>
                        <td><p class="text-center">${pojo.addTime}</p></td>
                    </tr>
                </c:forEach>
             </tbody>
        </table>
    </div>

</div>


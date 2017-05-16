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
        });
        $('#myCarousel3').on('slide.bs.carousel', function (e) {
            index=$("#myCarousel3 .item.active").attr("name");
            if (index=="3"){
                $("#newsHeadTitle").text("习近平：“一带一路”贸易总额超3万亿美元");
                $("#newsHeadContent").text("新华网北京5月14日电 中华人民共和国主席习近平14日出席“一带一路”国际合作高峰论坛并发表主旨演讲。习近平说，4年来，全球100多个国家和国际组织积极支持和参与“一带一路”建设，联合国大会、联合国安理会等重要决议也纳入“一带一路”建设内容。“一带一路”建设逐渐从理念转化为行动，从愿景转变为现实，建设成果丰硕。");
            }else if (index=="0"){
                $("#newsHeadTitle").text("勒索病毒”袭击全球 赎金为何要选比特币？");
                $("#newsHeadContent").text("比特币是一种基于区块链技术的“数字货币”。央行曾于2013年明确比特币作为一种特定的虚拟商品，不具有与货币等同的法律地位，不能且不应作为货币在市场上流通使用。但是在这场席卷全球的病毒灾难面前，为何黑客偏偏就选择比特币作为赎金代表币呢？是以为匿名性？难以监管？还是未来会价格大涨？");
            }else if (index=="1"){
                $("#newsHeadTitle").text("天弘基金19只基金由一人管理 旗下过半业绩倒数");
                $("#newsHeadContent").text("4月17日，天弘基金一口气发出了20份基金经理变动公告，其中有19份的人事变动却是相同的，即19只由同一人管理的基金同时换了另一位基金经理，折射出旗下基金经理人手不足、一拖多的现状。同时，天弘旗下公募基金单只资产规模不足2亿的 “迷你基金”数量占比高达四成以上，最近三年中，旗下有可统计数据的9只主动型股、债类产品中有5只业绩排名倒数前20。这些均是第一大货币基金余额宝也难以掩盖的窘境。");
            }else if (index=="2"){
                $("#newsHeadTitle").text("越存钱越穷 我们是如何一步步陷入贫困陷阱的？");
                $("#newsHeadContent").text("一直以来勤俭节约，外加善于存款可谓是中华民族的传统美德，古人有云“勤是摇钱树，俭是聚宝盆”就很好的体现了中国古人的勤俭节约的思维。哪怕到了21世纪的今天，中国依然是全世界最大的高储蓄国家，再大的超前消费的思维都没能改变中国人热爱存钱的习惯。老一辈人更是总强调存钱的重要性，但是在这个时代，过度存钱可能是最失败的理财方式，今天我们就来谈一个小问题，你是如何越存钱越穷的？");
            }

        });
    })
</script>
<style>
</style>

<div class="container" >
    <div class="row" style="background-color: #9ff5ef;padding-top: 20px;padding-left: 20px;padding-right: 20px;">
        <div class="col-md-8 well" style="height: 350px;width:630px;">
            <div id="myCarousel3" class="panel panel-default carousel slide">


                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarouse3" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarouse3" data-slide-to="1"></li>
                    <li data-target="#myCarouse3" data-slide-to="2"></li>
                    <li data-target="#myCarouse3" data-slide-to="3"></li>
                </ol>
                <!-- 轮播（Carousel）项目 -->
                <div class="carousel-inner" style="height: 300px">
                    <div class="item active" name="0">
                        <img src="<%=basePath%>images/news/1.jpeg" alt="First slide"
                             class="img-responsive center-block">
                    </div>
                    <div class="item" name="1">
                        <img src="<%=basePath%>images/news/2.jpeg" alt="Second slide"
                             class="img-responsive center-block">
                    </div>
                    <div class="item" name="2">
                        <img src="<%=basePath%>images/news/3.png" alt="Third slide"
                             class="img-responsive center-block">
                    </div>
                    <div class="item" name="3">
                        <img src="<%=basePath%>images/news/4.jpg" alt="Third slide"
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
        <div class="col-md-4 sectionDIv well newsPage" style="height: 350px;overflow: auto;margin-left: 40px;width:450px" >
            <div class="row title text-center" id="newsHeadTitle" style="font-size: 30px;">
                习近平：“一带一路”贸易总额超3万亿美元
            </div>
            <div class="row content" style="font-size: 20px;text-indent: 2em;">
                <p class="content" id="newsHeadContent">
                    新华网北京5月14日电 中华人民共和国主席习近平14日出席“一带一路”国际合作高峰论坛并发表主旨演讲。习近平说，4年来，全球100多个国家和国际组织积极支持和参与“一带一路”建设，联合国大会、联合国安理会等重要决议也纳入“一带一路”建设内容。“一带一路”建设逐渐从理念转化为行动，从愿景转变为现实，建设成果丰硕。
                </p>
            </div>
        </div>
    </div>
    <div class="row" style="background-color: #9ff5ef;margin-top: 30px;font-size: 25px;">
        <table class="table">
            <tbody>
                <c:forEach items="${newsDTOS}" var="pojo" varStatus="status">
                    <tr>
                        <td><p class="text-left"><button type="button" class="btn btn-link newsDetailButton" name="${pojo.id}" style="font-size: 25px;">${pojo.title}</button></p></td>
                        <td><p class="text-center">${pojo.addTime}</p></td>
                    </tr>
                </c:forEach>
             </tbody>
        </table>
    </div>

</div>


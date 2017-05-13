<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp" %>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<script>
    $(function () {
        $("#reportRecommendButton2").on("click", function () {
            alert(2);
            $("#pFinanace").load("getPersonalFinance");
            a = $('#myTab a[href="#pFinanace"]');
//                $('#myTab a:last').tab('show');
            a.click();
        });
        $("#questionAgainButton2").on("click", function () {
            alert(2);
            $("#pFinanace").load("questionIndex");
            a = $('#myTab a[href="#pFinanace"]');
//                $('#myTab a:last').tab('show');
            a.click();
        });
    })
</script>
<style>
    .reportTitle {
        font-size: 40px;
        margin-top: 20px;
        color: #0099ff;
        padding-left: 300px;
    }

    .personDescIndex {
        font-size: 20px;
        margin-top: 30px;
        color: #ace795;
        padding-left: 300px;

    }

    .personDesc {
        color: #1400e4;
    }

    .personCharactor {
        margin-top: 30px;
        font-size: 20px;
    }

    .personCharactor.image {

    }
    .textDesc {
        margin-top: 30px;
        font-size: 30px;
        color: #7e936f;
    }
</style>

<div class="container">
    <div class="row reportTitle">
            李小齐的理财特征报告
    </div>
    <div class="row personDescIndex">
        <front>您属于：</front>
        <front class="personDesc">${dto.desc}</front>
        <front>理财人格</front>
    </div>
    <div class="row personCharactor ">
        <div class="col-md-1">
        </div>
        <div class="col-md-3 text-right">
            <div class="row">
                <canvas id="myChart4" width="300" height="300"></canvas>
            </div>
            <div class="row">
                <p>家庭理财生命周期维度</p>
            </div>
        </div>
        <div class="col-md-5 textDiv" id="text4">

        </div>
    </div>
    <div class="row personCharactor ">
        <div class="col-md-1">
        </div>
        <div class="col-md-3 text-right">
            <div class="row">
                <canvas id="myChart5" width="300" height="300"></canvas>
            </div>
            <div class="row">
                <p>风险偏好维度</p>
            </div>
        </div>
        <div class="col-md-5 textDiv" id="text5">

            <p >
                您处于家庭理财生命周期的累积阶段，这个阶段的你，年纪较轻，处于家庭的形成期。
                收入以家庭核心成员的工资为主，追求较高的收入成长率，支出随着家庭成员的增加而上升
                。在本阶段，随着家庭成员的增加您应提高寿险保额，信贷运用方面以信用卡和小额信贷为主，
                建议核心资产配置的大致比例是以股票为主，债券和货币为辅。</p>
        </div>
    </div>
    <div class="row personCharactor">
        <div class="col-md-1">
        </div>
        <div class="col-md-3 text-right">
            <div class="row">
                <canvas id="myChart6" width="300" height="300"></canvas>
            </div>
            <div class="row">
                <p>个人特性维度</p>
            </div>
        </div>
        <div class="col-md-5 textDiv" id="text6">
        </div>
    </div>
    <div class="row textDesc text-center">
        <p>综上所述，您的最佳资产配置比为：</p>
        <p>股票型产品${dto.shareRate * 100}%，债券型产品${dto.bondRate * 100}%，货币型产品${dto.currencyRate * 100}%。</p>
    </div>
    <div class="row">
        <div class="col-md-3">

        </div>
        <div class="col-md-6" style="height: 300px">
            <img src="<%=basePath%>images/test.png" alt="" class="img-responsive center-center"/>

            <%--<canvas id="myChart" width="400" height="400"></canvas>--%>
        </div>
        <div class="col-md-3">

        </div>

    </div>
    <div class="row text-center">
        <div class="row text-center">
            <div class="col-md-offset-2 col-md-3">
                <button type="button" class="btn btn-primary btn-lg center-block" id="reportRecommendButton2" >理财推荐</button>
            </div>
            <div class="col-md-offset-1 col-md-3">
                <button type="button" class="btn btn-primary btn-lg center-block" id="questionAgainButton2" >重新评估</button>
            </div>
        </div>
    </div>
    <div class="hiddenDiv" hidden="hidden">
        <input type="text" id="evaluateResult" value="${dto.evaluateResult}"/>
        <input type="text" id="evaluateDetail" value="${dto.evaluateDetail}"/>
    </div>
    <script>

        evaluateDetail = $("#evaluateDetail").val();
        evaluateResult = $("#evaluateResult").val();

        if (evaluateResult.charAt(0) == "1") {
            $("#text4").text("处于家庭理财生命周期累积阶段的客户，" +
                    "年纪较轻，处于家庭的形成期。收入以家庭核心成员的工资为主，" +
                    "主要是双薪，追求较高的收入成长率，支出随着家庭成员的增加而上升。在本阶段" +
                    "，随着家庭成员的增加建议您应提高寿险保额，信贷运用方面以信用卡和小额信贷为主，" +
                    "建议核心资产配置的大致比例是以股票为主，配置占比70%左右，债券配置占比10%左右，货币配置占比10%左右。");
        }else if (evaluateResult.charAt(0)=="2") {
            $("#text4").text("家庭理财生命周期的巩固阶段是家庭处于成长期和成熟期的阶段。这个阶段的客户，家庭收入以核心成员发工资为主，主要是双薪，夫妻双方的收入均在这个阶段达到峰值，同时这个阶段也是“上有老下有小”的支出高峰阶段。在本阶段，保险安排建议主要以子女教育年金和养老金或者退休年金为主，辅之以给处于家庭支柱的一方配置意外险和重大疾病医疗保险以备不测；信贷资产安排主要以房屋贷款和汽车贷款的合理借贷和还款为核心；核心资产配置安排方面，由于家庭责任的日趋加大，对风险的承受力相对累积阶段呈下降趋势，因此建议本阶段的核心资产配置比例为：股票配置在50%-60%调整，债券配置在30%-40%之间调整、货币配置在10%左右。");
        }else{
            $("#text4").text("  家庭理财生命周期支出阶段的家庭处于衰老期，家庭特征为一般只有夫妻两人，且都处于退休状态。这个阶段的你，家庭面临着收入下降甚至没有收入的境况，依靠退休金和养老金度过晚年，收入的来源主要靠理财收入和转移性收入为主，或者通过变现资产获得收入，因此本阶段的客户风险承受能力较低。在本阶段，建议客户在保险安排方面应投保长期看护险、受领即期年金；可以考虑遗产信托；信贷资产为零；在核心资产配置方面，建议股票配置占比小于20%、债券配置占比60%左右、货币配置占比20%左右。");
        }

        if (evaluateResult.charAt(1)=="1") {
            $("#text5").text("  进取型的投资者往往是风险喜好者，风险喜好者将风险视为挑战或者机遇，倾向于低估风险，喜欢较高的可变性，在一个情景假想中容易朝着好的方向进行自我暗示（即强调收益的可能性），偏好模棱两可，相对于确定性更喜欢不确定性。因此，在核心资产的配置上，应适当提高股票型产品的比例，降低债券和货币型产品的比例。");
        }else if (evaluateResult.charAt(1)=="2") {
            $("#text5").text("  均衡型的投资者往往是风险中性者，风险中性者介于风险喜好者和风险厌恶者之间，属于极具我国中庸思想的一类人群。因此，在资产配置比上，股票、债券和货币型产品的比例建议都像均衡值方向略微调整。家庭责任的日趋加大，对风险的承受力相对累积阶段呈下降趋势，因此，在核心资产配置上，应适当降低股票型产品的比例，提高债券型产品的比例。");
        }else{
            $("#text5").text("  保守型的投资者往往是风险厌恶者，将风险视为危险，倾向于高估风险，喜欢较低的可变性，在一个情景假想中容易朝着坏的方向进行自我暗示（即强调损失的可能性），偏好秩序，相对于不确定性更喜欢确定性。因此，在核心资产配置上，应适当降低股票型产品的比例，提高债券和货币型产品的比例。");
        }
        if (evaluateResult.charAt(2)=="1") {
            $("#text6").text("  现实主义者擅于量化分析问题，实事求是，善于反省，讲究方法，注重细节；偏向于节制性，有条理，系统性；为人客观，仔细，独立，理想，拘谨，保守，节约，耐心。对风险较为敏感，期望较为稳定的收益，因此，作为现实主义投资者可以适当提高货币型产品在核心资产中的比例。");
        }else if (evaluateResult.charAt(2)=="2") {
            $("#text6").text("理想主义者擅于接受新事物，想象力丰富，有同情心，信任他人，积极上进，相信直觉；偏向于情绪化，个性化，有点敏感；为人友善，大方，仁慈，专注，衷心，善良，热情。对风险略为敏感，并且期望略高的收益，因此，作为理想主义投资者可以适当提高股票型产品和债券型产品在核心资产中的比例");
        }else if (evaluateResult.charAt(2)=="3") {
            $("#text6").text("  行动主义者拥有较强的组织能力和控制能力，愿意承担风险；偏向于积极行动，愿意竞争，充满热情，有进取心，有目标，有野心；为人主动，自信，自傲，强硬，果断，勇敢。对风险略为敏感，并且期望较高的收益，因此，作为行动主义投资者可以适当提高股票型产品产品在核心资产中的比例。");
        }else{
            $("#text6").text("  实用主义者擅长因地制宜，权衡利弊；拥有较强的创造力，洞察力，喜欢社交，适应性强；偏向于多样化，试探性，可调整的状态；为人易相处，合作性强，明智，谦虚，温顺。风险较为敏感，期望较为稳定又略高的收益，因此，作为实用主义投资者可以适当提高债券型产品和货币型产品在核心资产中的比例。");
        }

        details = evaluateDetail.split(",");
        detail1 = details[0].split("+");
        detail2 = details[1].split("+");
        detail3 = details[2].split("+");

        var ctx1 = document.getElementById("myChart4").getContext("2d");

        var data1 = {
            labels: ["累积阶段", "巩固阶段", "支出阶段"],
            datasets: [
                {
                    fillColor: "rgba(220,220,220,0.5)",
                    strokeColor: "rgba(220,220,220,1)",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    data: [detail1[0], detail1[1], detail1[2]]
                }
            ]
        }
        var myNewChart1 = new Chart(ctx1).Radar(data1,{
            scaleShowLabels:true

        });

        var ctx2 = document.getElementById("myChart5").getContext("2d");

        var data2 = {
            labels: ["进取型", "均衡型", "保守型"],
            datasets: [
                {
                    fillColor: "rgba(220,220,220,0.5)",
                    strokeColor: "rgba(220,220,220,1)",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    data: [detail2[0], detail2[1], detail2[2]]
                }
            ]
        }
        var myNewChart2 = new Chart(ctx2).Radar(data2,{
            scaleShowLabels:true

        });

        var ctx3 = document.getElementById("myChart6").getContext("2d");

        var data3 = {
            labels: ["现实主义", "理想主义", "行动主义", "实用主义"],
            datasets: [
                {
                    fillColor: "rgba(220,220,220,0.5)",
                    strokeColor: "rgba(220,220,220,1)",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    data: [detail3[0], detail3[1], detail3[2], detail3[3]]
                }
            ]
        }
        var myNewChart3 = new Chart(ctx3).Radar(data3,{
            scaleShowLabels:true

        });
    </script>


</div>


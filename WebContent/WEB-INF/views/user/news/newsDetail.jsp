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
        <h2>周小川：中国能够实现今年约6.5%的经济增长目标</h2>
    </div>
    <div class="row">
        <img src="4." alt=""/>
    </div>
    <div class="row">
        <p> 据新华社英文报道，中国央行行长周小川在IMF网站发布的公告中表示，中国能够实现今年6.5%左右的经济增长目标，中国“完全有信心”预防和消除系统性金融风险；未来货币政策仍将保持“稳健中性”。

            　　“2017年第一季度中国经济增长动能保持强劲，国内生产总值（GDP）同比增长6.9%，通胀率为1.4%。”周小川在声明中表示。

            　　“随着投资和贸易增长的稳定和复苏，消费增长稳定，就业大体上保持平稳，中国今年有望实现6.5%的增长目标。”周小川表示。

            　　周小川称，中国“完全有信心”预防和消除系统性金融风险，因工业企业的盈利已得到显著改善，银行业的资本和准备金保持充足，“企业和金融部门保持广泛韧性，风险受到很好控制。”他表示。

            　　周小川表示，下一步，货币政策仍将保持“稳健中性”，将努力在稳定增长以及去杠杆、防止资产泡沫、抑制系统性风险累积的任务之间寻求更好的平衡。

            　　周小川重申，中国政府将继续“全方位推进改革”，包括在金融部门、财政税收制度和国有企业领域进行改革，以及在煤炭、钢铁等行业解决产能过剩问题。</p>
    </div>

</div>


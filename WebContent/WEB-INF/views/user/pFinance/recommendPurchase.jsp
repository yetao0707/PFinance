<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp" %>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<script>
    $(function () {
        $("#buyMoneyInput").val(localStorage.moneyToBuy);
        $("#recommendPurchaseBackButton").on("click", function () {
            $("#pFinanace").load("pFinanceIndex");

        });
        $("#recommendPurchaseBuyButton").on("click", function () {
            var str = "";
            $(".recommendProjectBuyDiv").each(function () {
                if ($(this).find("input:checkbox").is(":checked")) {
                    var moneyInput = $(this).find("input:text");
                    str = str + moneyInput.attr("id") + "_" + moneyInput.val() + ",";
                }
            });
            str = str.substring(0, str.length - 1);
//            alert(str);
            localStorage.paramStr = str;
            $("#pFinanace").load("pFinanceCustomerRead");
        });
        $("#recommendPurchaseMoneyConfirmButton").on("click", function () {
            localStorage.moneyToBuy = $("#buyMoneyInput").val();
            $("#pFinanace").load("getPersonalFinance?money=" + $("#buyMoneyInput").val(), function () {
                $("#hiddenDefaultDiv").attr("hidden", false);
            });


        });
    });
</script>
<style>
    .purchaseGroup {
        margin-left: 300px;
    }

    .header {
        margin-top: 30px;
        font-size: 40px;
    }

    .recommendProjectBuyDiv {
        size: 300px;
    }
</style>
<div class="container">
    <div class="row" style="height: 50px"></div>
    <div class="row input-group col-md-6 purchaseGroup">
        <span class="input-group-addon">购买金额(元):</span>
        <input type="text" class="form-control" id="buyMoneyInput">
        <span class="input-group-btn">
                <button type="button" class="btn btn-primary btn-sm"
                        id="recommendPurchaseMoneyConfirmButton">确定</button>
             </span>
    </div>

    <div class="row text-center" id="hiddenDefaultDiv" hidden="true">

        <div class="row header">
            <p class="text-center">您将购买以下产品</p>
        </div>
        <div class="row">

            <table class="table">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>产品名称</th>
                    <th>产品类型</th>
                    <th>年化收益率（%）</th>
                    <th>购买金额（元）</th>
                    <th>预计年收益（元）</th>
                    <th>投资时长（天）</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${recommendDTO.recommendCurrencys}" var="pojo" varStatus="index">
                    <tr>
                        <td>${index.count}</td>
                        <td>${pojo.currencyName}</td>
                        <td><p>货币型产品</p></td>
                        <td>${pojo.profitYield}</td>
                        <td><p class="moneyP">${pojo.recommendMoney2Buy}</p></td>
                        <td><fmt:formatNumber type="number" value="${pojo.recommendMoney2Buy*pojo.profitYield}" maxFractionDigits="2"/></td>
                        <td>${pojo.durationDays}</td>
                    </tr>
                </c:forEach>
                <c:forEach items="${recommendDTO.recommendFunds}" var="pojo" varStatus="index">
                    <tr>
                        <td>${recommendDTO.recommendCurrencys.size()+index.count}</td>
                        <td>${pojo.fundName}</td>
                        <td>
                            <p>
                                <c:choose>
                                    <c:when test="${pojo.fundType==1 }">
                                        货币型基金
                                    </c:when>
                                    <c:when test="${pojo.fundType==2 }">
                                        债券型基金
                                    </c:when>

                                    <c:when test="${pojo.fundType==3 }">
                                        股票型基金
                                    </c:when>

                                    <c:when test="${pojo.fundType==4 }">
                                        混合型基金
                                    </c:when>
                                </c:choose>
                            </p>
                        </td>
                        <td>${pojo.expectedYield}</td>
                        <td><p class="moneyP">${pojo.recommendMoney2Buy}</p></td>
                        <td><fmt:formatNumber type="number" value="${pojo.recommendMoney2Buy*pojo.expectedYield}" maxFractionDigits="2"/></td>
                        <td>${pojo.duration}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
        <div class="row sectionDiv" style="width: 650px;height:410px;margin-left: 300px">
            <div id="pieChart" style="width: 600px;height:400px;"></div>
        </div>
        <div class="row">
            <div class="row header">
                <p>请选择要购买的产品和交易顺序</p>
            </div>
            <div class="row">
                <c:forEach items="${recommendDTO.recommendCurrencys}" var="pojo" varStatus="index">
                    <div class="row recommendProjectBuyDiv text-center">
                        <div class="col-md-3">
                        </div>
                        <div class="col-md-3 text-right">
                            <input type="text" class="inputMoney" id="${pojo.id}_1" value="${pojo.recommendMoney2Buy}">
                        </div>
                        <div class="col-md-3 text-left">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" checked="checked">
                                    <p>${pojo.currencyName}</p>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-3">
                        </div>
                    </div>
                </c:forEach>
                <c:forEach items="${recommendDTO.recommendFunds}" var="pojo" varStatus="index">
                    <div class="row recommendProjectBuyDiv">
                        <div class="col-md-3">
                        </div>
                        <div class="col-md-3 text-right">
                            <input type="text" class="inputMoney" id="${pojo.id}_2" value="${pojo.recommendMoney2Buy}">
                        </div>
                        <div class="col-md-3 text-left">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" checked="checked">
                                    <p>${pojo.fundName}</p>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-3">
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="col-md-6">
                    <button type="button" class="btn btn-primary btn-sm" id="recommendPurchaseBackButton">返回</button>
                </div>
                <div class="col-md-6">
                    <button type="button" class="btn btn-primary btn-sm" id="recommendPurchaseBuyButton">开始交易</button>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>

    </div>
    <div class="hiddenDiv" hidden="hidden">
        <input type="text" class="evaluateResult" value="${customerDTO.evaluateResult}"/>
        <input type="text" class="evaluateDetail" value="${customerDTO.evaluateDetail}"/>
        <input type="text" class="shareRate" value="${shareRate}"/>
        <input type="text" class="currencyRate" value="${currencyRate}"/>
        <input type="text" class="bondRate" value="${bondRate}"/>
    </div>

</div>
<%--<script>--%>
    <%--var ctx = document.getElementById("pieChart").getContext("2d");--%>

    <%--var data = [--%>
        <%--{--%>
            <%--value: 30,--%>
            <%--color: "#F38630"--%>
        <%--},--%>
        <%--{--%>
            <%--value: 50,--%>
            <%--color: "#E0E4CC"--%>
        <%--},--%>
        <%--{--%>
            <%--value: 100,--%>
            <%--color: "#69D2E7"--%>
        <%--}--%>
    <%--]--%>
    <%--var myNewChart1 = new Chart(ctx).Pie(data);--%>

    <%--//    var ctx2 = document.getElementById("myChart2").getContext("2d");--%>
<%--</script>--%>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('pieChart'));

//    alert($(".currencyRate").val());
    option = {
        title : {
            text: '推荐产品比例',
            subtext: '',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['股票型产品','债券型产品','货币型产品']
        },
        series : [
            {
                name: '访问来源',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[
                    {value:$(".shareRate").val(), name:'股票型产品'},
                    {value:$(".bondRate").val(), name:'债券型产品'},
                    {value:$(".currencyRate").val(), name:'货币型产品'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>



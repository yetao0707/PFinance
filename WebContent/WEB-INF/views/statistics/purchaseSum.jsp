<%@page contentType="text/html; charset=utf-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<style>
    .container {
        margin-left: 10px;
        height: 600px;
        width: 1200px;
        overflow-y: scroll;
        overflow-x: scroll;
    }

    /* css注释说明：设置第二个盒子与第一个盒子间距为10px，并设置了横纵滚动条样式 */
</style>


<script type="text/javascript">
    $("#purhcaseSumButton").on("click",function () {
        $.ajax({
            type: "POST",
            url: $('input[name="basePath"]').val()+"purchaseStatistic/purchaseSum",
            data: {
                startTime: $('input[name="startTime"]').val(),
                endTime: $('input[name="endTime"]').val()
            },
            dataType: "json",
            success: function (data) {
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('purchaseSum1'));

                option = {
                    title : {
                        text: '产品销售额占比',
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
                        data: ['货币型基金','股票型基金','债券型基金','货币型产品']
                    },
                    series : [
                        {
                            name: '访问来源',
                            type: 'pie',
                            radius : '55%',
                            center: ['50%', '60%'],
                            data:[
                                {value:data.currencyFundNum, name:'货币型基金'},
                                {value:data.shareFundNum, name:'股票型基金'},
                                {value:data.bondFundNum, name:'债券型基金'},
                                {value:data.currencyNum, name:'货币型产品'}
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

                var myChart1 = echarts.init(document.getElementById('purchaseSum2'));

                option1 = {
                    title : {
                        text: '各类产品销售额',
                        subtext: '',
                        x:'center'
                    },
                    color: ['#3398DB'],
                    tooltip : {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis : [
                        {
                            type : 'category',
                            data : ['货币型基金','股票型基金','债券型基金','货币型产品'],
                            axisTick: {
                                alignWithLabel: true
                            }
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value'
                        }
                    ],
                    series : [
                        {
                            name:'销售量',
                            type:'bar',
                            barWidth: '60%',
                            data:[data.currencyFundNum, data.shareFundNum,data.bondFundNum,data.currencyNum]
                        }
                    ]
                };
                myChart1.setOption(option1);

            }
        });

    });

</script>


<body>
<div class="container" style="">
    <div style="margin-left: 300px;margin-top: 100px;">
        <div class="unit" style="margin-top: 20px">
            <label>开始时间：</label>
            <input type="text" name="startTime"  dateFmt="yyyy-MM-dd HH:mm:ss" class="date required"/>
        </div>
        <div class="unit" style="margin-top: 20px">
            <label>结束时间：</label>
            <input type="text" name="endTime" value="${dto.cashingDay}" dateFmt="yyyy-MM-dd HH:mm:ss" class="date required" />
        </div>
        <div class="unit" style="margin-left: 50px;margin-top: 20px">
            <button type="button" id="purhcaseSumButton" value="查询" style="width: 100px;height:50px;display:inline-block;">查询</button>
        </div>
    </div>
    <div id="purchaseSum1" style="width: 550px;height: 350px; margin-left: 400px;margin-top: 150px;"></div>
    <div id="purchaseSum2" style="width: 550px;height: 3250px;margin-left: 300px; margin-top: 150px;"></div>
    <input type="text"  value="<%=basePath%>" name="basePath" hidden="hidden">
</div>
</body>

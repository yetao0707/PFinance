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
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('sexStatistic'));

    option = {
        title : {
            text: '用户性别统计',
            subtext: '性别',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['男','女']
        },
        series : [
            {
                name: '访问来源',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[
                    {value:87, name:'男'},
                    {value:30, name:'女'}
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

    var myChart1 = echarts.init(document.getElementById('ageStatistic'));

    option1 = {
        title : {
            text: '用户年龄分布',
            subtext: ''
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:['男','女']
        },
        toolbox: {
            show : true,
            feature : {
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                data : ['10-20','20-30','30-40','40-50','50-60','60-70','70+']
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'男',
                type:'bar',
                data:[13, 34, 45, 40, 28, 13, 7]
            },
            {
                name:'女',
                type:'bar',
                data:[8, 23, 35, 32, 18, 10, 2]
            }
        ]
    };


    // 使用刚指定的配置项和数据显示图表。
    myChart1.setOption(option1);
</script>


<body>
<div class="container" style="">
    <div id="sexStatistic" style="width: 850px;height: 450px; margin-left: 200px"></div>
    <div id="ageStatistic" style="width: 850px;height: 450px;margin-left: 200px"></div>
</div>
</body>

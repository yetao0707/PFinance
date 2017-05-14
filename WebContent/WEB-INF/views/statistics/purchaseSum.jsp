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

<script type="text/javascript" charset="utf-8">
    /* Title settings */
    title = "";
    titleXpos = 390;
    titleYpos = 85;

    /* Pie Data */
    pieRadius = 130;
    pieXpos = 150;
    pieYpos = 180;
    pieData = [1149422, 551315,132313];
    pieLegend = [
        "%%.%% – 基金",
        "%%.%% – 基金",
        "%%.%% – 货币"];

    pieLegendPos = "east";

    $(function () {
        var r = Raphael("chartHolder1");

        r.text(titleXpos, titleYpos, title).attr({"font-size": 20});

        var pie = r.piechart(pieXpos, pieYpos, pieRadius, pieData, {legend: pieLegend, legendpos: pieLegendPos});
        pie.hover(function () {
            this.sector.stop();
            this.sector.scale(1.1, 1.1, this.cx, this.cy);
            if (this.label) {
                this.label[0].stop();
                this.label[0].attr({r: 7.5});
                this.label[1].attr({"font-weight": 800});
            }
        }, function () {
            this.sector.animate({transform: 's1 1 ' + this.cx + ' ' + this.cy}, 500, "bounce");
            if (this.label) {
                this.label[0].animate({r: 5}, 500, "bounce");
                this.label[1].attr({"font-weight": 400});
            }
        });

    });
</script>

<script type="text/javascript">
    var options = {
        stacked: false,
        gutter:20,
        axis: "0 0 1 1", // Where to put the labels (trbl)
        axisystep: 10 // How many x interval labels to render (axisystep does the same for the y axis)
    };

    $(function() {
        // Creates canvas
        var r = Raphael("chartHolder2");
        var data = [[160000,150000,170000,200000],[220000,200000,210000,170000]]

        // stacked: false
        var chart1 = r.hbarchart(40, 10, 320, 220, data, options).hover(function() {
            this.flag = r.popup(this.bar.x, this.bar.y, this.bar.value, "right").insertBefore(this);
        }, function() {
            this.flag.animate({opacity: 0}, 500, ">", function () {this.remove();});
        });
        chart1.label([["基金交易", "A2", "A3", "A4"],["B1",  "B2", "B3", "B4"]],true);


        // stacked: true
        options.stacked=true;

//        var chart2 = r.hbarchart(400, 10, 320, 220, data, options).hoverColumn(function() {
//            var y = [], res = [];
//            for (var i = this.bars.length; i--;) {
//                y.push(this.bars[i].y);
//                res.push(this.bars[i].value || "0");
//            }
//            this.flag = r.popup(this.bars[0].x, Math.min.apply(Math, y), res.join(", "), "right").insertBefore(this);
//        }, function() {
//            this.flag.animate({opacity: 0}, 500, ">", function () {this.remove();});
//        });
//        chart2.label([["A1", "A2", "A3", "A4"],["B1",  "B2", "B3", "B4"]],true);
    });
</script>



<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('chartHolder'));

    option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'value'
        },
        yAxis: {
            type: 'category',
            data: ['货币性产品', '债券型产品', '股票型产品']
        },
        series: [
            {
                name: '直接访问',
                type: 'bar',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        position: 'insideRight'
                    }
                },
                data: [13, 15, 22]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>


<body>
<div class="container" style="">
    <div id="chartHolder1" style="width: 850px;height: 450px; margin-left: 300px"></div>
    <div id="chartHolder2" style="width: 850px;height: 450px;margin-left: 300px"></div>
    <div id="chartHolder" style="width: 850px;height: 450px;margin-left: 200px"></div>
</div>
</body>

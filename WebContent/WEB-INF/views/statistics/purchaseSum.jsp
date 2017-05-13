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
        var data = [[10,20,30,50],[15,25,35,50]]

        // stacked: false
        var chart1 = r.hbarchart(40, 10, 320, 220, data, options).hover(function() {
            this.flag = r.popup(this.bar.x, this.bar.y, this.bar.value, "right").insertBefore(this);
        }, function() {
            this.flag.animate({opacity: 0}, 500, ">", function () {this.remove();});
        });
        chart1.label([["A1", "A2", "A3", "A4"],["B1",  "B2", "B3", "B4"]],true);


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
    var options = {
        axis: "0 0 1 1", // Where to put the labels (trbl)
        axisxstep: 16, // How many x interval labels to render (axisystep does the same for the y axis)
        shade: true, // true, false
        smooth: false, //曲线
        symbol: "circle",
        colors: ["#F44"]
    };

    $(function () {

        // Make the raphael object
        var r = Raphael("chartHolder");

        var lines = r.linechart(
                20, // X start in pixels
                10, // Y start in pixels
                600, // Width of chart in pixels
                400, // Height of chart in pixels
                [.5, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5], // Array of x coordinates equal in length to ycoords
                [7, 11, 9, 16, 3, 19, 12, 12, 15], // Array of y coordinates equal in length to xcoords
                options // opts object
        );

        // Modify the x axis labels
        var xText = lines.axis[0].text.items;
        for (var i in xText) { // Iterate through the array of dom elems, the current dom elem will be i
            var _oldLabel = (xText[i].attr('text') + "").split('.'), // Get the current dom elem in the loop, and split it on the decimal
                    _newLabel = _oldLabel[0] + ":" + (_oldLabel[1] == undefined ? '00' : '30'); // Format the result into time strings
            xText[i].attr({'text': _newLabel}); // Set the text of the current elem with the result
        }
        ;
    });
</script>


<body>
<div class="container">
    <div id="chartHolder1" style="width: 650px;height: 450px"></div>
    <div id="chartHolder2"></div>
    <div id="chartHolder" style="width: 650px;height: 450px"></div>
</div>
</body>

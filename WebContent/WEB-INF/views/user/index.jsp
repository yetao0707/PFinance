<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../taglib.jsp" %>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>PFinance</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<style>
    .greenDiv {
        background-color: #b7c9ff;
    }

    .blueDiv {
        background-color: #84a8ff;
    }

    .sectionDiv {
        margin-top: 30px;
    }

    .header1 {
        font-size: 40px;
    }

    .header2 {
        font-size: 30px;
    }

    .header3 {
        font-size: 20px;
    }

    .header4 {
        font-size: 10px;
    }

    .borderDiv {
        border: 1px solid rgba(13, 2, 10, 0.94);
    }

</style>
<script>
    $(function () {
        $('#myTab a').click(function (e) {
            e.preventDefault();
            $(this).tab('show');
        });
        $("#home").load("index", function () {
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
                alert(a.attr("href"));
//                $('#myTab a:last').tab('show');
                a.click();
            });
            $('#productButton').on('click', function (e) {
                e.preventDefault();
                a = $('#myTab a[href="#product"]');
                a.click();
            });
            $('#homeToQuestionEvaluate').on('click', function (e) {
                e.preventDefault();
                a = $('#myTab a[href="#pFinanace"]');
                a.click();
            });
        });
        $("#product").load("productIndex");
        $("#pFinanace").load("pFinanceIndex",function(){

            $("#questionSubmitButton").click(function(){
                //验证
                var a1=0;
                var a2=0;
                var a3=0;
                var b11=0;
                var b12=0;
                var b13=0;
                var b21=0;
                var b22=0;
                var b23=0;
                var c1=0;
                var c2=0;
                var c3=0;
                var c4=0;
                for(var i=1;i<28;i++){
                	var a=$("input[name='"+i+"answer']:checked");
                	var val=a.val();
            		if(val==undefined){
            			if(i==13||i==14){
            				continue;
            			}
            			alert("请作答第"+i+"题！");
                        return;
            		}
                	var div=a.parent().parent();
                	weights=div.attr("value").split("+");
                	if(a.attr("type")=="radio"){
                		var value=a.val();
                		var values=value.split("+");
                		if(values[0]!=""){
                			valuesDetail=values[0].split("_");
                			a1+=Number(valuesDetail[0])*Number(weights[0]);
                			a2+=Number(valuesDetail[1])*Number(weights[0]);
                			a3+=Number(valuesDetail[2])*Number(weights[0]);
                		}
                		if(values[1]!=""){
                			valuesDetail=values[1].split("_");
                			b11+=Number(valuesDetail[0])*Number(weights[1]);
                			b12+=Number(valuesDetail[1])*Number(weights[1]);
                			b13+=Number(valuesDetail[2])*Number(weights[1]);
                		}
                		if(values[2]!=""){
                			valuesDetail=values[2].split("_");
                			b21+=Number(valuesDetail[0])*Number(weights[2]);
                			b22+=Number(valuesDetail[1])*Number(weights[2]);
                			b23+=Number(valuesDetail[2])*Number(weights[2]);
                		}
                		if(values[3]!=""){
                			valuesDetail=values[3].split("_");
                			c1+=Number(valuesDetail[0])*Number(weights[3]);
                			c2+=Number(valuesDetail[1])*Number(weights[3]);
                			c3+=Number(valuesDetail[2])*Number(weights[3]);
                			c4+=Number(valuesDetail[3])*Number(weights[3]);
                		}
                	}else{
                		var value=a.val();
                		if(value==undefined){
                			alert("请作答第"+i+"题！");
                            return;
                		}
                		var s=''; 
                		var ta1=0;
        	            var ta2=0;
        	            var ta3=0;
        	            var tb11=0;
        	            var tb12=0;
        	            var tb13=0;
        	            var tb21=0;
        	            var tb22=0;
        	            var tb23=0;
        	            var tc1=0;
        	            var tc2=0;
        	            var tc3=0;
        	            var tc4=0;
                		for(var i2=0; i2<a.length; i2++){ 
                			if(a[i2].checked) s+=a[i2].value+','; //如果选中，将value添加到变量s中 
                		} 
                		s=s.substring(0,s.length-1);
                		strs=s.split(",");
                		for(i3=0;i3<strs.length;i3++){
                			value=strs[i3];
                			if(value!=""){
                				var values=value.split("+");
                        		if(values[0]!=""){
                        			valuesDetail=values[0].split("_");
                        			ta1+=Number(valuesDetail[0])*Number(weights[0]);
                        			ta2+=Number(valuesDetail[1])*Number(weights[0]);
                        			ta3+=Number(valuesDetail[2])*Number(weights[0]);
                        		}
                        		if(values[1]!=""){
                        			valuesDetail=values[1].split("_");
                        			tb11+=Number(valuesDetail[0])*Number(weights[1]);
                        			tb12+=Number(valuesDetail[1])*Number(weights[1]);
                        			tb13+=Number(valuesDetail[2])*Number(weights[1]);
                        		}
                        		if(values[2]!=""){
                        			valuesDetail=values[2].split("_");
                        			b21+=Number(valuesDetail[0])*Number(weights[2]);
                        			b22+=Number(valuesDetail[1])*Number(weights[2]);
                        			b23+=Number(valuesDetail[2])*Number(weights[2]);
                        		}
                        		if(values[3]!=""){
                        			valuesDetail=values[3].split("_");
                        			c1+=Number(valuesDetail[0])*Number(weights[3]);
                        			c2+=Number(valuesDetail[1])*Number(weights[3]);
                        			c3+=Number(valuesDetail[2])*Number(weights[3]);
                        			c4+=Number(valuesDetail[3])*Number(weights[3]);
                        		}
                			}
                		}
                		a1+=ta1/strs.length;
                		a2+=ta2/strs.length;
                		a3+=ta3/strs.length;
                		b11+=tb11/strs.length;
                		b12+=tb12/strs.length;
                		b13+=tb13/strs.length;
                		b21+=tb22/strs.length;
                		b22+=tb22/strs.length;
                		b23+=tb23/strs.length;
                		c1+=tc1/strs.length;
                		c2+=tc2/strs.length;
                		c3+=tc3/strs.length;
                		c4+=tc2/strs.length;
                	}
                }
                evaluateResult="";

                if(a1>=a2 && a1>=a3){
                    evaluateResult=evaluateResult+"1";
                }else if(a2>=a1 && a2>=a3){
                    evaluateResult+=2;
                }else{
                    evaluateResult+=3;
                }
                b1=b11+1.5*b21;
                b2=b12+1.5*b22;
                b3=b13+1.5*b23;
                

                if(b1>=b2 && b1>=b3){
                    evaluateResult=evaluateResult+"1";
                }else if(b2>=b1 && b2>=b3){
                    evaluateResult+=2;
                }else{
                    evaluateResult+=3;
                }

                if(c1>=c2 && c1>=c3 && c1>=c4){
                    evaluateResult=evaluateResult+"1";
                }else if(c2>=c1 && c2>=c3 && c2>=c4){
                    evaluateResult+=2;
                }else if(c3>=c1 && c3>=c2 && c3>=c4){
                    evaluateResult+=3;
                }else{
                    evaluateResult+=4;
                }
                $.ajax({
                    type : "post",
                    url : "saveEvaluateResult",
                    data : {
                        evaluateResult : evaluateResult
                    },
                    dataType : "json",
                    success : function(data) {
                        // alert(data.statusCode);

                        if (data.statusCode == "200") {
                        	alert("测评成功");
                           // $("#pFinanace").load("pFinanceIndex");
                            
                        } else {
                            alert("测评失败失败：" + data.message);
                        }
                    }
                });
            });
        });
        $("#news").load("newsIndex");
        $("#center").load("personIndex");
        $("#comment").load("commentIndex");

//        alert(1);
//        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
//            // 获取已激活的标签页的名称
//            var activeTab = $(e.target).attr("href");
//            if (activeTab=="#home"){
//                $("#home").load("index");
//            } else if(activeTab=="#product"){
//                $("#product").load("productIndex");
//            } else if(activeTab=="#pFinanace"){
//                $("#pFinanace").load("pFinanceIndex");
//            } else if(activeTab=="#news"){
//                $("#news").load("newsIndex");
//            } else if(activeTab=="#center"){
//                $("#center").load("personIndex");
//            } else if(activeTab=="#comment"){
//                $("#comment").load("commentIndex");
//            }
//        });
    });

</script>
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
<%--$('#myTab a[href="#product"]').tab(show);--%>
<%--});--%>
<%--});--%>
<%--</script>--%>

​
<div class="container">

    <nav class="navbar navbar-default" role="navigation">

        <div class="navbar-header">
            <a class="navbar-brand" href="#">PFinance</a>
        </div>
        <ul id="myTab" class="nav nav-tabs navbar-center col-md-offset-3">
            <li class="active"><a href="#home" data-toggle="tab">首页</a></li>
            <li><a href="#product" data-toggle="tab">理财产品</a></li>
            <li><a href="#pFinanace" data-toggle="tab">专属理财</a></li>
            <li><a href="#news" data-toggle="tab">资讯中心</a></li>
            <li><a href="#center" data-toggle="tab">个人中心</a></li>
            <li><a href="#comment" data-toggle="tab">意见箱</a></li>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
            </ul>
        </ul>
    </nav>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="home">


        </div>
        <%--</div>--%>


        <div class="tab-pane fade" id="product">

        </div>
        <div class="tab-pane fade" id="pFinanace">

        </div>
        <div class="tab-pane fade" id="news">
            <p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的 J2EE 上。
            </p>
        </div>
        <div class="tab-pane fade" id="center">
            <p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的 J2EE 上。
            </p>
        </div>
        <div class="tab-pane fade" id="comment">
            <p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的 J2EE 上。
            </p>
        </div>

    </div>

</div>
<script>
    $(function () {
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            // 获取已激活的标签页的名称
            var activeTab = $(e.target).text();
            // 获取前一个激活的标签页的名称
            var previousTab = $(e.relatedTarget).text();
            $(".active-tab span").html(activeTab);
            $(".previous-tab span").html(previousTab);
        });
    });
</script>
​
</body>
</html>

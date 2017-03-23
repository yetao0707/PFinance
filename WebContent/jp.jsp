<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>转盘</title>
<style type="text/css">
.demo{width:417px; height:417px; position:relative; margin:50px auto}
#disk{width:417px; height:417px; background:url(images/disk.jpg) no-repeat}
#start{width:163px; height:320px; position:absolute; top:46px; left:130px;}
#start img{cursor:pointer}
</style>
<!-- <style>
    *{padding:0;margin:0}
    body{
        text-align:center
    }
    .ly-plate{
        position:relative;
        width:509px;
        height:509px;
        margin: 50px auto;
    }
    .rotate-bg{
        width:509px;
        height:509px;
        background:url(images/disk.jpg);
        position:absolute;
        top:0;
        left:0
    }
    .ly-plate div.lottery-star{
        width:214px;
        height:214px;
        position:absolute;
        top:150px;
        left:147px;
        /*text-indent:-999em;
        overflow:hidden;
        background:url(rotate-static.png);
        -webkit-transform:rotate(0deg);*/
        outline:none
    }
    .ly-plate div.lottery-star #lotteryBtn{
        cursor: pointer;
        position: absolute;
        top:0;
        left:0;
        *left:-107px
    }
</style> -->
</head>
<body>
    <div class="ly-plate">
        <div class="rotate-bg"></div>
        <div class="lottery-star"><img src="images/start.png" id="lotteryBtn"></div>
    </div>
</body>



<script>
$(function(){
	$("#startbtn").rotate({
		bind:{
			click:function(){
				var a = Math.floor(Math.random() * 360);
				 $(this).rotate({
					 	duration:3000,
					 	angle: 0, 
            			animateTo:1440+a,
						easing: $.easing.easeOutSine,
						callback: function(){
							alert('中奖了！');
						}
				 });
			}
		}
	});
});
</script>

<script type="text/javascript" src="js/jQueryRotate.2.2.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
</html>
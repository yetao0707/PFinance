$(document).ready(function(){
	
	
	
	$("#submit").click(function(){
		//验证
		for(var i=1;i<28;i++){
			if($("input[class='"+i+"answer']:checked").val()==undefined){
				alert("请作答第"+i+"题！");
				return;
			}
		}
		
		var value1=Number($("input[class=1answer']:checked").val());
		var value2=Number($("input[class=2answer']:checked").val());
		var value3=Number($("input[class=3answer']:checked").val());
		var value4=Number($("input[class=4answer']:checked").val());
		var value5=Number($("input[class=5answer']:checked").val());
		var value6=Number($("input[class=6answer']:checked").val());
		var value7=Number($("input[class=7answer']:checked").val());
		var value9=Number($("input[class=9answer']:checked").val());
		var value13=Number($("input[class=13answer']:checked").val());
		var value15=Number($("input[class=15answer']:checked").val());
		var value17=Number($("input[class=17answer']:checked").val());
		var value19=Number($("input[class=19answer']:checked").val());
		var value20=Number($("input[class=20answer']:checked").val());
		var value22=Number($("input[class=22answer']:checked").val());
		var value23=Number($("input[class=23answer']:checked").val());
		var value24=Number($("input[class=24answer']:checked").val());
		var value25=Number($("input[class=25answer']:checked").val());
		
		var aValue=7*value2+0.5*value6+value7+value9;
		var bValue=value1+value2 +value4 +value5 +value6 +value7 +value9 +value13 +value15 +value17
		            +2*value19 +2*value20 +2*value22 +2*value23 +2*value24;
		var cValue=2*value3+value25;
		var evaluateResult="";
		
		if(aValue<=28){
			evaluateResut+=1;
		}else if(aValue<=35){
			evaluateResut+=2;
		}else{
			evaluateResut+=3;
		}
		
		if(aValue<=25){
			evaluateResut+=1;
		}else if(aValue<=50){
			evaluateResut+=2;
		}else{
			evaluateResut+=3;
		}
		
		if(aValue<=3){
			evaluateResut+=1;
		}else if(aValue<=5){
			evaluateResut+=2;
		}else if(aValue<=7){
			evaluateResut+=3;
		}else{
			evaluateResut+=4;
		}
		$.ajax({
			type : "post",
			url : "evaluate/update",
			data : {
				evaluateResut : evaluateResut
			},
			dataType : "json",
			success : function(data) {
				// alert(data.statusCode);

				if (data.statusCode == "200") {
					alertMsg.correct("测评成功");

				} else {
					alertMsg.info("测评失败失败：" + data.message);
				}
			}
		});
	});
	
});
$(document).ready(function(){
	$(".button").click(function(){
		var string="#"+$(this).attr("id");
		var role=string+"role";
		var c=$(string+"openDate").val();
		$.ajax({
			type : "post",
			url : "setTime",
			data : {
				id : $(string).val(),
				role : $(string+"role").val(),
				openDate : $(string+"openDate").val(),
				endDate : $(string+"endDate").val()
			},
			dataType : "json",
			success : function(data) {
				// alert(data.statusCode);

				if (data.code == "1") {
					
					alertMsg.correct('您的数据提交成功！');

				} else {
					alertMsg.info("操作失败：" + data.message);
					
				}
			}
		});
	});
	$("button").click(function(){
		alert("122");
	});
});
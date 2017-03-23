$(document).ready(function() {
	
	if ($("#isOver").val()=="1") {
		$("input").attr("disabled","disabled");
	}
	
	$(".detailHref").click(function() {
		var url = "userShow?id=" + $(this).attr("id");
		window.open(url,"newwindow","height=400, width=800, toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=no, status=no");
		
//		$("iframe").attr({
//			"src" : url,
//			"hidden" : false
//		});
	});
	$(".backHref").click(function() {
		$.ajax({
			type : "post",
			url : "backUser",
			data : {
				id : $(this).attr("id")
			},
			dataType : "json",
			success : function(data) {
				// alert(data.statusCode);

				if (data.code == "1") {
					alert("操作成功");
					window.opener.location.reload();

				} else {
					alert("操作失败：" + data.message);
				}
			}
		});
		// alert(data);
	});
	$("#commitbutton").click(function() {
		
		var list="";var i=0;
		$("input:checkbox[name=checkbox]:checked'").each(function() {
			list+= $(this).val() + "_";i++;
				//checks += $(this).val() + "|"; // 动态拼取选中的checkbox的值，用“|”符号分隔
			
		});
		//判断是否超出可推荐名额
		if (i>parseInt($("#recmmendnum").val())) {
			alert("超出名额！");
			return;
		}
		$.ajax({
			type : "post",
			url : "submitUser",
			data : {
				"list" : list,
				id:$("#departmentId").val()
			},
			dataType : "json",
			success : function(data) {
				// alert(data.statusCode);

				if (data.code == "1") {
					alert("操作成功");
					location.reload();

				} else {
					alert("操作失败：" + data.message);
				}
			}
		});
	});
	$("#creatbutton").click(function(){
		var list="";
		$("input:checkbox[name=checkbox]:checked'").each(function() {
			list+= $(this).val() + "_";;
			
		});
		if (list=="") {
			alert("请选择至少一列");
			return;
		}
		var url="creatTable?list="+list;
		window.open(url,"newwindow","height=400, width=800, toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=no, status=no");		
		//$("#load").load("creatTable",{"list" : list});
		

	});

});
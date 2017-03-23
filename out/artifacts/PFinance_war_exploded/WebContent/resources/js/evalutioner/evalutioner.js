$(document).ready(function() {
	
	if ($("#isOver").val() == "1") {
		
		$("input:button").attr("disabled", "disabled");
		$("#commitbutton3").remove();
	}
	
	$(".detailHref").click(function() {
		//获取主机地址，如： http://localhost:8083
		//获取当前网址，如： http://localhost:8080/Tmall/index.jsp
		var curWwwPath=window.document.location.href;
		 
		//获取主机地址之后的目录如：/Tmall/index.jsp
		 
		var pathName=window.document.location.pathname;
		 
		 
		var pos=curWwwPath.indexOf(pathName);
		//获取主机地址，如： http://localhost:8083
	    var localhostPaht=curWwwPath.substring(0,pos);
	    //获取带"/"的项目名，如：/uimcardprj
	    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	    var local=localhostPaht+projectName;
		var url = local+"/department/userShow?id=" + $(this).attr("id");
		window.open(url,"newwindow","height=400, width=800, toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=no, status=no");

	});
	
	$("#commitbutton").click(function() {
		
		var list="";var i=0;
		$("input:checkbox[name=checkbox]:checked'").each(function() {
			list+= $(this).val() + "_";i++;
				//checks += $(this).val() + "|"; // 动态拼取选中的checkbox的值，用“|”符号分隔
			
		});
		//判断是否超出可推荐名额
		if (i>parseInt($("#recommandNum").val())) {
			alert("超出名额！");
			return;
		}
		$.ajax({
			type : "post",
			url : "submitUser",
			data : {
				"list" : list,
				id:$("#evalutionId").val()
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
	

	$("#commitbutton2").click(function() {

		var list = "";
		var i = 0;
		$("input:checkbox[name=checkbox]:checked'").each(function() {
			list += $(this).val() + "_";
			i++;
			// checks += $(this).val() + "|"; // 动态拼取选中的checkbox的值，用“|”符号分隔

		});
		// 判断是否超出可推荐名额
		if (i > parseInt($("#recommandNum").val())) {
			alert("超出名额！");
			return;
		}
		$.ajax({
			type : "post",
			url : "groupsubmitUser",
			data : {
				"list" : list,
				id : $("#evalutionId").val()
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
	
$("#commitbutton3").click(function() {
		
		var list="";var i=0;
		$("input:checkbox[name=checkbox]:checked'").each(function() {
			list+= $(this).val() + "_";i++;
				//checks += $(this).val() + "|"; // 动态拼取选中的checkbox的值，用“|”符号分隔
			
		});
		//判断是否超出可推荐名额
		if (i>parseInt($("#recommandNum").val())) {
			alert("超出名额！");
			return;
		}
		$.ajax({
			type : "post",
			url : "finalsubmitUser",
			data : {
				"list" : list,
				id:$("#evalutionId").val()
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

$(".deletebutton").click(function() {
	//判断是否超出可推荐名额
	
	$.ajax({
		type : "post",
		url : "deleteUser",
		data : {
			id:$(this).attr("id")
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
			list+= $(this).val() + "_";
			
		});
		//获取当前网址，如： http://localhost:8080/Tmall/index.jsp
		var curWwwPath=window.document.location.href;
		 
		//获取主机地址之后的目录如：/Tmall/index.jsp
		 
		var pathName=window.document.location.pathname;
		 
		 
		var pos=curWwwPath.indexOf(pathName);
		//获取主机地址，如： http://localhost:8083
	    var localhostPaht=curWwwPath.substring(0,pos);
	    //获取带"/"的项目名，如：/uimcardprj
	    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	    var local=localhostPaht+projectName;
		var url=local+"/department/creatTable?list="+list;
		window.open(url,"newwindow","height=400, width=800, toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=no, status=no");

	});
	
	$("#querybutton").click(function(){		
		$("#load").load("query",{id : $("#evalutionId").val()});
		

	});

});
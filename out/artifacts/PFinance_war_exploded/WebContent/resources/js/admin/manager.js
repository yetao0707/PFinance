$(document).ready(function(){
	$(".updateuserbutton").click(function(){
		var string="#"+$(this).attr("id");
		
		$.ajax({
			type : "post",
			url : "editUser",
			data : {
				id : $(string+"id").val(),
				name : $(string+"name").val(),
				userCode : $(string+"userCode").val(),
				password : $(string+"password").val()
			},
			dataType : "json",
			success : function(data) {
				// alert(data.statusCode);

				if (data.code == "1") {
					alertMsg.correct("操作成功");

				} else {
					alertMsg.info("操作失败：" + data.message);
				}
			}
		});
	});
	$(".deleteuserbutton").click(function(){
		$.ajax({
			type : "post",
			url : "deleteUser",
			data : {
				id : $(this).attr("id")
			},
			dataType : "json",
			success : function(data) {
				// alert(data.statusCode);

				if (data.code == "1") {
					alertMsg.correct("操作成功");
					//top.location.reload();
					//navTab.reload(json.forwardUrl,{navTabId: json.navTabId});
					//navTab.reloadFlag("mainContainer"); 
				} else {
					alertMsg.info("操作失败：" + data.message);
				}
			}
		});
	});
	$(".updatedepartmentbutton").click(function(){
		var string="#"+$(this).attr("id");
		
		$.ajax({
			type : "post",
			url : "editDepartment",
			data : {
				id : $(string+"id").val(),
				name : $(string+"name").val(),
				userCode : $(string+"userCode").val(),
				password : $(string+"password").val()
			},
			dataType : "json",
			success : function(data) {
				// alert(data.statusCode);

				if (data.code == "1") {
					alertMsg.correct("操作成功");

				} else {
					alertMsg.info("操作失败：" + data.message);
				}
			}
		});
	});
	$(".deletedepartmentbutton").click(function(){
		$.ajax({
			type : "post",
			url : "deleteDepartment",
			data : {
				id : $(this).attr("id")
			},
			dataType : "json",
			success : function(data) {
				// alert(data.statusCode);

				if (data.code == "1") {
					alertMsg.correct("操作成功");
					//window.opener.location.reload();
				} else {
					alertMsg.info("操作失败：" + data.message);
				}
			}
		});
	});
	$(".updateevalutionerbutton").click(function(){
		var string="#"+$(this).attr("id");
		
		$.ajax({
			type : "post",
			url : "editEvalutioner",
			data : {
				id : $(string+"id").val(),
				name : $(string+"name").val(),
				userCode : $(string+"userCode").val(),
				password : $(string+"password").val()
			},
			dataType : "json",
			success : function(data) {
				// alert(data.statusCode);

				if (data.code == "1") {
					alertMsg.correct("操作成功");

				} else {
					alertMsg.info("操作失败：" + data.message);
				}
			}
		});
	});
	$(".deleteevalutionerbutton").click(function(){
		$.ajax({
			type : "post",
			url : "deleteEvalutioner",
			data : {
				id : $(this).attr("id")
			},
			dataType : "json",
			success : function(data) {
				// alert(data.statusCode);

				if (data.code == "1") {
					alertMsg.correct("操作成功");
					//window.opener.location.reload();
				} else {
					alertMsg.info("操作失败：" + data.message);
				}
			}
		});
	});
});
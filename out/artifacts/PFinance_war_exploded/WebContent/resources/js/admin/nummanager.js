$(document).ready(function() {

	$(".updatedepartmentbutton").click(function() {
		var string = "#" + $(this).attr("id");

		$.ajax({
			type : "post",
			url : "setNumOfDepartment",
			data : {
				id : $(string + "id").val(),
				name : $(string + "name").val(),
				recmmendnum : $(string + "recmmendnum").val()
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

	$(".updateteambutton").click(function() {
		var string = "#" + $(this).attr("id");
		
		$.ajax({
			type : "post",
			url : "setNumOfEvalutiooner",
			data : {
				id : $(string + "id").val(),
				name : $(string + "name").val(),
				recommendNum : $(string + "recommendnum").val()
			},
			dataType : "json",
			success : function(data) {
				// alertMsg.correct(data.statusCode);

				if (data.code == "1") {
					alertMsg.correct("操作成功");

				} else {
					alertMsg.info("操作失败：" + data.message);
				}
			}
		});
	});

	$(".deleteevalutionerbutton").click(function() {
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
					// window.opener.location.reload();
				} else {
					alertMsg.info("操作失败：" + data.message);
				}
			}
		});
	});
});
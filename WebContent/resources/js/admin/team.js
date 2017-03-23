$(document).ready(function() {
	var a = 3;
	$(".updateteambutton").click(function() {
		var string = "#" + $(this).attr("id");

		$.ajax({
			type : "post",
			url : "editTeam",
			data : {
				id : $(string + "id").val(),
				name : $(string + "name").val()
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
	$(".deleteteambutton").click(function() {
		$.ajax({
			type : "post",
			url : "deleteTeam",
			data : {
				id : $(this).attr("id")
			},
			dataType : "json",
			success : function(data) {
				// alertMsg.correct(data.statusCode);

				if (data.code == "1") {
					alertMsg.correct("操作成功");
					//window.opener.location.reload();
				} else {
					alertMsg.info("操作失败：" + data.message);
				}
			}
		});
	});
	$("#add").click(function() {
		$.ajax({
			type : "post",
			url : "editTeam",
			data : {
				id : $("#id").val(),
				name:$("#name").val()
			},
			dataType : "json",
			success : function(data) {
				// alertMsg.correct(data.statusCode);

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
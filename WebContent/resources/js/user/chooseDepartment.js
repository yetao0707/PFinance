$(document).ready(function() {
	// alert("aaa");
	// location.href="user/login";
	
	$("#submitbutton").click(function() {
		$.ajax({
			type : "post",
			url : "user/submit",
			data : {
				userid:$("#userid").val(),
				id:$("#select2").val()
			},
			dataType : "json",
			success : function(data) {
				// alert(data.statusCode);

				if (data.code == "1") {
					alert("提交成功");
					window.opener.location.reload(); 
					window.close();

				} else {
					alert(" 提交失败");
				}
			}
		});
	});
	// alert(2);

})
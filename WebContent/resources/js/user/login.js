$(document).ready(
		function() {
			// alert("aaa");
			// location.href="user/login";
			$("#submit").click(
					function() {
						switch ($("#select2").val()) {

						case "applicant":

							// alert(1);
							$.ajax({
								type : "post",
								url : "user/loginCheck",
								data : {
									userCode : $("#usercode").val(),
									password : $("#password").val()
								},
								dataType : "json",
								success : function(data) {
									
									if (data.code == "1") {
										location.href = "user/login?id="
												+ data.object.id;

									} else {
										alert("登陆失败：" + data.message);
									}
								}
							});
							break;
						case "recommandunit":
							$.ajax({
								type : "post",
								url : "department/login",
								data : {
									userCode : $("#usercode").val(),
									password : $("#password").val()
								},
								dataType : "json",
								success : function(data) {
									// alert(data.statusCode);

									if (data.code == "1") {
										location.href = "department/show?id="
												+ data.object.id;

									} else {
										alert("登陆失败：" + data.message);
									}
								}
							});

							break;
						case "expert":
							// location.href = "evalutioner/login?userCode="
							// + $("#usercode").val() + "&password="
							// + $("#password").val();

							$.ajax({
								type : "post",
								url : "evalutioner/loginCheck",
								data : {
									userCode : $("#usercode").val(),
									password : $("#password").val()
								},
								dataType : "json",
								success : function(data) {
									
									if (data.code == "1") {
										location.href = "evalutioner/login?id="
												+ data.object.id;

									} else {
										alert("登陆失败：" + data.message);
									}
								}
							});

							break;
						case "admin":
							$.ajax({
								type : "post",
								url : "admin/login",
								data : {
									userCode : $("#usercode").val(),
									password : $("#password").val()
								},
								dataType : "json",
								success : function(data) {
									// alert(data.statusCode);

									if (data.code == "1") {
										location.href = "admin/adminshow";

									} else {
										alert("登陆失败：" + data.message);
									}
								}
							});
							break;

						default:
							break;
						}

					});
			// alert(2);

		})
/**
 * 
 */
$(document)
		.ready(
				function() {
					if ($("#issubmit").val() == "1") {
						$("input").attr("disabled", "disabled");
						$("button").attr("disabled", "disabled");
					}
					$("#sciencebutton").click(function() {

						$.ajax({
							type : "post",
							url : "saveSciences",
							data : $("#scienceform").serialize(),
							dataType : "json",
							success : function(data) {
								// alert(data.statusCode);

								if (data.code == "1") {
									alert("保存成功");

								} else {
									alert("保存失败");
								}
							}
						});

					});
					$("#upload").click(function() {
						window.open("upload","newwindow","height=400, width=800, toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=no, status=no");
						
					});
					$("#userbutton").click(function() {
						// alert($("#userform").serialize());
						// alert($("#id").val());
						//alert($("#userform").serialize());
						$.ajax({
							type : "post",
							url : "saveUser",
							data : $("#userform").serialize(),
							dataType : "json",
							success : function(data) {
								alert(data);

								if (data.code == "1") {
									alert("操作成功");

								} else {
									alert("保存失败");
								}
							}
						});
					});
					$("#articlebutton").click(function() {
						$.ajax({
							type : "post",
							url : "saveArticle",
							data : $("#articleform").serialize(),
							dataType : "json",
							success : function(data) {
								// alert(data.statusCode);

								if (data.code == "1") {
									alert("保存成功");

								} else {
									alert("保存失败");
								}
							}
						});
					});
					$("#fundbutton").click(function() {
						$.ajax({
							type : "post",
							url : "saveFunds",
							data : $("#fundform").serialize(),
							dataType : "json",
							success : function(data) {
								// alert(data.statusCode);

								if (data.code == "1") {
									alert("保存成功");

								} else {
									alert("保存失败");
								}
							}
						});
					});
					$("#projectbutton").click(function() {
						$.ajax({
							type : "post",
							url : "saveProjects",
							data : $("#projectform").serialize(),
							dataType : "json",
							success : function(data) {
								// alert(data.statusCode);

								if (data.code == "1") {
									alert("保存成功");

								} else {
									alert("保存失败");
								}
							}
						});
					});
					$("#outputbutton").click(function() {
						$.ajax({
							type : "post",
							url : "saveOutput",
							data : $("#outputform").serialize(),
							dataType : "json",
							success : function(data) {
								// alert(data.statusCode);

								if (data.code == "1") {
									alert("保存成功");

								} else {
									alert("保存失败");
								}
							}
						});
					});
					$("#resumebutton").click(function() {
						$.ajax({
							type : "post",
							url : "saveResume",
							data : $("#resumeform").serialize(),
							dataType : "json",
							success : function(data) {
								// alert(data.statusCode);

								if (data.code == "1") {
									//alert("保存成功");
									alert("操作成功");

								} else {
									alert("保存失败");
								}
							}
						});
					});
					$("#submitbutton")
							.click(
									function() {
										var url = "choseDeprtment?userid="
												+ $("#userid").val();
										window
												.open(
														url,
														"newwindow",
														"height=400, width=800, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");
									});

				});
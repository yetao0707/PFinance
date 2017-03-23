/**
 * 
 */
$(document).ready(function(){
	$("#registerbutton").click(function(){
		if ($("#password").val()!=$("#password1").val()) {
			alert("两次密码输入不一致");
			return;
		}
		$.ajax({
			type : "post",
			url : "register",
			data : $("form").serialize(),
			dataType : "json",
			success : function(data) {
				//alert(data.statusCode);

				if (data.code=="1") {
					alert("注册成功");
					 var curWwwPath=window.document.location.href;
					    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
					    var pathName=window.document.location.pathname;
					    var pos=curWwwPath.indexOf(pathName);
					    //获取主机地址，如： http://localhost:8083
					    var localhostPaht=curWwwPath.substring(0,pos);
					    //获取带"/"的项目名，如：/uimcardprj
					    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
					location.href=localhostPaht+projectName;
				}else {
					alert(data.message);
				}
			}
		});
	})
	
})
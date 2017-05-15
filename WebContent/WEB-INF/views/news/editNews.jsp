<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script>
	$(function () {
		var resourceFile = {};

		$("#uploadFile").on("change", function (e) {
			console.log(e);
			var file = e.currentTarget.files[0];
			if(!file) {
				return;
			}

			var reader = new FileReader();
			reader.onload = function(evt) {
				resourceFile.base64 = evt.target.result;
				resourceFile.size = file.size;
				resourceFile.filename = file.name;

			}
			reader.readAsDataURL(file);


		});
		$("#newsSubmit").on("click",function () {
			$.ajax({
				type: "POST",
				url: $("#basePath").val()+"news/save",
				data: {
					id: $("#id").val(),
					content: $("#content").val(),
					img: resourceFile.base64,
					title: $("#title").val()
				},
				dataType: "json",
				success: function (result) {
					if (result.statusCode == 200) {
						alert("修改成功");
						$.pdialog.closeCurrent();
						navTabPageBreak();
					} else {
						alert(result.errMsg);
					}
				}
			});
		})
	})
</script>
<div class="pageContent">
	
	<form method="post" action="<%=basePath%>news/save" class="pageForm required-validate"  enctype="multipart/form-data" >
		<div class="pageFormContent" layoutH="58">
            <input type="hidden" id="id" value="${dto.id}"/>
		
			<div class="unit">
				<label>编辑标题：</label>
				<textarea id="title" cols="30" rows="3" value="${dto.title}">${dto.title}</textarea>
			</div>

			<div class="unit">
				<label>编辑内容：</label>
				<textarea id="content" cols="100" rows="10" value="${dto.content}">${dto.content}</textarea>
			</div>

			<div class="unit">
				<label>上传图片：</label>
				<input type="file" name="file" id="uploadFile"/>
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button id="newsSubmit" type="button">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>

	</form>
	<input type="text" value="<%=basePath%>" hidden="hidden" id="basePath">
</div>


<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="pageContent">
	
	<form method="post" action="<%=basePath%>news/save" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
            <input type="hidden" name="id" value="${dto.id}"/>
		
			<div class="unit">
				<label>编辑标题：</label>
				<textarea name="title" cols="30" rows="100" value="${dto.title}"></textarea>
			</div>
		</div>div class="pageFormContent" layoutH="58">
            <input type="hidden" name="id" value="${dto.id}"/>

			<div class="unit">
				<label>编辑内容：</label>
				<textarea name="content" cols="100" rows="100" value="${dto.content}"></textarea>
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>


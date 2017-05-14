<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="pageContent">
	
	<form method="post" action="<%=basePath%>customerComment/save" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
            <input type="hidden" name="id" value="${dto.id}"/>
		
			<div class="unit">
				<label>标题：</label>
				<input type="text"  value="${dto.title}" size="30" maxlength="50" disabled="disabled"/>
			</div>

			<div class="unit">
				<label>内容：</label>
				<textarea type="text" value="${dto.commentText}" rows="23"   disabled="disabled">${dto.commentText}</textarea>
			</div>
			<div class="unit">
				<label>标签：</label>
				<c:forEach items="${dto.tagList}" var="pojo">
					<label>${pojo}  </label>
				</c:forEach>
			</div>
			<div class="unit">
				<label>回复：</label>
				<textarea class="form-control" name="replyText" rows="23">${dto.replyText}</textarea>
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


<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="pageContent">
	
	<form method="post" action="<%=basePath%>customer/save" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
            <input type="hidden" name="id" value="${dto.id}"/>
			<td>${pojo.id}</td>
			<td>${pojo.userName}</td>
			<td>${pojo.password}</td>
			<td>${pojo.sex}</td>
			<td>${pojo.age}</td>
			<td>${pojo.phoneNum}</td>
			<td>${pojo.email}</td>
			<td>${pojo.adderss}</td>
			<td>${pojo.idNum}</td>
			<td>${pojo.evaluateResult}</td>
			<div class="unit">
				<label>用户名：</label>
				<input type="text" name="userName" value="${dto.userName}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>密码：</label>
				<input type="text" name="password" value="${dto.password}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>性别：</label>
				<select class="combox" name="sex">
				<option <c:if test='${dto.sex=="男"}'>selected="selected"</c:if> value="男">男</option>
				<option <c:if test='${dto.sex=="女"}'>selected="selected"</c:if> value="女">女</option>
				</select>
			</div>
			<div class="unit">
				<label>年龄：</label>
				<input type="number" name="age" value="${dto.age}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>手机号码：</label>
				<input type="text" name="phoneNum" value="${dto.phoneNum}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>email：</label>
				<input type="text" name="email" value="${dto.email}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>地址：</label>
				<input type="text" name="adderss" value="${dto.adderss}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>身份证号码：</label>
				<input type="text" name="idNum" value="${dto.idNum}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>评估结果：</label>
				<input type="text" name="evaluateResult" value="${dto.evaluateResult}" size="30" maxlength="20" class="required" />
			</div>
			<%--<div class="unit">--%>
				<%--<label>是否是管理员：</label>--%>
			    <%--<select class="combox" name="adminInd">  --%>
			      <%--<option <c:if test='${dto.adminInd=="N"}'>selected="selected"</c:if> value="N">否</option>--%>
			      <%--<option <c:if test='${dto.adminInd=="Y"}'>selected="selected"</c:if> value="Y">是</option>  --%>
			    <%--</select>--%>
			    <%----%>
			<%--</div>--%>
			<%--<div class="unit">--%>
				<%--<label>staff-id：</label>--%>
				<%--<input type="text" name="staffId" value="${dto.staffId}" size="30" class="required"/>--%>
			<%--</div>--%>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>


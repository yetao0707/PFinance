<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="<%=basePath%>resources/js/jquery-1.7.2.js"
	type="text/javascript"></script>
<script src="<%=basePath%>resources/js/jquery-1.7.2.min.js"
	type="text/javascript"></script>
<script src="<%=basePath%>resources/js/user/chooseDepartment.js"
	type="text/javascript"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body class="signin" style="background-color: white;">


	<div class="signinpanel" align="center">



		<h3 class="nomargin">辽宁省优秀科技工作者评选系统</h3>
		<br> <br> <input name="id" id="userid" value="${userid }"
			hidden="true">
		<div class="form-group">
			<label class="col-sm-3 control-label">所属单位</label>
			<div class="col-sm-6">
				<select id="select2" data-placeholder="选择一个种类...">
					<c:forEach items="${list}" var="department" varStatus="status">
						<option value="${department.id }">${department.name}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<br> <br> <br> <br>

		<button id="submitbutton">提交</button>
		<br> <br> <br> <br>





	</div>
	<!-- row -->

	<div class="signup-footer" align="center">
		<div class="pull-left">&copy; 2015. 辽宁省优秀科技工作者评选系统</div>

	</div>


	<input id="basePath" value="<%=basePath%>" hidden="true">

</body>
</html>

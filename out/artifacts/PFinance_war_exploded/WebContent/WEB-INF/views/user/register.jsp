<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'index.jsp' starting page</title>
<%@ include file="../HtmlContext.jsp"%>
<script src="<%=basePath%>resources/js/user/register.js"
	type="text/javascript"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body class="signin" style="background:#438eb9">
<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>
	<div align="center" style="top: 40%;">
		<form name="register">
			<input type="text" name="userCode" id="userode" class="form-control uname"
				placeholder="用户名" /><br> <br> <br> <input name="password"
				type="password" id="password" class="form-control pword"
				placeholder="密码" /><br> <br> <br>
				<input
				type="password" name="password1" id="password1" class="form-control pword"
				placeholder="请再输入密码" /><br> <br> <br>
		</form>
	</div>
	<div align="center">
		<button id="registerbutton">注册</button>
	</div>
	<!-- row -->
<br><br><br><br><br>
	<div class="signup-footer" align="center">
		<div class="pull-left">&copy; 2015. 辽宁省优秀科技工作者评选系统</div>

	</div>


	<input id="basePath" value="<%=basePath%>" hidden="true">

</body>
</html>

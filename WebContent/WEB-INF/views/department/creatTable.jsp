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
<script type="text/javascript">
$(document).ready(function(){
	$("button").click(function(){
		location.href="department/exportWord";
	});
});
</script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body class="signin" style="background-color: white;">


	<div align="center">
		<table class="list" width="100%" rel="jbsxBox">
			<thead align="center">
				<tr>
					<td width="6%">排名</td>
					<td width="6%">姓名</td>
					<td width="6%">性别</td>
					<td width="6%">学科类别</td>
					<td width="6%">工作单位</td>
					<td width="6%">推荐单位</td>
					<td width="6%">民族</td>
					<td width="6%">出生日期</td>
					<td width="6%">专业技术职务</td>
					<td width="6%">行政职务</td>
					<td width="6%">手机号码</td>
					<td width="6%">单位电话</td>
					<td width="6%">单位地址及邮编</td>
					<td width="6%">E-mail</td>
					<td width="6%">身份证号</td>
					<td width="6%">属地</td>
				</tr>
			</thead>
			<tbody align="left">
				<c:forEach items="${list}" var="user" varStatus="status">
					<tr>
						<td><input value="${status.getCount()}"></td>
						<td><input value="${user.name}"></td>
						<td><input value="${user.sex}"></td>
						<td><input value="${user.subject}"></td>
						<td><input value="${user.workSpace}"></td>
						<td><input value="${user.department.name}"></td>
						<td><input value="${user.nation}"></td>
						<td><input value="${user.birthday}"></td>
						<td><input value="${user.skillPosition}"></td>
						<td><input value="${user.adminPosition}"></td>
						<td><input value="${user.phoneNumber}"></td>
						<td><input value="${user.depNum}"></td>
						<td><input value="${user.depAddress}"></td>
						<td><input value="${user.email}"></td>
						<td><input value="${user.idNum}"></td>
						<td><input value="${user.birthplace}"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div align="center">
		<button>保存并打印</button>
	</div>
	<!-- row -->

	<div class="signup-footer" align="center">
		<div class="pull-left">&copy; 2015. 辽宁省优秀科技工作者评选系统</div>

	</div>


	<input id="basePath" value="<%=basePath%>" hidden="true">

</body>
</html>

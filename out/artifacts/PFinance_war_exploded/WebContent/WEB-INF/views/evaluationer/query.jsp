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
<script src="<%=basePath%>resources/js/evalutioner/evalutioner.js"
	type="text/javascript"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body class="signin" style="background-color: white;">


	<div align="center">
		

		<table width="690" height="70" border="1">
			<tr>
				<td width="40" height="31" align="center">全选</td>
				<td width="29" align="center">序号</td>
				<td width="76" align="center">姓名</td>
				<td width="35" align="center">性别</td>
				<td width="225" align="center">工作单位</td>
				<td width="121" align="center">学科类别</td>
				<td width="121" align="center">得票数</td>
			</tr>
			<c:forEach items="${vo.users }" var="user" varStatus="status">
				<tr>
					<td height="31"><input type="checkbox" name="checkbox"
						value="${user.id }" style=" width:20px; height:auto" /></td>
					<td><input value="${status.getCount() }"></td>
					<td><input value="${user.name }"></td>
					<td><input value="${user.sex }"></td>
					<td><input value="${user.workSpace}"></td>
					<td><input value="${user.team}"></td>
					<td><input value="${user.voteNum}"></td>
					
				</tr>
			</c:forEach>
		</table>


		</h3>
		<input value="${vo.isOver }" id="isOver" hidden="true"> <input
			value="${vo.team.recommendNum }" id="recommandNum" hidden="true"> <input
			value="${vo.id }" id="departmentId" hidden="true"> <label></label>
		

	</div>
	<div id="load"></div>
	<iframe src="#" style="width: 100%;height: 80%;" hidden="true"></iframe>


	<input id="basePath" value="<%=basePath%>" hidden="true">

</body>
</html>

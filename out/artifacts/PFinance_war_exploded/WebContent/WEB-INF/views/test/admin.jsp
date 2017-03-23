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
<script src="<%=basePath%>resources/js/jquery.mobile-1.3.0.js"
	type="text/javascript"></script>
<script src="<%=basePath%>resources/js/admin/admin.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>resources/css/jquery.mobile-1.3.0.css">

</head>

<body>


	<div align="left">

		<div data-role="content">
			<div data-role="collapsible">
				<h4>系统管理</h4>
				<ul data-role="listview">
					<li><a href="#" id="system">系统管理</a></li>
				</ul>
			</div>

			<div data-role="collapsible">
				<h4>用户信息管理</h4>
				<ul data-role="listview">
					<li><a href="#" id="departmentManager">推荐单位</a></li>
					<li><a href="#" id="evalutionerManager">评审专家</a></li>
					<li><a href="#" id="userManager">申报者</a></li>
				</ul>
			</div>

			<div data-role="collapsible">
				<h4>学科管理</h4>
				<ul data-role="listview">
					<li><a href="#" id="team">学科管理</a></li>
				</ul>

			</div>
			<div data-role="collapsible">
				<h4>候选人管理</h4>
				<ul data-role="listview">
					<li><a href="#">候选人学科管理</a></li>
					<li><a href="#">候选人初评结果管理</a></li>
					<li><a href="#">候选人终评结果管理</a></li>
				</ul>

			</div>
			<div data-role="collapsible">
				<h4>名额分配管理</h4>
				<ul data-role="listview">
					<li><a href="#" id="departmentNum">推荐单位提交名额管理</a></li>
					<li><a href="#" id="evalutionerNum">评选名额管理</a></li>
				</ul>

			</div>
			<div data-role="collapsible">
				<h4>投票管理</h4>
				<ul data-role="listview">
					<li><a href="#" id="vote1">专家组投票管理</a></li>
					<li><a href="#" id="vote2">评审委员会投票管理</a></li>
				</ul>
			</div>
			<div data-role="collapsible">
				<h4>推荐单位管理</h4>
				<ul data-role="listview">
					<li><a href="#">市科协</a></li>
					<li><a href="#">理科学会</a></li>
					<li><a href="#">工科学会</a></li>
					<li><a href="#">农林学会</a></li>
					<li><a href="#">医药学会</a></li>
					<li><a href="#">交叉学科学会</a></li>
				</ul>
			</div>
		</div>

		<div class="pull-left">&copy; 2015. 辽宁省优秀科技工作者评选系统</div>
	</div>




</body>
</html>

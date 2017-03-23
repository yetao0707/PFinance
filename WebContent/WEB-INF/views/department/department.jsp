<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="shortcut icon" href="../themes/default/images/favicon.png" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="cache-control" content="no-cache" />
<title>辽宁科技评选</title>
<!-- 系统加载的css js文件统一写到HtmlContext.jsp中进行管理 -->
<%@ include file="../HtmlContext.jsp"%>
<style type="text/css">
#header .logo {
	background: url(../resources-diy/images/logo/logo.png) no-repeat;
	margin-top: 5px;
}

#header .logo {
	float: left;
	width: 376px;
	height: 42px;
	text-indent: -1000px;
}

.fs {
	margin-top: 10px;
}
</style>
<script src="<%=basePath%>resources/js/department/department.js"
	type="text/javascript"></script>
</head>

<body scroll="no">
	<div id="layout">
		<div id="header" style="background:#438eb9">
			<div class="headerNav">
				<a class="logo" href="#">标志</a>
				<ul class="nav fs">
					<li><a id="usersHomePage" title="我的主页"
						href="<%=basePath%>loginmgr/getUsersHomePage?time=" + new
						Date().getTime() target="navTab" rel="main"
						style="color: #fff;line-height:13px;">欢迎：${userSession.name}</a></li>
					<li><a href="<%=basePath%>loginmgr/changePWDInit"
						target="dialog" rel="repassword" title="变更密码" mask="true"
						style="color: #fff;line-height:13px;">变更密码</a></li>
					<c:if test="${empty verCode}">
						<li><a href="<%=basePath%>"
							style="color: #fff;line-height:13px;">退出系统</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<br/><br/><br/>
		<div  align="center">


			<table width="690" height="90%" border="0">
				<thead align="center">
					<tr>
						<td width="40" height="31" align="center">全选</td>
						<td width="29" align="center">序号</td>
						<td width="76" align="center">姓名</td>
						<td width="35" align="center">性别</td>
						<td width="225" align="center">工作单位</td>
						<td width="121" align="center">学科类别</td>
						<td width="118" align="center">操作</td>
					</tr>
				</thead>
				<tbody align="left">
					<c:forEach items="${vo.applyUsers }" var="user" varStatus="status">
						<tr>
							<td height="31"><input type="checkbox" name="checkbox"
								value="${user.id }" style=" width:20px; height:auto" /></td>
							<td><input value="${status.getCount() }"></td>
							<td><input value="${user.name }"></td>
							<td><input value="${user.sex }"></td>
							<td><input value="${user.workSpace}"></td>
							<td><input value="${user.subject}"></td>
							<td align="center"><input type="button" name="commit"
								value="详情" class="detailHref" id="${user.id }"><input
									type="button" name="commit" value="退回" class="backHref"
									id="${user.id }">
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<h3 align="center">
				注意,您可提交<label id="number">${vo.recmmendnum }</label>名候选人
			</h3>
			<input value="${vo.isOver }" id="isOver" hidden="true"> <input
				value="${vo.recmmendnum }" id="recmmendnum" hidden="true"> <input
					value="${vo.id }" id="departmentId" hidden="true"> <label></label>
						<div align="center" style=" width:690px; height:auto ">
							<input type="button" name="form" id="creatbutton"
								style="width:100px; height:30px; border:3px solid; margin-right:100px; border-color:#dddddd"
								value="生成汇总表" align="left" /> <input type="button"
								name="commit" id="commitbutton" value="提交"
								style="width:100px ; height:30px; border:3px solid;border-color:#dddddd" />
						</div>
		</div>
		<div id="load"></div>
		<iframe src="#" style="width: 100%;height: 80%;" hidden="true"></iframe>

	</div>

</body>
</html>
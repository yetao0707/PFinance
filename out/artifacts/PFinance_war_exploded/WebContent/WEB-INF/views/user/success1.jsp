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

		<div>
			<iframe src="<%=basePath%>docx/test.html" scrolling="yes"
				frameborder="0" width="100%" height="450px"></iframe>
		</div>
		<div align="center">
			<a href="docx/test.docx">下载文档</a> <a href="#" id="print">打印</a> <a
				href="<%=basePath%>user/userShow?id=${vo.id}">下一步</a>
		</div>
</body>
</html>
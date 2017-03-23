<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="shortcut icon" href="../themes/default/images/favicon.png"/>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="cache-control" content="no-cache" />
<title>辽宁科技评选</title>
<!-- 系统加载的css js文件统一写到HtmlContext.jsp中进行管理 -->
<%@ include file="../HtmlContext.jsp"%>
<style type="text/css">
#header .logo { 
		background:url(../resources-diy/images/logo/logo.png) no-repeat;
		margin-top:5px;
}
#header .logo { 
		float:left; width:376px; height:42px; text-indent:-1000px;
}
.fs{
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
				<!--  
					<li><a id="usersHomePage" title="我的主页"
						href="<%=basePath%>loginmgr/getUsersHomePage?time=" + new
						Date().getTime() target="navTab" rel="main" style="color: #fff;line-height:13px;">欢迎：${userSession.name}</a>
					</li>
					<li><a href="<%=basePath%>loginmgr/changePWDInit"
						target="dialog" rel="repassword" title="变更密码" mask="true" style="color: #fff;line-height:13px;">变更密码</a>
					</li>
					<c:if test="${empty verCode}">
						<li><a href="<%=basePath%>" style="color: #fff;line-height:13px;">退出系统</a></li>
					</c:if>-->
				</ul>
			</div>
		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse">
						<div></div>
					</div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse">
					<h2>主菜单</h2>
					<div>收缩</div>
				</div>
				<div class="accordion" fillSpace="sidebar">

					<div class="accordionHeader">
			<h2>
				<span>Folder</span>系统管理
			</h2>
		</div>
		<div class="accordionContent">
			<ul class="tree treeFolder">
				<li><a href="getSystemPage" target="navTab">系统管理</a></li>
			</ul>
		</div>
		<div class="accordionHeader">
			<h2>
				<span>Folder</span>用户信息管理
			</h2>
		</div>
		<div class="accordionContent">
			<ul class="tree treeFolder">
				<li><a href="departmentManager" target="navTab">推荐单位</a></li>
				<li><a href="evalutionerManager" target="navTab">评审专家</a></li>
				<li><a href="userManager"  target="navTab">申报者</a></li>
			</ul>
		</div>
		<div class="accordionHeader">
			<h2>
				<span>Folder</span>学科管理
			</h2>
		</div>
		<div class="accordionContent">
			<ul class="tree treeFolder">
				<li><a href="getTeam" target="navTab">学科管理</a></li>
			</ul>
		</div>
		<div class="accordionHeader">
			<h2>
				<span>Folder</span>候选人管理
			</h2>
		</div>
		<div class="accordionContent">
			<ul class="tree treeFolder">
				<li><a href="userGroup" target="navTab">候选人学科管理</a></li>
				<li><a href="firstManager?firstResult=1" target="navTab">候选人初评结果管理</a></li>
				<li><a href="finalManager?finalResult=1" target="navTab">候选人终评结果管理</a></li>
			</ul>
		</div>
		<div class="accordionHeader">
			<h2>
				<span>Folder</span>名额分配管理
			</h2>
		</div>
		<div class="accordionContent">
			<ul class="tree treeFolder">
				<li><a href="departmentNum" target="navTab">推荐单位提交名额管理</a></li>
				<li><a href="evalutionerNum" target="navTab">评选名额管理</a></li>
			</ul>
		</div>
		<div class="accordionHeader">
			<h2>
				<span>Folder</span>投票管理
			</h2>
		</div>
		<div class="accordionContent">
			<ul class="tree treeFolder">
				<li><a href="voteManager" target="navTab">专家组投票管理</a></li>
				<li><a href="getFinalUser" target="navTab">评审委员会投票管理</a></li>
			</ul>
		</div>
		<div class="accordionHeader" >
			<h2>
				<span >Folder</span>推荐单位管理<a href="getUserOfOneDepartment?subject=理科学会" target="navTab">.</a>
			</h2>
		</div>
		<div class="accordionContent">
			<ul class="tree treeFolder">
				<li><a href="getUserOfOneDepartment?subject=市科协">市科协</a></li>
					<li><a href="getUserOfOneDepartment?subject=理科类学会" target="navTab">理科学会</a></li>
					<li><a href="getUserOfOneDepartment?subject=工科类学会" target="navTab">工科学会</a></li>
					<li><a href="getUserOfOneDepartment?subject=农林类学会" target="navTab">农林学会</a></li>
					<li><a href="getUserOfOneDepartment?subject=医药类学会" target="navTab">医药学会</a></li>
					<li><a href="getUserOfOneDepartment?subject=交叉学科学会" target="navTab">交叉学科学会</a></li>
			</ul>
		</div>

				</div>
			</div>
		</div>
		<div id="container">
					<div id="navTab" class="tabsPage">
						<div class="tabsPageHeader">
							<div class="tabsPageHeaderContent">
								<!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
								<ul class="navTab-tab">
									<li tabid="main" class="main">
										<a href="javascript:reloadMainPage();">
											 <span>
												<span class="home_icon">
													我的主页
												</span>
											</span> 
										</a>
									</li>
								</ul>
							</div>
							<div class="tabsLeft">left</div>
							<!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
							<div class="tabsRight">right</div>
							<!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
							<!-- <div class="tabsMore">more</div> -->
						</div>
						<ul class="tabsMoreList">
							<li><a href="javascript:;">我的主页</a></li>
						</ul>
						<div class="navTab-panel tabsPageContent layoutBox" style="background:#f0f7f9">
							<div class="page unitBox">
								<!-- <div class="accountInfo">
									<div class="alertInfo">
										<h2>
											<input type="hidden" />
										</h2>
									</div>
									<img src = "images/Simple_atmospheric_connotation.jpg"/>
								</div> -->
								<div style="background:#f0f7f9 " layoutH="0">
									<h2 class="contentTitle">
										&nbsp; ${userSession.name} &nbsp;&nbsp;上次登录时间:&nbsp;
										<fmt:formatDate value='${userSession.modifyTime }' pattern='yyyy-MM-dd HH:mm:ss' />
										&nbsp;&nbsp;上次登录IP:&nbsp;${userSession.lastIp}
									</h2>
									<!-- <fieldset>
										<legend>
											业务提醒
										</legend>
									</fieldset> -->
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
			
			<div id="footer">Copyright &copy;辽宁省优秀科技工作者评选服务平台 </div>
			<%-- <div id="refreshDiv" class="tooltiptext">
				<div>
				系统检测到您还有待办任务！请点击<a href="<%=basePath%>loginmgr/getUsersHomePage?time="+ new Date().getTime() target="navTab" rel="main" style="color: red;" title="我的主页">刷新</a>！
				</div>
			</div> --%>	
			
			<script type="text/javascript">
			
			var dwzContext = '<%=basePath%>resources/js/dwz/dwz.frag.xml';
				$(function() {
					DWZ.init(dwzContext, {
						loginUrl : "login_dialog.html",
						loginTitle : "登录", // 弹出登录对话框
						//		loginUrl:"login.html",	// 跳到登录页面
						statusCode : {
							ok : 200,
							error : 300,
							timeout : 301
						}, //【可选】
						pageInfo : {
							pageNum : "pageNum",
							numPerPage : "numPerPage",
							orderField : "orderField",
							orderDirection : "orderDirection"
						}, //【可选】
						debug : false, // 调试模式 【true|false】
						callback : function() {
							initEnv();
							$("#themeList").theme({
								themeBase : "themes"
							}); // themeBase 相对于index页面的主题base路径
						}
					});
			
				});
			
				document.oncontextmenu = function(e) {
					return false;
				};
			</script>
			<script language="JavaScript">
				$(document).ready(function() {
					//监听点击回车
					$(this).keydown(function(event) {
						if (event.keyCode == DWZ.keyCode.ENTER)
							return false; //屏蔽回车提交
					});
				});
			</script>
			<script language="JavaScript">
			<!--
				javascript: window.history.forward(1);
			//-->
			</script>
			<script language="JavaScript">
			$(document).ready(function(){
				$("#test").click(function(){
					("#test1").click();
				});
			});
			</script>
		
	</body>
</html>
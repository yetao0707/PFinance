<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>My JSP 'MyJsp.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
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
				<li><a href="userManager" target="navTab">推荐单位</a></li>
				<li><a href="departmentManager" target="navTab">评审专家</a></li>
				<li><a href="evalutionerManager" target="navTab">申报者</a></li>
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
				<li><a href="departmentNum" target="navTab">候选人学科管理</a></li>
				<li><a href="voteManager" target="navTab">候选人初评结果管理</a></li>
				<li><a href="getFinalUser" target="navTab">候选人终评结果管理</a></li>
			</ul>
		</div>

	</div>

	<div class="pageContent" layoutH="0">

		<div class="accordion" style="width:300px;float:left;margin:5px;">
			<div class="accordionHeader">
				<h2>
					<span>Folder</span>界面组件
				</h2>
			</div>
			<div class="accordionContent">
				<ul class="tree treeFolder">
					<li><a href="tabsPage.html" target="navTab">框架面板</a>
						<ul>
							<li><a href="main.html" target="navTab" rel="main">我的主页</a></li>
							<li><a href="demo_page1.html" target="navTab" rel="page1">页面一</a></li>
							<li><a href="demo_page1.html" target="navTab" rel="page1">替换页面一</a></li>
							<li><a href="demo_page2.html" target="navTab" rel="page2">页面二</a></li>
							<li><a href="demo_page4.html" target="navTab" rel="page3"
								title="页面三（自定义标签名）">页面三</a></li>
						</ul></li>

					<li><a href="w_panel.html" target="navTab" rel="w_panel">面板</a></li>
					<li><a href="w_tabs.html" target="navTab" rel="w_tabs">选项卡面板</a></li>
					<li><a href="w_dialog.html" target="navTab" rel="w_dialog">弹出窗口</a></li>
					<li><a href="w_alert.html" target="navTab" rel="w_alert">提示窗口</a></li>
					<li><a href="w_list.html" target="navTab" rel="w_list">CSS表格容器</a></li>
					<li><a href="demo_page1.html" target="navTab" rel="w_table">表格容器</a></li>
					<li><a href="w_tree.html" target="navTab" rel="w_tree">树形菜单</a></li>
					<li><a href="w_editor.html" target="navTab" rel="w_editor">编辑器</a></li>
					<li><a href="w_validation.html" target="navTab"
						rel="w_validation">表单组件</a>
						<ul>
							<li><a href="w_validation.html" target="navTab"
								rel="w_validation">表单验证</a></li>
							<li><a href="w_datepicker.html" target="navTab"
								rel="w_datepicker">日期控件</a></li>
							<li><a href="w_button.html" target="navTab" rel="w_button">按钮</a></li>
							<li><a href="w_textInput.html" target="navTab"
								rel="w_textInput">文本框/文本域</a></li>
							<li><a href="w_combox.html" target="navTab" rel="w_combox">下拉菜单</a></li>
							<li><a href="w_checkbox.html" target="navTab"
								rel="w_checkbox">多选框/单选框</a></li>
						</ul></li>
				</ul>
			</div>
			<div class="accordionHeader">
				<h2>
					<span>Folder</span>典型页面
				</h2>
			</div>
			<div class="accordionContent">
				<ul class="tree treeFolder treeCheck">
					<li><a href="demo_upload.html" tname="name" tvalue="roger"
						target="navTab" rel="demo_upload">文件上传表单提交示例</a></li>
					<li><a href="demo_page1.html" tname="name" tvalue="roger"
						target="navTab" rel="demo_page1">查询我的客户</a></li>
					<li><a href="demo_page1.html" tname="name" tvalue="roger"
						target="navTab" rel="demo_page2">表单查询页面</a></li>
					<li><a href="demo_page4.html" tname="name" tvalue="roger"
						target="navTab" rel="demo_page4">表单录入页面</a></li>
					<li><a href="demo_page5.html" tname="name" tvalue="roger"
						target="navTab" rel="demo_page5">有文本输入的表单</a></li>
					<li><a href="#" tname="name" tvalue="roger">有提示的表单输入页面</a>
						<ul>
							<li><a href="#" tname="name" tvalue="roger">页面一</a></li>
							<li><a href="#" tname="name" tvalue="roger">页面二</a></li>
						</ul></li>
					<li><a href="#" tname="name" tvalue="roger">选项卡和图形的页面</a>
						<ul>
							<li><a href="#" tname="name" tvalue="roger">页面一</a></li>
							<li><a href="#" tname="name" tvalue="roger">页面二</a></li>
						</ul></li>
					<li><a href="#" tname="name" tvalue="roger">选项卡和图形切换的页面</a></li>
					<li><a href="#" tname="name" tvalue="roger">左右两个互动的页面</a></li>
					<li><a href="#" tname="name" tvalue="roger">列表输入的页面</a></li>
					<li><a href="#" tname="name" tvalue="roger">双层栏目列表的页面</a></li>
				</ul>
			</div>
			<div class="accordionHeader">
				<h2>
					<span>Folder</span>流程演示
				</h2>
			</div>
			<div class="accordionContent">
				<ul class="tree">
					<li><a href="newPage1.html" target="dialog" rel="dlg_page">列表</a></li>
					<li><a href="newPage1.html" target="dialog" rel="dlg_page">列表</a></li>
					<li><a href="newPage1.html" target="dialog" rel="dlg_page2">列表</a></li>
					<li><a href="newPage1.html" target="dialog" rel="dlg_page2">列表</a></li>
				</ul>
			</div>
		</div>


		<div class="accordion" style="width:300px;float:left;margin:5px;">
			<div class="accordionHeader">
				<h2>
					<span>icon</span>面板1
				</h2>
			</div>
			<div class="accordionContent" style="height:200px">内容1</div>
			<div class="accordionHeader">
				<h2>
					<span>icon</span>面板2
				</h2>
			</div>
			<div class="accordionContent">内容2</div>
			<div class="accordionHeader">
				<h2>
					<span>icon</span>面板3
				</h2>
			</div>
			<div class="accordionContent">内容3</div>
		</div>


	</div>


</body>
</html>

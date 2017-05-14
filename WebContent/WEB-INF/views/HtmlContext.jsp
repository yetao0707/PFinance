<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="<%=basePath%>resources/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="<%=basePath%>resources/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="<%=basePath%>resources/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="<%=basePath%>resources/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
<link rel="stylesheet"
	href="<%=basePath%>resources/css/diy/buttons/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=basePath%>resources/css/diy/buttons/css/buttons.css">
<link type="text/css" rel="stylesheet" href="<%=basePath%>resources/js/qtip/v_2_2/jquery.qtip.css" />

<link rel="icon" href="<%=basePath%>resources-diy/images/icon/favicon.png" type="image/x-icon" />
<link rel="shortcut icon" href="<%=basePath%>resources-diy/images/icon/favicon.png" type="image/x-icon" />

<!--[if IE]>
<link href="themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lte IE 9]>
<script src="js/speedup.js" type="text/javascript"></script>
<![endif]-->

<script src="<%=basePath%>resources/js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/jquery.cookie.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/jquery.validate.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/xheditor/xheditor-1.1.14-zh-cn.min.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/uploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/echarts/3.5.4/echarts.common.js"></script>


<script type="text/javascript" src="<%=basePath%>resources/js/dwz/chart/raphael.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/dwz/chart/g.raphael.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/dwz/chart/g.bar.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/dwz/chart/g.line.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/dwz/chart/g.pie.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/dwz/chart/g.dot.js"></script>




<script src="<%=basePath%>resources/js/dwz/dwz.core.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.util.date.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.validate.method.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.regional.zh.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.barDrag.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.drag.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.tree.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.accordion.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.ui.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.theme.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.switchEnv.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.alertMsg.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.contextmenu.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.navTab.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.tab.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.resize.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.dialog.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.sortDrag.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.cssTable.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.stable.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.taskBar.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.ajax.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.pagination.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.database.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.datepicker.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.effects.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.panel.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.checkbox.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.history.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.combox.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/dwz/dwz.print.js" type="text/javascript"></script>

<!--
<script src="bin/dwz.min.js" type="text/javascript"></script>
-->

<!-- 自定义js工具类 -->
<script src="<%=basePath%>resources/js/common/global.util.dialog.js" type="text/javascript"></script>

<script src="<%=basePath%>resources/js/dwz/dwz.regional.zh.js" type="text/javascript"></script>

<script src="<%=basePath%>resources/js/json/json2.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/md5/md5.min.js" type="text/javascript"></script>

<script src="<%=basePath%>resources/js/common/i18n/MessageResource.zh.js"
	type="text/javascript"></script>
	
<!-- 自定义js工具类 -->
<script type="text/javascript" src="<%=basePath%>resources/js/common/global.util.listForm.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/common/global.util.date.js"></script>


<script src="<%=basePath%>resources/js/qtip/v_2_2/jquery.qtip.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/qtip/v_2_2/imagesloaded.pkg.min.js" type="text/javascript"></script>
<%--
<!-- 处理国际化js -->
<script src="<%=basePath%>resources/js/common/global.util.i18n.js" type="text/javascript"></script>
<!-- js国际化处理 -->
<%
	java.util.Locale lang = (java.util.Locale) session
			.getAttribute("org.apache.struts.action.LOCALE");
	if (null != lang && lang.toString().startsWith("zh")) {
%>
<!-- 中文 -->
<script src="<%=basePath%>resources/js/dwz/dwz.regional.zh.js" type="text/javascript"></script>

<script src="<%=basePath%>resources/js/common/i18n/MessageResource.zh.js"
	type="text/javascript"></script>
<%
	} else {
%>
<!-- 英文 -->
<script src="<%=basePath%>resources/js/common/i18n/MessageResource.en.js"
	type="text/javascript"></script>
<%
	}
%> --%>


<!-- basic styles -->
<%@page contentType="text/html; charset=utf-8" %>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=7"/>
    <title>个人理财PFinance平台</title>
    <%@ include file="../adminTaglib.jsp" %>
    <link href="themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
    <link href="uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
    <!--[if IE]>
    <link href="themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
    <![endif]-->
    <%@ include file="../HtmlContext.jsp" %>

    <script type="text/javascript">
        $(function () {
            DWZ.init($("#basePath").val() + "dwz.frag.xml", {
                //loginUrl:"login_dialog.html", loginTitle:"登录",	// 弹出登录对话框
                loginUrl: "index.html",	// 跳到登录页面
                statusCode: {ok: 200, error: 300, timeout: 301}, //【可选】
                pageInfo: {
                    pageNum: "pageNum",
                    numPerPage: "numPerPage",
                    orderField: "orderField",
                    orderDirection: "orderDirection"
                }, //【可选】
                debug: false,	// 调试模式 【true|false】
                callback: function () {
                    initEnv();
                    $("#themeList").theme({themeBase: "themes"}); // themeBase 相对于index页面的主题base路径
                }
            });
        });
    </script>

</head>

<body scroll="no">
<div id="layout">
    <div id="header">
        <div class="headerNav">
            <%--<a class="logo" href="#">标志</a>--%>
            <ul class="nav">
                <!--
                <li id="switchEnvBox"><a href="javascript:">（<span>北京</span>）切换城市</a>
                    <ul>
                        <li><a href="sidebar_1.html">北京</a></li>
                        <li><a href="sidebar_2.html">上海</a></li>
                        <li><a href="sidebar_2.html">南京</a></li>
                        <li><a href="sidebar_2.html">深圳</a></li>
                        <li><a href="sidebar_2.html">广州</a></li>
                        <li><a href="sidebar_2.html">天津</a></li>
                        <li><a href="sidebar_2.html">杭州</a></li>
                    </ul>
                </li>
                -->
                <li><a href="changepwd.html" target="dialog" width="600">设置</a></li>
                <li><a href="http://www.beetlesoft.net" target="_blank">帮助</a></li>
                <li><a href="#">退出</a></li>
            </ul>
            <ul class="themeList" id="themeList">
                <li theme="default">
                    <div>蓝色</div>
                </li>
                <li theme="green">
                    <div>绿色</div>
                </li>
                <li theme="purple">
                    <div>紫色</div>
                </li>
                <li theme="silver">
                    <div>银色</div>
                </li>
                <li theme="azure">
                    <div class="selected">天蓝</div>
                </li>
            </ul>
        </div>

        <!-- navMenu -->

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
            <div class="toggleCollapse"><h2>主菜单</h2>
                <div>收缩</div>
            </div>


            <div class="accordion" fillSpace="sidebar">

                <div class="accordionHeader">
                    <h2><span>Folder</span>理财产品管理</h2>
                </div>
                <div class="accordionContent">
                    <ul class="tree">
                        <li><a href="<%=basePath%>currency/currencyList" target="navTab"
                               rel="currencyListView">货币型产品管理</a></li>
                        <li><a href="<%=basePath%>fund/fundList" target="navTab" rel="fundListView">基金型产品管理</a></li>
                    </ul>
                </div>

                <div class="accordionHeader">
                    <h2><span>Folder</span>客户信息管理</h2>
                </div>
                <div class="accordionContent">
                    <ul class="tree">
                        <li><a href="<%=basePath%>customer/customerList" target="navTab"
                               rel="customerListView">客户信息管理</a></li>
                    </ul>
                </div>

                <div class="accordionHeader">
                    <h2><span>Folder</span>交易信息管理</h2>
                </div>
                <div class="accordionContent">
                    <ul class="tree">
                        <li><a href="<%=basePath%>currencyPurchase/currencyPurchaseList" target="navTab"
                               rel="currencyPurchaseListView">货币交易信息管理</a></li>
                        <li><a href="<%=basePath%>fundPurchase/fundPurchaseList" target="navTab"
                               rel="fundPurchaseListView">基金交易信息管理</a></li>
                    </ul>
                </div>

                <div class="accordionHeader">
                    <h2><span>Folder</span>统计管理</h2>
                </div>
                <div class="accordionContent">
                    <ul class="tree">
                        <%--<li><a href="getPurchaseList" target="navTab" rel="purchaseListView">产品信息统计</a></li>--%>
                        <li><a href="<%=basePath%>purchaseStatistic/productSum" target="navTab" rel="productSum">产品信息统计</a></li>
                        <%--<li><a href="<%=basePath%>purchaseStatistic/userSum" target="navTab" rel="userSum">客户信息统计</a></li>--%>
                        <li><a href="<%=basePath%>purchaseStatistic/purchaseSum" target="navTab"
                               rel="purchaseSum">交易信息统计</a></li>
                    </ul>
                </div>

                <div class="accordionHeader">
                    <h2><span>Folder</span>资讯管理</h2>
                </div>
                <div class="accordionContent">
                    <ul class="tree">
                        <li><a href="<%=basePath%>news/newsList" target="navTab" rel="newsListView">资讯管理</a></li>
                    </ul>
                </div>

                <div class="accordionHeader">
                    <h2><span>Folder</span>用户反馈管理</h2>
                </div>
                <div class="accordionContent">
                    <ul class="tree">
                        <li><a href="<%=basePath%>customerComment/customerCommentList" target="navTab"
                               rel="customerCommentListView">评论管理</a></li>
                        <li><a href="getPurchaseList" target="navTab" rel="purchaseListView">在线咨询</a></li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
    <div id="container">
        <div id="navTab" class="tabsPage">
            <div class="tabsPageHeader">
                <div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
                    <ul class="navTab-tab">
                        <li tabid="main" class="main"><a href="javascript:;"><span><span
                                class="home_icon">我的主页</span></span></a></li>
                    </ul>
                </div>
                <div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
                <div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
                <div class="tabsMore">more</div>
            </div>
            <ul class="tabsMoreList">
                <li><a href="javascript:;">我的主页</a></li>
            </ul>
            <div class="navTab-panel tabsPageContent layoutBox">
                <div class="page unitBox">
                    <div class="accountInfo">
                        <p><span>PFinance</span></p>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>

<%--<div id="footer">Copyright &copy; 2012 <a href="demo_page2.html" target="dialog">Beetle J2EE Application Framework</a>--%>
    <%--mail:yetao0707@gmail.com--%>
<%--</div>--%>
<input id="basePath" type="text" value="<%=basePath%>" hidden="true">
</body>
</html>
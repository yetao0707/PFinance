<%@page contentType="text/html; charset=utf-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<form id="pagerForm" method="post" action="<%=basePath%>currency/currencyList">
    <input type="hidden" name="currentPage" value="${page.page.currentPage}"/>
    <input type="hidden" name="numPerPage" value="${page.page.numPerPage}"/>
    <%--<input type="hidden" name="orderField" value="${orderField}" />--%>
    <%--<input type="hidden" name="orderDirection" value="${orderDirection}" />--%>
</form>
<div class="pageHeader">
    <form rel="pagerForm" onsubmit="return navTabSearch(this);" action="page.do" method="post">
        <div class="searchBar">
            <label>登录名称:</label><input type="text" name="loginName" value="">
            <button type="submit">检索</button>

        </div>
    </form>
</div>

<div class="pageContent">
    <div class="panelBar">
        <ul class="toolBar">
            <li><a class="add" href="<%=basePath%>currency/update" target="dialog" mask="true"><span>添加</span></a></li>
            <!-- 用于数组传送数据 -->
            <!--
            <li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids" href="user!del.action" class="delete"><span>批量删除默认方式</span></a></li>
            -->
            <!-- 用于数据用逗号分隔 -->
            <li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids" postType="string"
                   href="<%=basePath%>currency/delete?ids=${sid_user}" class="delete" target="ajaxTodo" title="确定要删除吗？"
                   warn="请选择一个用户"><span>批量删除</span></a></li>
            <%--<li><a class="delete" href="<%=basePath%>currency/delete?ids={sid_user}" target="ajaxTodo" title="确定要删除吗？"--%>
                   <%--warn="请选择一个用户"><span>删除</span></a></li>--%>
            <li><a class="edit" href="<%=basePath%>currency/update?id={sid_user}" target="dialog" mask="true"
                   warn="请选择一个用户"><span>修改</span></a></li>
            <li class="line">line</li>
            <li><a class="icon" href="demo/common/dwz-team.xls" target="dwzExport" targetType="navTab"
                   title="实要导出这些记录吗?"><span>导出EXCEL</span></a></li>
            <li><a class="icon" href="javascript:$.printBox('w_list_print')"><span>打印</span></a></li>
        </ul>
    </div>

    <div layoutH="116" id="w_list_print">
        <table class="table" width="100%" targetType="navTab" asc="asc" desc="desc">
            <thead>
            <tr>
                <th><input type="checkbox" group="ids" class="checkboxCtrl"></th>
                <th>编号</th>
                <th>产品名称</th>
                <th>期限</th>
                <th>产品类型</th>
                <th>起购金额</th>
                <th>递增金额</th>
                <th>参考收益率</th>
                <%--<th orderField="staff_id" <c:if test="${orderField=='staff_id'}">class="${orderDirection}"</c:if>>staff-id</th>--%>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${page.list}" var="pojo">
                <tr target="sid_user" rel="${pojo.id}">
                    <td><input name="ids" value="${pojo.id}" type="checkbox"></td>
                    <td>${pojo.id}</td>
                    <td>${pojo.currencyName}</td>
                    <td>${pojo.durationDays}</td>
                    <td>${pojo.productType}</td>
                    <td>${pojo.purchaseAmount}</td>
                    <td>${pojo.incrementalAmount}</td>
                    <td>${pojo.profitYield}</td>
                    <td>
                        <a title="确认删除吗?" target="ajaxTodo" href="<%=basePath%>currency/delete?ids=${pojo.id}"
                           class="btnDel">删除</a>
                        <a title="编辑" target="dialog" mask="true" href="<%=basePath%>currency/update?id=${pojo.id}"
                           class="btnEdit">编辑</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="panelBar">
        <div class="pages">
            <span>显示</span>
            <select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
                <option
                        <c:if test="${numPerPage==1}">selected="selected"</c:if> value="1">1
                </option>
                <option
                        <c:if test="${numPerPage==10}">selected="selected"</c:if> value="10">20
                </option>
                <option
                        <c:if test="${numPerPage==20}">selected="selected"</c:if> value="20">20
                </option>
                <option
                        <c:if test="${numPerPage==50}">selected="selected"</c:if> value="50">50
                </option>
            </select>
            <span>条，共${page.page.totalCount}条</span>
        </div>

        <div class="pagination" targetType="navTab" totalCount="${page.page.totalCount}"
             numPerPage="${page.page.numPerPage}" pageNumShown="10" currentPage="${page.page.currentPage}"></div>

    </div>
</div>
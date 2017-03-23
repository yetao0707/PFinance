<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="pageContent">
	
	<form method="post" action="<%=basePath%>currency/save" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
            <input type="hidden" name="id" value="${dto.id}"/>
		
			<div class="unit">
				<label>基金名称：</label>
				<input type="text" name="currencyName" value="${dto.currencyName}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>登记编码：</label>
				<input type="text" name="registerId" value="${dto.registerId}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>认购起始日：</label>
				<input type="text" name="subscriptionStartDate" value="${dto.subscriptionStartDate}" dateFmt="yyyy-MM-dd HH:mm:ss" class="date required" />
			</div>
			<div class="unit">
				<label>认购结束日：</label>
				<input type="text" name="subscriptionEndDate" value="${dto.subscriptionEndDate}" dateFmt="yyyy-MM-dd HH:mm:ss" class="date required" />
			</div>
			<div class="unit">
				<label>成立日：</label>
				<input type="text" name="foundingDate" value="${dto.foundingDate}" dateFmt="yyyy-MM-dd HH:mm:ss" class="date required" />
			</div>
			<div class="unit">
				<label>到期日：</label>
				<input type="text" name="dueDate" value="${dto.dueDate}" dateFmt="yyyy-MM-dd HH:mm:ss" class="date required"/>
			</div>
			<div class="unit">
				<label>兑付日：</label>
				<input type="text" name="cashingDay" value="${dto.cashingDay}" dateFmt="yyyy-MM-dd HH:mm:ss" class="date required" />
			</div>
			<div class="unit">
				<label>期限：</label>
				<input type="number" name="durationDays" value="${dto.durationDays}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>产品类型：</label>
				<input type="text" name="productType" value="${dto.productType}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>起购金额：</label>
				<input type="text" name="purchaseAmount" value="${dto.purchaseAmount}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>递增金额：</label>
				<input type="text" name="incrementalAmount" value="${dto.incrementalAmount}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>参考收益率：</label>
				<input type="text" name="profitYield" value="${dto.profitYield}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>销售管理费率：</label>
				<input type="text" name="tradeRate" value="${dto.tradeRate}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>购买渠道：</label>
				<input type="text" name="purchaseChannel" value="${dto.purchaseChannel}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>募集规模：</label>
				<input type="text" name="recruitmentScale" value="${dto.recruitmentScale}" size="30" maxlength="20" class="required" />
			</div>

			<%--<div class="unit">--%>
				<%--<label>是否是管理员：</label>--%>
			    <%--<select class="combox" name="adminInd">  --%>
			      <%--<option <c:if test='${dto.adminInd=="N"}'>selected="selected"</c:if> value="N">否</option>--%>
			      <%--<option <c:if test='${dto.adminInd=="Y"}'>selected="selected"</c:if> value="Y">是</option>  --%>
			    <%--</select>--%>
			    <%----%>
			<%--</div>--%>
			<%--<div class="unit">--%>
				<%--<label>staff-id：</label>--%>
				<%--<input type="text" name="staffId" value="${dto.staffId}" size="30" class="required"/>--%>
			<%--</div>--%>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>


<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="pageContent">
	
	<form method="post" action="<%=basePath%>fund/save" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
            <input type="hidden" name="id" value="${dto.id}"/>
		
			<div class="unit">
				<label>基金名称：</label>
				<input type="text" name="fundName" value="${dto.fundName}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>债券比例：</label>
				<input type="text" name="bondRate" value="${dto.bondRate}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>股票比例：</label>
				<input type="text" name="shareRate" value="${dto.shareRate}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>货币比例：</label>
				<input type="text" name="currencyRate" value="${dto.currencyRate}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>基金类型：</label>
				<input type="text" name="fundType" value="${dto.fundType}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>单位净值：</label>
				<input type="text" name="netassetValue" value="${dto.netassetValue}"  class="required" />
			</div>
			<div class="unit">
				<label>累计净值：</label>
				<input type="text" name="accumulatedValue" value="${dto.accumulatedValue}" class="required" />
			</div>
			<div class="unit">
				<label>产品成立日：</label>
				<input type="text" name="foundingDate" value="${dto.foundingDate}" dateFmt="yyyy-MM-dd HH:mm:ss" class="date required" />
			</div>
			<div class="unit">
				<label>计划类型：</label>
				<input type="text" name="planType" value="${dto.planType}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>管理人：</label>
				<input type="text" name="custodian" value="${dto.custodian}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>托管人：</label>
				<input type="text" name="trustee" value="${dto.trustee}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>推广起始日：</label>
				<input type="text" name="startDate" value="${dto.startDate}" dateFmt="yyyy-MM-dd HH:mm:ss" class="date required" />
			</div>
			<div class="unit">
				<label>推广截止日：</label>
				<input type="text" name="endDate" value="${dto.endDate}" dateFmt="yyyy-MM-dd HH:mm:ss" class="date required" />
			</div>
			<div class="unit">
				<label>存续期：</label>
				<input type="text" name="duration" value="${dto.duration}" dateFmt="yyyy-MM-dd HH:mm:ss" class="date required" />
			</div>
			<div class="unit">
				<label>募集金额：</label>
				<input type="text" name="totalRecruitment" value="${dto.totalRecruitment}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>最低购买金额：</label>
				<input type="text" name="purchaseAmount" value="${dto.purchaseAmount}" size="30" maxlength="20" class="required" />
			</div>
			<div class="unit">
				<label>最低目标：</label>
				<input type="text" name="objective" value="${dto.objective}" size="30" maxlength="20" class="required" />
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


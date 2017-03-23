<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="tab" uri="http://ditchnet.org/jsp-tabs-taglib"%>
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
<script src="<%=basePath%>resources/js/user/userShow.js"
	type="text/javascript"></script>
<tab:tabConfig />
</head>

<body scroll="no">

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
	<div align="center" style="width: 100%;height: 100%;">
		<input id="issubmit" value="${vo.isSubmit }" hidden="true"/> <tab:tabContainer
				id="task">
				<tab:tabPane id="tabPane1" tabTitle="A．基本情况">
					<form id="userform" enctype="multipart/form-data" onsubmit="false">
						<input name="id" id="userid" value="${vo.id }" hidden="true"/>
							<table width="846" style=" height:100%" border="1"/>
								<tr>
									<td>身份证号码</td>
									<td colspan="16"><input name="idNum" type="text"
										style=" width:auto; height:auto;" value="${vo.idNum }" /></td>
								</tr>
								<tr>
									<td>姓名</td>
									<td width="30"><input type="text"
										style=" height:auto; width:auto" name="name"
										value="${vo.name }" /></td>
									<td colspan="2">性别</td>
									<td width="30" colspan="3"><input type="text"
										style=" height:auto;width:auto" name="sex" value="${vo.sex }" /></td>
									<td colspan="2">民族</td>
									<td colspan="2"><input type="text"
										style=" height:auto;width: auto" name="nation"
										value="${vo.nation }" /></td>
									<td colspan="6" rowspan="6">本人照片</td>
								</tr>
								<tr>
									<td>学历</td>
									<td><input type="text" name="education"
										style=" width:auto ; height:auto" value="${vo.education }" /></td>
									<td colspan="2">学位</td>
									<td colspan="3"><input type="text"
										style=" width:auto ; height:auto" name="degree"
										value="${vo.degree }" /></td>
									<td colspan="2">党派</td>
									<td colspan="2"><input type="text"
										style=" width:auto ; height:auto" name="" value="" /></td>
								</tr>
								<tr>
									<td>出生日期</td>
									<td colspan="3"><input type="text"
										style=" width:auto ; height:auto" name="birthday"
										value="${vo.birthday }" /></td>
									<td colspan="3">出生地</td>
									<td colspan="4"><input type="text"
										style=" width:auto ; height:auto" name="birthplace"
										value="${vo.birthplace }" /></td>
								</tr>
								<tr>
									<td>专业技术职务</td>
									<td colspan="3"><input type="text"
										style=" width:auto ; height:auto" name="skillPosition"
										value="${vo.skillPosition }" /></td>
									<td colspan="3">行政职务</td>
									<td colspan="4"><input type="text" name="adminPosition"
										style=" width:auto; height:auto" value="${vo.adminPosition }" /></td>
								</tr>
								<tr>
									<td>手机号码</td>
									<td colspan="3"><input type="text"
										style=" width:auto ; height:auto" name="phoneNumber"
										value="${vo.phoneNumber }" /></td>
									<td colspan="3">单位电话</td>
									<td colspan="4"><input type="text"
										style=" width:auto ; height:auto" name="depNum"
										value="${vo.depNum }" /></td>
								</tr>
								<tr>
									<td>E-mail</td>
									<td colspan="3"><input type="text"
										style=" width:auto ; height:auto" name="email"
										value="${vo.email }" /></td>
									<td colspan="3">住宅电话</td>
									<td colspan="4"><input type="text"
										style=" width:auto ; height:auto" name="homeNum"
										value="${vo.homeNum }" /></td>
								</tr>
								<tr>

									<td colspan="4"><input type="file" name="file" /></td>
								</tr>
							</table> <input id="userbutton" type="submit" value="submit">
					</form>
					<form id="aa" method="post" enctype="multipart/form-data"
						onsubmit="false">

						<input type="file" name="file" id="uFile" /> <input id="upload"
							type="submit" value="submit"/>
					</form>
			简历：<br>
						<div align="center">
							<form id="resumeform">

								<input name="id" value="${vo.id }" hidden="true"/>

									<table class="list" width="100%" rel="jbsxBox"/>
										<thead>
											<tr>
												<td width="30%"></td>
												<td width="30%">起止年月</td>
												<td width="30%">在何单位（学校）任何职（读何专业）</td>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${vo.resumes }" var="resume"
												varStatus="status">
												<tr>
													<td><input name="resumes[${status.getIndex()}].id"
														value="${resume.id}" hidden="true"/></td>
													<td><input
														name="resumes[${status.getIndex()}].worktime"
														value="${resume.worktime}"/></td>
													<td><input
														name="resumes[${status.getIndex()}].description"
														value="${resume.description}"/></td>
													<td>
												</tr>

												<c:if test="${status.last}">
													<c:forEach begin="0" end="3" varStatus="i">
														<tr>
															<td><input
																name="resumes[${status.getIndex()+i.getCount()}].id"
																value="-1" hidden="true"/></td>
															<td><input
																name="resumes[${status.getIndex()+i.getCount()}].worktime"
																value=""/></td>
															<td><input
																name="resumes[${status.getIndex()+i.getCount()}].description"/></td>
															<td>
														</tr>
													</c:forEach>
												</c:if>
											</c:forEach>
											<c:if test="${vo.resumes.size()==0}">
												<c:forEach begin="0" end="3" varStatus="i">
													<tr>
														<td><input name="resumes[${i.getIndex()}].id"
															value="-1" hidden="true"></td>
														<td><input name="resumes[${i.getIndex()}].worktime"
															value=""/></td>
														<td><input
															name="resumes[${i.getIndex()}].description"/></td>

													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
							</form>
							<div align="center">
								<button id="resumebutton">保存</button>
							</div>
						</div>
				</tab:tabPane>

				<tab:tabPane id="tabPane3" tabTitle="B. 所获科技奖励和荣誉称号情况">

					<div align="center">
						<form method="post" id="scienceform">
							<input name="id" value="${vo.id }" hidden="true"/>

								<table class="list" width="100%" rel="jbsxBox"/>
									<thead align="center">
										<tr>
											<th width="10%"></th>
											<th width="10%">奖励或荣誉名称</th>
											<th width="10%">授奖单位</th>
											<th width="17%">授奖日期</th>
											<th width="10%">获奖总人数</th>
											<th width="30%">本人排名</th>
										</tr>
									</thead>
									<tbody align="left">
										<c:forEach items="${vo.sciences }" var="science"
											varStatus="status">
											<tr>
												<td><input name="sciences[${status.getIndex()}].id"
													value="${science.id}" hidden="true"></td>
												<td><input
													name="sciences[${status.getIndex()}].awardName"
													value="${science.awardName}"></td>
												<td><input
													name="sciences[${status.getIndex()}].awardDep"
													value="${science.awardDep}"></td>
												<td><input
													name="sciences[${status.getIndex()}].awardDate"
													value="${science.awardDate}"></td>
												<td><input
													name="sciences[${status.getIndex()}].awardNum"
													value="${science.awardNum}"></td>
												<td><input name="sciences[${status.getIndex()}].rand"
													value="${science.rand}"></td>
											</tr>

											<c:if test="${status.last}">
												<c:forEach begin="0" end="3" varStatus="i">
													<tr>
														<td><input
															name="sciences[${status.getIndex()+i.getCount()}].id"
															value="-1" hidden="true"></td>
														<td><input
															name="sciences[${status.getIndex()+i.getCount()}].awardName"
															value=""></td>
														<td><input
															name="sciences[${status.getIndex()+i.getCount()}].awardDep"></td>
														<td><input
															name="sciences[${status.getIndex()+i.getCount()}].awardDate"></td>
														<td><input
															name="sciences[${status.getIndex()+i.getCount()}].awardNum"></td>
														<td><input
															name="sciences[${status.getIndex()+i.getCount()}].rand"></td>
													</tr>
												</c:forEach>
											</c:if>
										</c:forEach>
										<c:if test="${vo.sciences.size()==0}">
											<c:forEach begin="0" end="3" varStatus="i">
												<tr>
													<td><input name="sciences[${i.getIndex()}].id"
														value="-1" hidden="true"></td>
													<td><input name="sciences[${i.getIndex()}].awardName"
														value=""></td>
													<td><input name="sciences[${i.getIndex()}].awardDep"></td>
													<td><input name="sciences[${i.getIndex()}].awardDate"></td>
													<td><input name="sciences[${i.getIndex()}].awardNum"></td>
													<td><input name="sciences[${i.getIndex()}].rand"></td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
						</form>
						<div align="center">
							<button id="sciencebutton">保存</button>
						</div>
					</div>

				</tab:tabPane>
				<tab:tabPane id="tabPane4" tabTitle="C. 发表论文和专著情况">
					<form id="articleform" onsubmit="false">
						<input name="id" value="${vo.id }" hidden="true"> <c:if
								test="${vo.article.id!=null}">
								<input name="article.id" value="${vo.article.id}" hidden="true">
								<textarea name="article.description"
									value="${vo.article.description}" cols="80" rows="30">${vo.article.description}</textarea>
							</c:if> <c:if test="${vo.article.id==null}">
								<textarea name="article.description"
									value="${vo.article.description}" cols="80" rows="30">${vo.article.description}</textarea>
							</c:if>
					</form>
					<div align="center">
						<button id="articlebutton">保存</button>
					</div>


				</tab:tabPane>
				<tab:tabPane id="tabPane5" tabTitle="D. 获基金资助情况">
					<div align="center">
						<form action="" method="post" id="fundform">
							<input name="id" value="${vo.id }" hidden="true">

								<table class="list" width="100%" rel="jbsxBox">
									<thead align="center">
										<tr>
											<td width="10%"></td>
											<td width="10%">获基金资助项目名称</td>
											<td width="10%">基金名称</td>
											<td width="17%">资助时间及方式</td>
											<td width="10%">目前项目完成情况</td>
										</tr>
									</thead>
									<tbody align="left">
										<c:forEach items="${vo.funds }" var="fund" varStatus="status">
											<tr>
												<td><input name="funds[${status.getIndex()}].id"
													value="${fund.id}" hidden="true"></td>
												<td><input
													name="funds[${status.getIndex()}].projectName"
													value="${fund.projectName}"></td>
												<fundst name="funds[${status.getIndex()}].moneyRand"
													value="${fund.moneyRand}">
												</td>
												<td><input
													name="funds[${status.getIndex()}].moneyDetail"
													value="${fund.moneyDetail}"></td>
												<td><input
													name="funds[${status.getIndex()}].projectPostion"
													value="${fund.projectPostion}"></td>
											</tr>

											<c:if test="${status.last}">
												<c:forEach begin="0" end="3" varStatus="i">
													<tr>
														<td><input
															name="funds[${status.getIndex()+i.getCount()}].id"
															value="-1" hidden="true"></td>
														<td><input
															name="funds[${status.getIndex()+i.getCount()}].projectName"
															value=""></td>
														<td><input
															name="funds[${status.getIndex()+i.getCount()}].moneyRand"></td>
														<td><input
															name="funds[${status.getIndex()+i.getCount()}].moneyDetail"></td>
														<td><input
															name="funds[${status.getIndex()+i.getCount()}].projectPostion"></td>

													</tr>
												</c:forEach>
											</c:if>
										</c:forEach>
										<c:if test="${vo.funds.size()==0}">
											<c:forEach begin="0" end="3" varStatus="i">
												<tr>
													<td><input name="funds[${i.getIndex()}].id" value="-1"
														hidden="true"></td>
													<td><input name="funds[${i.getIndex()}].projectName"
														value=""></td>
													<td><input name="funds[${i.getIndex()}].moneyRand"></td>
													<td><input name="funds[${i.getIndex()}].moneyDetail"></td>
													<td><input
														name="funds[${i.getIndex()}].projectPostion"></td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
						</form>
						<div align="center">
							<button id="fundbutton">保存</button>
						</div>
					</div>
				</tab:tabPane>
				<tab:tabPane id="tabPane6" tabTitle="E. 参与重大工程技术项目情况">
					<div align="center">
						<form action="" method="post" id="projectform">
							<input name="id" value="${vo.id }" hidden="true">

								<table class="list" width="100%" rel="jbsxBox">
									<thead align="center">
										<tr>
											<td width="10%"></td>
											<td width="10%">项目名称</td>
											<td width="10%">项目委托单位</td>
											<td width="17%">本人参与情况</td>
											<td width="10%">经济效益（万元）</td>
										</tr>
									</thead>
									<tbody align="left">
										<c:forEach items="${vo.projects }" var="project"
											varStatus="status">
											<tr>
												<td><input name="projects[${status.getIndex()}].id"
													value="${project.id}" hidden="true"></td>
												<td><input
													name="projects[${status.getIndex()}].projectName"
													value="${project.projectName}"></td>
												<td><input
													name="projects[${status.getIndex()}].projectDep"
													value="${project.projectDep}"></td>
												<td><input
													name="projects[${status.getIndex()}].workDescription"
													value="${project.workDescription}"></td>
												<td><input name="projects[${status.getIndex()}].reward"
													value="${project.reward}"></td>
											</tr>

											<c:if test="${status.last}">
												<c:forEach begin="0" end="3" varStatus="i">
													<tr>
														<td><input
															name="projects[${status.getIndex()+i.getCount()}].id"
															value="-1" hidden="true"></td>
														<td><input
															name="projects[${status.getIndex()+i.getCount()}].projectName"
															value=""></td>
														<td><input
															name="projects[${status.getIndex()+i.getCount()}].projectDep"></td>
														<td><input
															name="projects[${status.getIndex()+i.getCount()}].workDescription"></td>
														<td><input
															name="projects[${status.getIndex()+i.getCount()}].reward"></td>

													</tr>
												</c:forEach>
											</c:if>
										</c:forEach>
										<c:if test="${vo.projects.size()==0}">
											<c:forEach begin="0" end="3" varStatus="i">
												<tr>
													<td><input name="projects[${i.getIndex()}].id"
														value="-1" hidden="true"></td>
													<td><input
														name="projects[${i.getIndex()}].projectName" value=""></td>
													<td><input name="projects[${i.getIndex()}].projectDep"></td>
													<td><input
														name="projects[${i.getIndex()}].workDescription"></td>
													<td><input name="projects[${i.getIndex()}].reward"></td>

												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
						</form>
						<div align="center">
							<button id="projectbutton">保存</button>
						</div>
					</div>
				</tab:tabPane>
				<tab:tabPane id="tabPane7" tabTitle="F. 科技成果转化、科普和科技管理情况">
					<div align="center">
						<form id="outputform" onsubmit="false">
							<input name="id" value="${vo.id }" hidden="true"/> <c:if
									test="${vo.output!=null}">
									<input name="output.id" value="${vo.output.id}" hidden="true"/>
										<textarea
												name="output.description" value="${vo.output.description}"
												cols="80" rows="30">${vo.output.description}</textarea>
								</c:if> <c:if test="${vo.output==null}">
									<input name="output.id" value="-1" hidden="true"/> 
											<textarea name="output.description"
												value="${vo.output.description}" cols="80" rows="30">${vo.output.description}</textarea>
								</c:if>
						</form>
						<div align="center">
							<button id="outputbutton">保存</button>
						</div>
					</div>

				</tab:tabPane>
				<tab:tabPane id="tabPane8" tabTitle="G. 综合推荐理由（不超过1000字）">

					<div align="center">
						<form id="333" action="" onsubmit="false">
							<input name="id" value="${vo.id }" hidden="true"> <input
								name="output.id" value="vo.output.id" hidden="true"> <textarea
										name="output.description" rows="10" cols="10"
										value="${vo.output.description }"></textarea>
						</form>
						<div align="center">
							<button id="444">保存</button>
						</div>
					</div>
				</tab:tabPane>
				<tab:tabPane id="tabPane9" tabTitle="H. 推荐意见">

					<div align="center">
						<form id="2222" action="" onsubmit="false">
							<input name="output.id" value="vo.output.id" hidden="true">
								<textarea name="output.description" rows="10" cols="10"
									value="${vo.output.description }"></textarea>
						</form>
						<div align="center">
							<button>保存</button>
						</div>
					</div>
				</tab:tabPane>
				<tab:tabPane id="tabPane10" tabTitle="I. 评审意见（以下由省评审机构填写）">

					<div align="center">
						<form id="1111" action="" onsubmit="false">
							<input name="id" value="${vo.id }" hidden="true"> <c:if
									test="${vo.output.id!=null}">
									<input name="output.id" value="${vo.output.id}" hidden="true">
										<input name="output.description"
										value="${vo.output.description}">
								</c:if> <c:if test="${vo.output.id==null}">
									<input name="output.id" value="-1" hidden="true"> <input
										name="output.description" value="${vo.output.description}">
								</c:if>
						</form>

						<div align="center">
							<button>保存</button>
						</div>
					</div>
				</tab:tabPane>
				<tab:tabPane id="tabPane10" tabTitle="J．封皮">

				</tab:tabPane>


			</tab:tabContainer>
	</div>
	<input id="basePath" value="<%=basePath%>" hidden="true">
		<div align="center">
			<button id="submitbutton">提交</button>
		</div>
</body>
</html>
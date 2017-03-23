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
<script src="<%=basePath%>resources/js/evaluate/question.js"
	type="text/javascript"></script>
<style type="text/css">

</style>
</head>

<body >
	<div>

		<div id="question1" class="questiondiv">
			<p class="questionTitle">1、请问您的性别是？</p>
			<hr />
			<p><input type="radio" class="1answer" value="1"/><label>A、男</label></p>
			<p><input type="radio" class="1answer" value="2"/><label>B、女</label></p>
		</div>
		
		<div id="question2" class="questiondiv">
			<p class="questionTitle">2、请问您的年龄是？</p>
			<hr />
			<p><input type="radio" class="2answer" value="1"/><label>A、20岁以下</label></p>
			<p><input type="radio" class="2answer" value="2"/><label>B、21岁-30岁</label></p>
			<p><input type="radio" class="2answer" value="3"/><label>C、31岁-45岁</label></p>
			<p><input type="radio" class="2answer" value="4"/><label>D、46岁-60岁</label></p>
			<p><input type="radio" class="2answer" value="5"/><label>E、60岁以上</label></p>
		</div>
		
		<div id="question3" class="questiondiv">
			<p class="questionTitle">3、请问以下词组哪项更能描述您？</p>
			<hr />
			<p><input type="radio" class="3answer" value="1"/><label>A、喜欢量化分析问题、保守、拘谨、理性</label></p>
			<p><input type="radio" class="3answer" value="2"/><label>B、善于接受新事物、情绪化、敏感、热情</label></p>
			<p><input type="radio" class="3answer" value="3"/><label>C、有组织力、愿意承担风险、自信、果断</label></p>
			<p><input type="radio" class="3answer" value="4"/><label>D、适应力强、易相处、谦虚、温顺、合作</label></p>
		</div>
		
		<div id="question4" class="questiondiv">
			<p class="questionTitle">4、请问您的受教育程度是？</p>
			<hr />
			<p><input type="radio" class="4answer" value="1"/><label>A、初中及以下</label></p>
			<p><input type="radio" class="4answer" value="2"/><label>B、高中或中专</label></p>
			<p><input type="radio" class="4answer" value="3"/><label>C、大专</label></p>
			<p><input type="radio" class="4answer" value="4"/><label>D、本科</label></p>
			<p><input type="radio" class="4answer" value="5"/><label>E、硕士</label></p>
			<p><input type="radio" class="4answer" value="6"/><label>F、博士及以上</label></p>
		</div>

		<div id="question5" class="questiondiv">
			<p class="questionTitle">5、您认为您目前工作所处的行业是？</p>
			<hr />
			<p><input type="radio" class="5answer" value="1"/><label>A、党政机关</label></p>
			<p><input type="radio" class="5answer" value="2"/><label>B、制造业</label></p>
			<p><input type="radio" class="5answer" value="3"/><label>C、金融业</label></p>
			<p><input type="radio" class="5answer" value="4"/><label>D、服务业</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">6、请问您的家庭结构是？</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、未婚</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、已婚</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">7、请问您的家庭平均每人税前月收入大约是？</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、4500元以下</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、4501-6000元</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>C、6001-10000元</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>D、10001-40000元</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>E、40001-60000元</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>F、60000-85000元</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>G、85001元以上</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">8、请问您的家庭收入来源及占比主要是？（请勾选，综合为100%）</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、工资性收入</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、经营性收入</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>C、财产性收入（投资收入、租金收入等）</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>D、财产性收入（投资收入、租金收入等）</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>E、其他（稿费。专利费等）</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">9、请问您的家庭每人平均的消费支出总额每月大约是？</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、1000月以下</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、1001-3000元</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>C、3001-5000元</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>D、5000-10000元</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>E、10001-30000元</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>F、30001-50000元</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>G、50001元以上</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">10、请问您当前的居住状况是？</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、已有住房并且已经全额付清房款</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、已有住房但正在按揭还款</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>C、租房（请您直接回答11题）</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">11、请问您的家庭拥有自由交通工具吗？</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、有</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、没有（请您直接回答12题）</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">12、您的家庭每人平均的交通支出大概是？（不包括自由交通工具的费用）</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、300元以下</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、301-500元</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>C、501-1000元</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>D、1001-3000元</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>E、3001-5000元</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>F、5001元以上</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">13、请问您退休的平均收入总额每月大约是？（已退休者作答）（不包括自由交通工具的费用）</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、1000元以下</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、1001-3000元</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>C、3001-5000元</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>D、5001-10000元</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>E、10001-20000元</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>F、20001-30000元</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>G、30001元以上</label></p>
		</div>


		<div id="question6" class="questiondiv">
			<p class="questionTitle">14、请问您退休后的收入来源占比大约是？（已退休者作答）</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、退休工资</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、返聘收入</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>C、投资收入</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>D、子女赡养费</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>E、商业养老保险</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>F、其他收入</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">15、请问您的家庭负债总额是多少？</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、1万元以下</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、1-5万元</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>C、5-20万元元</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>D、20-50万元</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>E、50-300万元</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>F、300万元以上</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">16、请问您的家庭债务结构是怎样的？（有负债者作答，请勾选，总和为100%）</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、信用卡欠款</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、银行消费贷款（汽车等）</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>C、住房按揭贷款</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>D、民间借款</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">17、请问您的家庭目前可投资资产总量大约是？</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、1万元以下</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、1-5万元</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>C、5-20万元元</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>D、20-50万元</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>E、50-300万元</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>F、300万元以上</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">18、请问您目前的资产配置情况（请勾选，总和为100%）</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、现金、活期存款（本外币）</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、固定收益类银行理财产品</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>C、股权类银行理财产品</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>D、中长期债券或债券型基金</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>E、股票投资或股票型基金</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>F、实业投资</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>G、金融衍生品（期权、期货等）</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>H、境外投资</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>I、非自住的房地产投资</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>J、其他实物类投资（贵金属、艺术收藏品、玉石、古董等）</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">19、请问您有多少年股票、基金、外汇、金融衍生品等风险投资产品的经验？</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、没有经验 </label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、少于2年</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>C、2-5年</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>D、5-8年</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>E、8年以上</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">20、以下哪项最符合您的投资态度？</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、风险厌恶、不希望本金损失、希望获得稳定回报 </label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、保守投资、不希望本金损失、愿意承担一定幅度的收益波动</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>C、寻求资金的较高收益和成长性、愿意为此承担有限本金的损失</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>D、希望赚钱高回报、愿意为此承担较大本金损失</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">22、假设A、B、C三种投资，收益情况分别如下所述，请问您愿意选择哪种？</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、肯定会有1000元的收益，无任何风险 </label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、50%产生3500的收益，50%产生700元的损失</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>C、50%产生6000元的收益，50%产生2000的损失</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">23、下面的观点描述了投资1万美元于5种投资组合后可能的增值和损失概率，您会投资哪一种？</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、第一年投资组合价值可能达到10300美元，不会发生任何损失 </label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、第一年投资组合价值可能达到10600美元，八年中可能有一年发生损失</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>C、第一年投资组合价值可能达到10900美元，六年中可能有一年发生任何损失</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>D、第一年投资组合价值可能达到11100美元，五年中可能有一年发生任何损失</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>E、第一年投资组合价值可能达到11400美元，六年中可能有一年发生任何损失</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">24、您的投资出现何种程度的波动时，您会呈现明显的焦虑？</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、本金无损失，但收益未达到预期 </label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、出现轻微本金损失</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>C、本金10%以内的损失</label></p>
			<p><input type="radio" class="6answer" value="2"/><label>D、本金20%-50%的损失</label></p>
			<p><input type="radio" class="6answer" value="1"/><label>E、本金50%以上的损失</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">25、请问市场中的各类理财产品能满足您的需求吗？</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、能 </label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、不能</label></p>
		</div>

		<div id="question6" class="questiondiv">
			<p class="questionTitle">25、请问市场中的各类理财产品能满足您的需求吗？</p>
			<hr />
			<p><input type="radio" class="6answer" value="1"/><label>A、能 </label></p>
			<p><input type="radio" class="6answer" value="2"/><label>B、不能</label></p>
		</div>
		

	</div>

</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="../../taglib.jsp" %>
<%@ page isELIgnored="false" %>

<script>
    $(document).ready(function () {
        $("#questionSubmitButton").click(function () {
            //验证
            var a1 = 0;
            var a2 = 0;
            var a3 = 0;
            var b11 = 0;
            var b12 = 0;
            var b13 = 0;
            var b21 = 0;
            var b22 = 0;
            var b23 = 0;
            var c1 = 0;
            var c2 = 0;
            var c3 = 0;
            var c4 = 0;
            for (var i = 1; i < 28; i++) {
                var a = $("input[name='" + i + "answer']:checked");
                var val = a.val();
                if (val == undefined) {
                    if (i == 13 || i == 14) {
                        continue;
                    }
                    alert("请作答第" + i + "题！");
                    return;
                }
                var div = a.parent().parent();
                weights = div.attr("value").split("+");
                if (a.attr("type") == "radio") {
                    var value = a.val();
                    var values = value.split("+");
                    if (values[0] != "") {
                        valuesDetail = values[0].split("_");
                        a1 += Number(valuesDetail[0]) * Number(weights[0]);
                        a2 += Number(valuesDetail[1]) * Number(weights[0]);
                        a3 += Number(valuesDetail[2]) * Number(weights[0]);
                    }
                    if (values[1] != "") {
                        valuesDetail = values[1].split("_");
                        b11 += Number(valuesDetail[0]) * Number(weights[1]);
                        b12 += Number(valuesDetail[1]) * Number(weights[1]);
                        b13 += Number(valuesDetail[2]) * Number(weights[1]);
                    }
                    if (values[2] != "") {
                        valuesDetail = values[2].split("_");
                        b21 += Number(valuesDetail[0]) * Number(weights[2]);
                        b22 += Number(valuesDetail[1]) * Number(weights[2]);
                        b23 += Number(valuesDetail[2]) * Number(weights[2]);
                    }
                    if (values[3] != "") {
                        valuesDetail = values[3].split("_");
                        c1 += Number(valuesDetail[0]) * Number(weights[3]);
                        c2 += Number(valuesDetail[1]) * Number(weights[3]);
                        c3 += Number(valuesDetail[2]) * Number(weights[3]);
                        c4 += Number(valuesDetail[3]) * Number(weights[3]);
                    }
                } else {
                    var value = a.val();
                    if (value == undefined) {
                        alert("请作答第" + i + "题！");
                        return;
                    }
                    var s = '';
                    var ta1 = 0;
                    var ta2 = 0;
                    var ta3 = 0;
                    var tb11 = 0;
                    var tb12 = 0;
                    var tb13 = 0;
                    var tb21 = 0;
                    var tb22 = 0;
                    var tb23 = 0;
                    var tc1 = 0;
                    var tc2 = 0;
                    var tc3 = 0;
                    var tc4 = 0;
                    for (var i2 = 0; i2 < a.length; i2++) {
                        if (a[i2].checked) s += a[i2].value + ','; //如果选中，将value添加到变量s中
                    }
                    s = s.substring(0, s.length - 1);
                    strs = s.split(",");
                    for (i3 = 0; i3 < strs.length; i3++) {
                        value = strs[i3];
                        if (value != "") {
                            var values = value.split("+");
                            if (values[0] != "") {
                                valuesDetail = values[0].split("_");
                                ta1 += Number(valuesDetail[0]) * Number(weights[0]);
                                ta2 += Number(valuesDetail[1]) * Number(weights[0]);
                                ta3 += Number(valuesDetail[2]) * Number(weights[0]);
                            }
                            if (values[1] != "") {
                                valuesDetail = values[1].split("_");
                                tb11 += Number(valuesDetail[0]) * Number(weights[1]);
                                tb12 += Number(valuesDetail[1]) * Number(weights[1]);
                                tb13 += Number(valuesDetail[2]) * Number(weights[1]);
                            }
                            if (values[2] != "") {
                                valuesDetail = values[2].split("_");
                                b21 += Number(valuesDetail[0]) * Number(weights[2]);
                                b22 += Number(valuesDetail[1]) * Number(weights[2]);
                                b23 += Number(valuesDetail[2]) * Number(weights[2]);
                            }
                            if (values[3] != "") {
                                valuesDetail = values[3].split("_");
                                c1 += Number(valuesDetail[0]) * Number(weights[3]);
                                c2 += Number(valuesDetail[1]) * Number(weights[3]);
                                c3 += Number(valuesDetail[2]) * Number(weights[3]);
                                c4 += Number(valuesDetail[3]) * Number(weights[3]);
                            }
                        }
                    }
                    a1 += ta1 / strs.length;
                    a2 += ta2 / strs.length;
                    a3 += ta3 / strs.length;
                    b11 += tb11 / strs.length;
                    b12 += tb12 / strs.length;
                    b13 += tb13 / strs.length;
                    b21 += tb22 / strs.length;
                    b22 += tb22 / strs.length;
                    b23 += tb23 / strs.length;
                    c1 += tc1 / strs.length;
                    c2 += tc2 / strs.length;
                    c3 += tc3 / strs.length;
                    c4 += tc2 / strs.length;
                }
            }
            evaluateResult = "";

            if (a1 >= a2 && a1 >= a3) {
                evaluateResult = evaluateResult + "1";
            } else if (a2 >= a1 && a2 >= a3) {
                evaluateResult += 2;
            } else {
                evaluateResult += 3;
            }
            b1 = b11 + 1.5 * b21;
            b2 = b12 + 1.5 * b22;
            b3 = b13 + 1.5 * b23;


            if (b1 >= b2 && b1 >= b3) {
                evaluateResult = evaluateResult + "1";
            } else if (b2 >= b1 && b2 >= b3) {
                evaluateResult += 2;
            } else {
                evaluateResult += 3;
            }

            if (c1 >= c2 && c1 >= c3 && c1 >= c4) {
                evaluateResult = evaluateResult + "1";
            } else if (c2 >= c1 && c2 >= c3 && c2 >= c4) {
                evaluateResult += 2;
            } else if (c3 >= c1 && c3 >= c2 && c3 >= c4) {
                evaluateResult += 3;
            } else {
                evaluateResult += 4;
            }
            var evaluateDetail = a1 + "+" + a2 + "+" + a3 + "," + b1 + "+" + b2 + "+" + b3 + "," + c1 + "+" + c2 + "+" + c3 + "+" + c4;
            $.ajax({
                type: "post",
                url: "saveEvaluateResult",
                data: {
                    evaluateResult: evaluateResult,
                    evaluateDetail: evaluateDetail
                },
                dataType: "json",
                success: function (data) {
                    // alert(data.statusCode);

                    if (data.statusCode == "200") {
                        alert("测评成功");
                        $("#pFinanace").load("pFinanceIndex");

                    } else {
                        alert("测评失败失败：" + data.message);
                    }
                }
            });
        });
    });
</script>
<div class="container">
    <div class="row">
        <div class="col-md-3">

        </div>
        <div class="col-md-6">
            <div id="question1" class="questiondiv row required" value="1+3++">
                <p class="questionTitle">1、请问您的性别是？</p>
                <hr/>
                <p><input type="radio" name="1answer" value="2_3_2+2_2_1++"/><label>A、男</label></p>
                <p><input type="radio" name="1answer" value="3_2_2+1_2_2++"/><label>B、女</label></p>
            </div>

            <div id="question2" class="questiondiv  row required" value="7+4++">
                <p class="questionTitle">2、请问您的年龄是？</p>
                <hr/>
                <p><input type="radio" name="2answer" value="3_0_0+3_2_1++"/><label>A、20岁以下</label></p>
                <p><input type="radio" name="2answer" value="3_0_0+3_2_1++"/><label>B、21岁-30岁</label></p>
                <p><input type="radio" name="2answer" value="3_3_0+2_3_2++"/><label>C、31岁-45岁</label></p>
                <p><input type="radio" name="2answer" value="0_3_0+2_3_2++"/><label>D、46岁-60岁</label></p>
                <p><input type="radio" name="2answer" value="0_0_4+1_1_3++"/><label>E、60岁以上</label></p>
            </div>

            <div id="question3" class="qrow required" value="+++7">
                <p class="questionTitle">3、请问以下词组哪项更能描述您？</p>
                <hr/>
                <p><input type="radio" name="3answer" value="+++5_1_1_2"/><label>A、喜欢量化分析问题、保守、拘谨、理性</label></p>
                <p><input type="radio" name="3answer" value="+++1_5_2_2"/><label>B、善于接受新事物、情绪化、敏感、热情</label></p>
                <p><input type="radio" name="3answer" value="+++1_2_5_2"/><label>C、有组织力、愿意承担风险、自信、果断</label></p>
                <p><input type="radio" name="3answer" value="+++1_1_2_5"/><label>D、适应力强、易相处、谦虚、温顺、合作</label></p>
            </div>

            <div id="question4" class="questiondiv  row required" value="+4++">
                <p class="questionTitle">4、请问您的受教育程度是？</p>
                <hr/>
                <p><input type="radio" name="4answer" value="+1_2_3++"/><label>A、初中及以下</label></p>
                <p><input type="radio" name="4answer" value="+2_2_3++"/><label>B、高中或中专</label></p>
                <p><input type="radio" name="4answer" value="+3_2_2++"/><label>C、大专</label></p>
                <p><input type="radio" name="4answer" value="+3_3_2++"/><label>D、本科</label></p>
                <p><input type="radio" name="4answer" value="+3_3_2++"/><label>E、硕士</label></p>
                <p><input type="radio" name="4answer" value="+2_3_2++"/><label>F、博士及以上</label></p>
            </div>

            <div id="question5" name="questiondiv  row required" value="+4++">
                <p class="questionTitle">5、您认为您目前工作所处的行业是？</p>
                <hr/>
                <p><input type="radio" name="5answer" value="+1_2_3++"/><label>A、党政机关</label></p>
                <p><input type="radio" name="5answer" value="+2_2_2++"/><label>B、制造业</label></p>
                <p><input type="radio" name="5answer" value="+2_3_2++"/><label>C、金融业</label></p>
                <p><input type="radio" name="5answer" value="+3_2_1++"/><label>D、服务业</label></p>
            </div>

            <div id="question6" class="questiondiv  row required" value="3+4++">
                <p class="questionTitle">6、请问您的家庭结构是？</p>
                <hr/>
                <p><input type="radio" name="6answer" value="2_3_1+3_2_1++"/><label>A、未婚</label></p>
                <p><input type="radio" name="6answer" value="1_3_3+1_2_3++"/><label>B、已婚</label></p>
            </div>

            <div id="question7" class="questiondiv  row required" value="4+5++">
                <p class="questionTitle">7、请问您的家庭平均每人税前月收入大约是？</p>
                <hr/>
                <p><input type="radio" name="7answer" value="5_3_5+1_4_7++"/><label>A、4500元以下</label></p>
                <p><input type="radio" name="7answer" value="5_3_4+2_4_6++"/><label>B、4501-6000元</label></p>
                <p><input type="radio" name="7answer" value="4_4_3+3_4_5++"/><label>C、6001-10000元</label></p>
                <p><input type="radio" name="7answer" value="3_4_2+4_4_4++"/><label>D、10001-40000元</label></p>
                <p><input type="radio" name="7answer" value="2_5_1+5_4_3++"/><label>E、40001-60000元</label></p>
                <p><input type="radio" name="7answer" value="1_5_1+6_4_2++"/><label>F、60000-85000元</label></p>
                <p><input type="radio" name="7answer" value="1_5_1+7_4_1++"/><label>G、85001元以上</label></p>
            </div>

            <div id="question8" class="questiondiv  row" value="+1++">
                <p class="questionTitle">8、请问您的家庭收入来源及占比主要是？（多选题）</p>
                <hr/>
                <p><input type="checkbox" name="8answer" value="+2_3_1++"/><label>A、工资性收入</label></p>
                <p><input type="checkbox" name="8answer" value="+2_3_1++"/><label>B、经营性收入</label></p>
                <p><input type="checkbox" name="8answer" value="+1_1_3++"/><label>C、财产性收入（投资收入、租金收入等）</label></p>
                <p><input type="checkbox" name="8answer" value="+1_1_3++"/><label>D、财产性收入（投资收入、租金收入等）</label></p>
                <p><input type="checkbox" name="8answer" value="+1_1_1++"/><label>E、其他（稿费。专利费等）</label></p>
            </div>

            <div id="question9" name="questiondiv  row required" value="4+4++">
                <p class="questionTitle">9、请问您的家庭每人平均的消费支出总额每月大约是？</p>
                <hr/>
                <p><input type="radio" name="9answer" value="5_3_5+1_4_7++"/><label>A、1000月以下</label></p>
                <p><input type="radio" name="9answer" value="5_3_4+2_4_6++"/><label>B、1001-3000元</label></p>
                <p><input type="radio" name="9answer" value="4_4_3+3_4_5++"/><label>C、3001-5000元</label></p>
                <p><input type="radio" name="9answer" value="2_4_2+4_4_4++"/><label>D、5000-10000元</label></p>
                <p><input type="radio" name="9answer" value="2_5_1+5_4_3++"/><label>E、10001-30000元</label></p>
                <p><input type="radio" name="9answer" value="1_5_1+6_4_2++"/><label>F、30001-50000元</label></p>
                <p><input type="radio" name="9answer" value="1_5_1+7_4_1++"/><label>G、50001元以上</label></p>
            </div>

            <div id="question10" name="questiondiv  row " value="3+2++">
                <p class="questionTitle">10、请问您当前的居住状况是？</p>
                <hr/>
                <p><input type="radio" name="10answer" value="1_2_3+1_2_2++"/><label>A、已有住房并且已经全额付清房款</label></p>
                <p><input type="radio" name="10answer" value="2_3_2+2_3_1++"/><label>B、已有住房但正在按揭还款</label></p>
                <p><input type="radio" name="10answer" value="3_1_1+3_2_1++"/><label>C、租房</label></p>
            </div>

            <div id="question11" class="questiondiv  row " value="+2++">
                <p class="questionTitle">11、请问您的家庭拥有自由交通工具吗？</p>
                <hr/>
                <p><input type="radio" name="11answer" value="+1_2_1++"/><label>A、有</label></p>
                <p><input type="radio" name="11answer" value="+2_3_1++"/><label>B、没有</label></p>
            </div>

            <div id="question12" class="questiondiv  row " value="+2++">
                <p class="questionTitle">12、您的家庭每人平均的交通支出大概是？（不包括自由交通工具的费用）</p>
                <hr/>
                <p><input type="radio" name="12answer" value="+1_1_3++"/><label>A、300元以下</label></p>
                <p><input type="radio" name="12answer" value="+3_1_2++"/><label>B、301-500元</label></p>
                <p><input type="radio" name="12answer" value="+3_2_1++"/><label>C、501-1000元</label></p>
                <p><input type="radio" name="12answer" value="+2_2_1++"/><label>D、1001-3000元</label></p>
                <p><input type="radio" name="12answer" value="+2_3_1++"/><label>E、3001-5000元</label></p>
                <p><input type="radio" name="12answer" value="+2_3_1++"/><label>F、5001元以上</label></p>
            </div>

            <div id="question13" class="questiondiv  row required" value="+3++">
                <p class="questionTitle">13、请问您退休的平均收入总额每月大约是？（不包括自由交通工具的费用）（选修题，已退休者作答）</p>
                <hr/>
                <p><input type="radio" name="13answer" value="+1_1_5++"/><label>A、1000元以下</label></p>
                <p><input type="radio" name="13answer" value="+1_1_5++"/><label>B、1001-3000元</label></p>
                <p><input type="radio" name="13answer" value="+1_1_5++"/><label>C、3001-5000元</label></p>
                <p><input type="radio" name="13answer" value="+2_2_4++"/><label>D、5001-10000元</label></p>
                <p><input type="radio" name="13answer" value="+3_2_4++"/><label>E、10001-20000元</label></p>
                <p><input type="radio" name="13answer" value="+3_3_3++"/><label>F、20001-30000元</label></p>
                <p><input type="radio" name="13answer" value="+4_3_2++"/><label>G、30001元以上</label></p>
            </div>


            <div id="question14" class="questiondiv  row " value="+1++">
                <p class="questionTitle">14、请问您退休后的收入来源占比大约是？（选修题，已退休者作答）</p>
                <hr/>
                <p><input type="radio" name="14answer" value="+1_1_4++"/><label>A、退休工资</label></p>
                <p><input type="radio" name="14answer" value="+1_2_3++"/><label>B、返聘收入</label></p>
                <p><input type="radio" name="14answer" value="+1_1_4++"/><label>C、投资收入</label></p>
                <p><input type="radio" name="14answer" value="+1_1_5++"/><label>D、子女赡养费</label></p>
                <p><input type="radio" name="14answer" value="+1_1_4++"/><label>E、商业养老保险</label></p>
                <p><input type="radio" name="14answer" value="+1_1_1++"/><label>F、其他收入</label></p>
            </div>

            <div id="question15" class="questiondiv  row required" value="+5++">
                <p class="questionTitle">15、请问您的家庭负债总额是多少？</p>
                <hr/>
                <p><input type="radio" name="15answer" value="+5_3_1++"/><label>A、1万元以下</label></p>
                <p><input type="radio" name="15answer" value="+4_3_2++"/><label>B、1-5万元</label></p>
                <p><input type="radio" name="15answer" value="+3_3_3++"/><label>C、5-20万元元</label></p>
                <p><input type="radio" name="15answer" value="+2_3_4++"/><label>D、20-50万元</label></p>
                <p><input type="radio" name="15answer" value="+1_3_5++"/><label>E、50-300万元</label></p>
                <p><input type="radio" name="15answer" value="+1_3_5++"/><label>F、300万元以上</label></p>
            </div>

            <div id="question16" class="questiondiv row " value="+2++">
                <p class="questionTitle">16、请问您的家庭债务结构是怎样的？（多选题）</p>
                <hr/>
                <p><input type="checkbox" name="16answer" value="+2_3_1++"/><label>A、信用卡欠款</label></p>
                <p><input type="checkbox" name="16answer" value="+3_5_1++"/><label>B、银行消费贷款（汽车等）</label></p>
                <p><input type="checkbox" name="16answer" value="+3_5_3++"/><label>C、住房按揭贷款</label></p>
                <p><input type="checkbox" name="16answer" value="+1_2_5++"/><label>D、民间借款</label></p>
            </div>

            <div id="question17" class="questiondiv  row required" value="+6++">
                <p class="questionTitle">17、请问您的家庭目前可投资资产总量大约是？</p>
                <hr/>
                <p><input type="radio" name="17answer" value="+1_3_6++"/><label>A、1万元以下</label></p>
                <p><input type="radio" name="17answer" value="+2_3_5++"/><label>B、1-5万元</label></p>
                <p><input type="radio" name="17answer" value="+3_3_4++"/><label>C、5-20万元元</label></p>
                <p><input type="radio" name="17answer" value="+4_3_3++"/><label>D、20-50万元</label></p>
                <p><input type="radio" name="17answer" value="+5_3_2++"/><label>E、50-300万元</label></p>
                <p><input type="radio" name="17answer" value="+6_3_1++"/><label>F、300万元以上</label></p>
            </div>

            <div id="question18" class="questiondiv  row " value="++2+">
                <p class="questionTitle">18、请问您目前的资产配置情况（多选题）</p>
                <hr/>
                <p><input type="checkbox" name="18answer" value="++1_1_5+"/><label>A、现金、活期存款（本外币）</label></p>
                <p><input type="checkbox" name="18answer" value="++2_2_4+"/><label>B、固定收益类银行理财产品</label></p>
                <p><input type="checkbox" name="18answer" value="++3_3_3+"/><label>C、股权类银行理财产品</label></p>
                <p><input type="checkbox" name="18answer" value="++4_3_2+"/><label>D、中长期债券或债券型基金</label></p>
                <p><input type="checkbox" name="18answer" value="++5_1_1+"/><label>E、股票投资或股票型基金</label></p>
                <p><input type="checkbox" name="18answer" value="++4_3_2+"/><label>F、实业投资</label></p>
                <p><input type="checkbox" name="18answer" value="++3_3_3+"/><label>G、金融衍生品（期权、期货等）</label></p>
                <p><input type="checkbox" name="18answer" value="++3_3_3+"/><label>H、境外投资</label></p>
                <p><input type="checkbox" name="18answer" value="++2_3_4+"/><label>I、非自住的房地产投资</label></p>
                <p><input type="checkbox" name="18answer" value="++4_3_2+"/><label>J、其他实物类投资（贵金属、艺术收藏品、玉石、古董等）</label>
                </p>
            </div>

            <div id="question19" class="questiondiv  row required" value="++4+">
                <p class="questionTitle">19、请问您有多少年股票、基金、外汇、金融衍生品等风险投资产品的经验？</p>
                <hr/>
                <p><input type="radio" name="19answer" value="++1_1_5+"/><label>A、没有经验 </label></p>
                <p><input type="radio" name="19answer" value="++2_2_4+"/><label>B、少于2年</label></p>
                <p><input type="radio" name="19answer" value="++3_3_3+"/><label>C、2-5年</label></p>
                <p><input type="radio" name="19answer" value="++4_4_2+"/><label>D、5-8年</label></p>
                <p><input type="radio" name="19answer" value="++5_4_1+"/><label>E、8年以上</label></p>
            </div>

            <div id="question20" class="questiondiv  row required" value="++6+">
                <p class="questionTitle">20、以下哪项最符合您的投资态度？</p>
                <hr/>
                <p><input type="radio" name="20answer" value="++1_1_5+"/><label>A、风险厌恶、不希望本金损失、希望获得稳定回报 </label></p>
                <p><input type="radio" name="20answer" value="++2_4_4+"/><label>B、保守投资、不希望本金损失、愿意承担一定幅度的收益波动</label></p>
                <p><input type="radio" name="20answer" value="++4_5_2+"/><label>C、寻求资金的较高收益和成长性、愿意为此承担有限本金的损失</label>
                </p>
                <p><input type="radio" name="20answer" value="++5_1_1+"/><label>D、希望赚钱高回报、愿意为此承担较大本金损失</label></p>
            </div>

            <div id="question21" class="questiondiv  row " value="++2+">
                <p class="questionTitle">21、请问您的家庭理财目标是什么？（多选题）</p>
                <hr/>
                <p><input type="checkbox" name="21answer" value="++1_3_5+"/><label>A、对抗通货膨胀</label></p>
                <p><input type="checkbox" name="21answer" value="++5_3_1+"/><label>B、创造更多财富</label></p>
                <p><input type="checkbox" name="21answer" value="++3_5_2+"/><label>C、提高生活质量</label></p>
                <p><input type="checkbox" name="21answer" value="++3_5_2+"/><label>D、财富顺利传承</label></p>
                <p><input type="checkbox" name="21answer" value="++2_3_4+"/><label>E、税务合理规划</label></p>
                <p><input type="checkbox" name="21answer" value="++2_5_2+"/><label>F、保证财富安全</label></p>
                <p><input type="checkbox" name="21answer" value="++1_2_5+"/><label>G、安排子女教育</label></p>
                <p><input type="checkbox" name="21answer" value="++4_3_2+"/><label>H、个人事业发展</label></p>
            </div>

            <div id="question22" class="questiondiv  row " value="++6+">
                <p class="questionTitle">22、假设A、B、C三种投资，收益情况分别如下所述，请问您愿意选择哪种？</p>
                <hr/>
                <p><input type="radio" name="22answer" value="++1_2_5+"/><label>A、肯定会有1000元的收益，无任何风险 </label></p>
                <p><input type="radio" name="22answer" value="++2_5_2+"/><label>B、50%产生3500的收益，50%产生700元的损失</label></p>
                <p><input type="radio" name="22answer" value="++5_2_1+"/><label>C、50%产生6000元的收益，50%产生2000的损失</label></p>
            </div>

            <div id="question23" class="questiondiv  row required" value="++6+">
                <p class="questionTitle">23、下面的观点描述了投资1万美元于5种投资组合后可能的增值和损失概率，您会投资哪一种？</p>
                <hr/>
                <p><input type="radio" name="23answer" value="++1_2_5+"/><label>A、第一年投资组合价值可能达到10300美元，不会发生任何损失 </label>
                </p>
                <p><input type="radio" name="23answer"
                          value="++2_4_3+"/><label>B、第一年投资组合价值可能达到10600美元，八年中可能有一年发生损失</label></p>
                <p><input type="radio" name="23answer"
                          value="++3_6_3+"/><label>C、第一年投资组合价值可能达到10900美元，六年中可能有一年发生任何损失</label></p>
                <p><input type="radio" name="23answer"
                          value="++3_4_2+"/><label>D、第一年投资组合价值可能达到11100美元，五年中可能有一年发生任何损失</label></p>
                <p><input type="radio" name="23answer"
                          value="++5_2_1+"/><label>E、第一年投资组合价值可能达到11400美元，六年中可能有一年发生任何损失</label></p>
            </div>

            <div id="question24" class="questiondiv  row required" value="++6+">
                <p class="questionTitle">24、您的投资出现何种程度的波动时，您会呈现明显的焦虑？</p>
                <hr/>
                <p><input type="radio" name="24answer" value="++1_2_5+"/><label>A、本金无损失，但收益未达到预期 </label></p>
                <p><input type="radio" name="24answer" value="++2_3_4+"/><label>B、出现轻微本金损失</label></p>
                <p><input type="radio" name="24answer" value="++3_6_3+"/><label>C、本金10%以内的损失</label></p>
                <p><input type="radio" name="24answer" value="++4_3_2+"/><label>D、本金20%-50%的损失</label></p>
                <p><input type="radio" name="24answer" value="++5_2_1+"/><label>E、本金50%以上的损失</label></p>
            </div>

            <div id="question25" class="questiondiv  row required" value="+++2">
                <p class="questionTitle">25、请问市场中的各类理财产品能满足您的需求吗？</p>
                <hr/>
                <p><input type="radio" name="25answer" value="+++2_1_1_2"/><label>A、能 </label></p>
                <p><input type="radio" name="25answer" value="+++1_2_2_1"/><label>B、不能</label></p>
            </div>

            <div id="question26" name="questiondiv  row required" value="+++2">
                <p class="questionTitle">26、请问您知晓理财产品的投资或销售的渠道是？（多选题）</p>
                <hr/>
                <p><input type="checkbox" name="26answer" value="+++2_3_2_2"/><label>A、理财人员推荐 </label></p>
                <p><input type="checkbox" name="26answer" value="+++3_2_3_2"/><label>B、媒体介绍</label></p>
                <p><input type="checkbox" name="26answer" value="+++3_2_3_2"/><label>C、金融机构的纸质或网上的宣传资料</label></p>
                <p><input type="checkbox" name="26answer" value="+++2_3_2_3"/><label>D、亲朋好友推荐</label></p>
                <p><input type="checkbox" name="26answer" value="+++3_3_2_3"/><label>E、网络论坛、社会上的荐文</label></p>
                <p><input type="checkbox" name="26answer" value="+++1_1_1_1"/><label>F、其他渠道</label></p>
            </div>
            <div id="question27" name="questiondiv  row required" value="+++3">
                <p class="questionTitle">27、请问您期待得到什么样的理财产品？（多选题）</p>
                <hr/>
                <p><input type="checkbox" name="27answer" value="+++5_3_3_4"/><label>A、风险适中、可以促销增值的产品 </label></p>
                <p><input type="checkbox" name="27answer" value="+++2_4_5_2"/><label>B、高收益、赎回周期长的产品</label></p>
                <p><input type="checkbox" name="27answer" value="+++4_2_2_3"/><label>C、低收益、资金灵活赎回的产品</label></p>
                <p><input type="checkbox" name="27answer" value="+++2_4_5_3"/><label>D、优化境外资产配置的产品</label></p>
                <p><input type="checkbox" name="27answer" value="+++4_3_2_5"/><label>E、加强教育保障的理财产品</label></p>
                <p><input type="checkbox" name="27answer" value="+++4_3_3_5"/><label>F、加强退休保障的理财产品</label></p>
                <p><input type="checkbox" name="27answer" value="+++4_3_2_5"/><label>G、加强医疗保障的理财产品</label></p>
                <p><input type="checkbox" name="27answer" value="+++2_5_5_2"/><label>H、P2P（点对点）的产品（如人人赞）</label></p>
                <p><input type="checkbox" name="27answer" value="+++2_4_5_3"/><label>I、针对小企业的风投产品、小额贷款</label></p>
                <p><input type="checkbox" name="27answer" value="+++2_4_5_2"/><label>J、便携小企业贷款融资方式（如网贷通）</label></p>
                <p><input type="checkbox" name="27answer" value="+++2_4_3_2"/><label>K、标的物新颖产品（如艺术品、红酒理财等）</label></p>
                <p><input type="checkbox" name="27answer" value="+++1_1_1_1"/><label>L、其他理财产品</label></p>
            </div>
        </div>
        <div name="col-md-3">

        </div>

    </div>
    <div class="row " value="+++">
        <div class="col-md-3">

        </div>
        <div class="col-md-3">
            <p>
                <button type="button" id="questionSubmitButton" class="btn btn-default btn-lg btn-block">提交问卷</button>
            </p>
        </div>
        <div class="col-md-3">

        </div>
    </div>


</div>
<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp" %>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<script>
    $(function () {
        $("#protocolBackButton").on("click", function () {
            $("#pFinanace").load("pFinanceCustomerRead");
        });
        $("#protocolNextButton").on("click", function () {
            if ($("input:checkbox").is(":checked")) {
                $("#pFinanace").load("pFinancePurchaseConfirm", {
                    paramStr: localStorage.paramStr
                });
            } else {
                alert("请阅读协议内容!");
            }
        })
    });
</script>
<style>
    .header1 {
        font-size: 30px;
        margin-top: 30px;
    }

    .header2 {
        font-size: 20px;
        margin-top: 30px;

    }

    .customerReadContent {
        height: 200px;
        margin-top: 30px;
        overflow: auto;

    }
</style>
<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="row header1 text-center">
                PFinance理财产品客户协议书
            </div>
            <div class="row header2 text-center">
                尊敬的客户：为了保护您的合法权益，请您在投资理财产品前认真阅读以下内容
            </div>
            <div class="row text-center customerReadContent" style="text-indent: 2em;font-size: 15px;">
                <p>
                    （一）
                    甲方签署本协议后，即授权乙方在约定时间从约定交易账户扣划甲方本协议项下的理财款项，或进行币种转换与境外投资，无论甲方单笔投资金额较大还是购买的产品风险较高等任何情形，乙方在划款时均无须再通知甲方。
                </p>
                <p>
                    （二） 甲方有权依照销售文件约定获得投资收益，在产品投资期内，投资本金不另计存款利息。
                </p>
                <p>（三） 甲方须妥善保管本协议，如有遗失，可持有效证件到原经办机构办理补发手续。
                </p>
                <p>
                    （四） 甲方保证投资资金系其合法拥有，有权投资本理财产品，且投资本理财产品符合法律、法规、相关监管规定及公司章程的规定（包括但不限于任何反洗钱等规定）。
                </p>
                <p>（五）
                    甲方承诺所提供的所有资料真实有效，如有变更，甲方应及时到原经办机构办理变更手续。因甲方未及时办理变更手续而造成的损失，乙方不承担责任。协议履行过程中乙方需联系甲方时，将按照协议约定的联系方式联系甲方。
                </p>
                <p>
                    （六） 甲方承诺如果自身风险承受能力发生变化时，须主动向乙方申请重新评估，如因甲方未尽告知义务导致甲方风险承受能力和产品风险等级不匹配，乙方不承担责任。
                </p>
                <p> （七） 如因甲方原因导致投资本金不能从约定交易账户及时足额划转的，乙方不承担责任。
                </p>
                <p> （八） 甲方承诺在产品到期日前，除非按照产品说明书约定行权终止理财产品，否则不得要求乙方提前退还已扣划款项，且不得将约定交易账户销户。
                </p>
                <p> （九）
                    乙方将本金及收益划入约定交易账户后，即视为已向甲方完成支付义务。因约定交易账户冻结、挂失、换卡、销户、长期不动户等原因造成账户变更或异常，甲方应及时到原经办机构办理变更手续。如因甲方未及时办理变更手续而造成投资本金与收益无法入账以及由此产生的损失，乙方不承担责任。
                </p>
                <p> （十） 乙方有权向甲方收取理财产品的相关费用，具体收费项目、条件、标准和方式，在产品说明书中载明。
                </p>
                <p> （十一） 乙方不负责代扣代缴甲方应缴纳的税款，另有约定的除外。
                </p>
                <p> （十二） 甲方对销售文件负有保密义务。除法律法规另有规定或有权机关另有要求外，未经乙方书面许可，甲方不得向任何组织、个人提供或泄露与乙方有关的业务资料及信息。
                </p>
                <p> （十三）
                    本协议记载的交易金额是甲方首次认购/申购时的金额，如果本产品具有追加认购、申购、赎回等可能引起交易资金变化的功能，且甲方办理过上述交易，则甲方持有金额应以乙方系统记录为准。甲方不得以本协议记载的交易金额向乙方提出赎回、偿还等要求，而必须以乙方系统记载金额提出赎回、偿还等要求。
                </p>
                <p> （十四） 通过其他渠道（包括但不限于网上银行等）购买理财产品须遵从乙方相关规定。
                </p>
                <p> （十五） 如因甲方的原因，导致乙方对其他第三方承担赔偿责任，甲方承诺对乙方承担相应的赔偿责任。
                </p>
                <p> （十六）
                    如果发生本理财产品基础资产项下义务人未按时足额付款等情形，甲方同意，乙方有权向上述义务人进行追索，追索期间所发生的费用（包括但不限于诉讼费、仲裁费、律师费等全部费用）将从追索回来的款项中优先扣除。
                </p>
            </div>
            <div class="row sectionDiv" style="font-size: 15px;">
                <div class="checkbox">
                    <label>
                        <input type="checkbox">
                        <p>我已认真阅读《PFinance理财产品客户协议书》，并同意遵守须知的约定</p>
                    </label>
                </div>
            </div>
            <div class="row sectionDiv" style="margin-bottom: 100px;">
                <div class="col-md-4">

                </div>
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-6">
                            <button type="button" class="btn btn-primary btn-lg " id="protocolBackButton">返回上一步
                            </button>
                        </div>
                        <div class="col-md-6">
                            <button type="button" class="btn btn-primary btn-lg" id="protocolNextButton">下一步
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                </div>
            </div>
        </div>
    </div>


</div>


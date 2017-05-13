<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp" %>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<script>
    $(function () {
        $("#myBoxButton").on("click", function () {
            $("#comment").load("myComments");
        });
    })
</script>
<style>

</style>

<div class="container">
    <div class="row col-md-8 col-md-offset-2">


        <div class="row sectionDiv">
            <div class="col-md-2"></div>
            <div class="col-md-8 text-center header2">
                您的声音，成就更好的PFinance
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-primary btn-sm" id="myBoxButton">我的信箱</button>
            </div>
        </div>
        <div class="row sectionDiv welcome header3">
            尊敬的用户，您好~！为了更好地了解您的需求，倾听您的想法和建议，PFinance反馈小站功能正式上线啦~！在这里，您可以将您的想法、建议、吐槽、投诉和赞美发送给我们~我们会尽快回复您！谢谢您对PFinance个性化银行理财平台的支持，您的声音，成就更好的我们！谢谢！
        </div>
        <div class="row">
            <form role="form">
                <div class="form-group">
                    <label for="name">标题</label>
                    <input type="text" class="form-control" id="name" placeholder="请输入标题">
                </div>
                <div class="form-group">
                    <label>反馈内容输入</label>
                    <textarea class="form-control" rows="23"></textarea>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox1" value="option1">建议
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox2" value="option2">投诉
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox3" value="option3">评论
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox4" value="option3">咨询
                        </label>
                    </div>
                    <div class="col-md-4 text-right">
                        <button type="submit" class="btn btn-default">提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>


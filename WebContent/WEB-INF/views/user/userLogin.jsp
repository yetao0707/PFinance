<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../taglib.jsp" %>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>详情</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<script>
    $(function () {
        $(".btn.btn-default").on('click', function (e) {
            $.ajax({
                type: "POST",
                url: "login",
                data: {
                    userName: $("#userName").val(),
                    password: $("#password").val()
                },
                dataType: "json",
                success: function (result) {
                    if (result.code == 100) {
                        alert("登录成功");
                        window.location.href="indexPage";
                    } else {
                        alert(result.errMsg);
                    }
                }
            });
            return false;
        });
    });
</script>

<div class="container">
    <div class="row" style="height: 300px;"></div>
    <div class="row">
        <div class="col-md-8">
            <img src="<%=basePath%>images/gaosane.ejpeg" alt="" style="width: inherit"/>
        </div>
        <div class="col-md-4">
            <form role="form">
                <div class="form-group">
                    <label for="userName">用户名</label>
                    <input type="text" class="form-control" id="userName" placeholder="请输入用户名">
                </div>
                <div class="form-group">
                    <label for="password">密码</label>
                    <input type="password" class="form-control" id="password" placeholder="请输入密码">
                </div>
                <button type="submit" class="btn btn-default">提交</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>

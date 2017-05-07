<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../taglib.jsp"%>
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

<div class="container">
    <div class="row">
        <div class="col-md-4">
            <p class="text-right">预投资总额（元）：</p>
        </div>
        <div class="col-md-4">
            <p >    <input type="text" class="form-control" id="name" placeholder="请输入金额">
            </p>
        </div>
        <div class="col-md-4">
            <p >  <button type="button" class="btn btn-primary btn-sm">确定</button>
            </p>
        </div>

    </div>
    <div class="row">
        <div class="row">
            <table class="table">
                <caption>推荐理财组合</caption>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>推荐产品名称</th>
                    <th>产品类型</th>
                    <th>年化收益率（%）</th>
                    <th>购买金额（元）</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Tanmay</td>
                    <td>Bangalore</td>
                    <td>Bangalore</td>
                    <td>Bangalore</td>
                    <td>Bangalore</td>
                </tr>
                <tr>
                    <td>Sachin</td>
                    <td>Mumbai</td>
                    <td>Mumbai</td>
                    <td>Mumbai</td>
                    <td>Mumbai</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="row">
            <table class="table">
                <caption>预计理财收益（元）</caption>
                <thead>
                <tr>
                    <th></th>
                    <th>总收入</th>
                    <th>总收益</th>
                    <th>股票型基金</th>
                    <th>债券型基金</th>
                    <th>货币型产品</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>乐观估计</td>
                    <td>Bangalore</td>
                    <td>Bangalore</td>
                    <td>Bangalore</td>
                    <td>Bangalore</td>
                    <td>Bangalore</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <p>图待做</p>
    </div>
    <div class="row">
        <table class="table">
            <caption>预计理财收益（元）</caption>
            <thead>
            <tr>
                <th>产品</th>
                <th>购买金额</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>产品名称</td>
                <td><input type="text" value=""/></td>
            </tr>
            </tbody>
        </table>
    </div>

</div>

</body>
</html>

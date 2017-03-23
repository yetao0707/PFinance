<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
 <script type="text/javascript" src="<%=basePath%>resources/js/ajaxfileupload.js" ></script>
    <script type="text/javascript">
    $(function(){
       //上传图片
       $("#btnUpload").click(function() {
               ajaxFileUpload();
       });
    });
    function ajaxFileUpload() {
        // 开始上传文件时显示一个图片
        $("#wait_loading").ajaxStart(function() {
            $(this).show();
        // 文件上传完成将图片隐藏起来
        }).ajaxComplete(function() {
            $(this).hide();
        });
        var elementIds=["flag"]; //flag为id、name属性名
        $.ajaxFileUpload({
            url: 'saveUser', 
            type: 'post',
            secureuri: false, //一般设置为false
            fileElementId: 'file', // 上传文件的id、name属性名
            dataType: 'text', //返回值类型，一般设置为json、application/json
            elementIds: elementIds, //传递参数到服务器
            success: function(data, status){  
                alert(data);
            },
            error: function(data, status, e){ 
                alert(e);
            }
        });
        //return false;
    }
    </script>
  </head>
  
  <body>
    <div id="wait_loading" style="padding: 50px 0 0 0;display:none;">
        <div style="width: 103px;margin: 0 auto;"><img src="<%=path %>/images/loading.gif"/></div>
        <br></br>
        <div style="width: 103px;margin: 0 auto;"><span>请稍等...</span></div>
        <br></br>
    </div>
    <input type="file" id="file" name="file"><br/>
    <input type="hidden" id="flag" name="flag" value="ajax文件上传"/>
    <input type="button" id="btnUpload" value="上传图片" />
  </body>
</html>
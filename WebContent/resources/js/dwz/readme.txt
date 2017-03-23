dwz框架修改列表
------------
dwz.ui.js：
initLayout()方法修改去掉版权信息后的布局大小，原代码被注释以便留下修改标记，具体参见注释。
navTab弹出信息由error形式改为info弹出层
alertMsg.error($this.attr("warn") || DWZ.msg("alertSelectMsg"));
dialog弹出信息由error形式改为info弹出层
alertMsg.error($this.attr("warn") || DWZ.msg("alertSelectMsg"));
invalidHandler方法注释即表单校验时不弹出提示框


------------
dwz.dialog.js:
maxsize:function(dialog)方法休息去掉版权信息后不布局大小，原代码被注释以便留下修改标记，具体参见注释。

------------
dwz.ajax.js
ajaxTodo弹出信息由error形式改为info弹出层

------------
dwz.alertMsg.ja
修改alert弹出层位置
修改关闭alert弹出层飞出窗口动画

------------
dwz.database.js
selectTodo弹出信息由error形式改为info弹出层

------------
dwz.cord.js
增加dwz警告响应编码(260)处理,弹出info提示信息

------------
dwz.validate.method.js
增加特殊字符校验规则

------------
dwz.regional.zh.js
增加特殊字符校验提示

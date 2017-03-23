/**
 * 关闭顶层模态dialog
 */
function closeTopDialog(){
	$.pdialog.closeCurrent();
	$("#dialogBackground").show();
}

/**
 * 自定义回调刷新dialog函数
 * @param json
 */
function dialogAjaxForward(json){
	DWZ.ajaxDone(json);
	if (json.statusCode == DWZ.statusCode.ok){
		if (json.forwardUrl){
			$.pdialog.reload(json.forwardUrl, {});
		}
	}
}
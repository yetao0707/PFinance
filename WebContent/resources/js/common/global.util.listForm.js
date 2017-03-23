// 获取根路径
function getRootPath() {
	var curWwwPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	var localhostPath = curWwwPath.substring(0, pos);
	var projectName = pathName
			.substring(0, pathName.substr(1).indexOf('/') + 1);
	return (localhostPath + projectName);
}
// 清空检索数据
function clearData() {
	// 清楚文本框
	$('input[type=text]').each(function() {
		$(this).val("");
	});
	// 清楚下拉框
	$('select').each(function() {
		$(this).val("");
	});
}

// 是否选择多选框([checkBoxNameList]：checkbox名称,[option]：only代表只能选择一项；more代表可选择多项

var value = '';
function isSelectCheckBox(checkBoxNameList, option) {

	var id = 0;
	value = ''; // 避免多个列表同时打开
	var $unitBox = $("#" + checkBoxNameList);
	$unitBox.find("[name='ids']").filter(":checked").each(function(i) {
		id++;
		var _args =$(this).val();
		value = value + _args + "_";
	});
	// 提示信息
	if (id == 0) {
		alertMsg.info(I18N.common.noSelectedItemDialog);
		return false;// 未选择记录
	}
	// 是否只选择一项
	if (option == 'only') {
		if (id != 1) {
			alertMsg.info(I18N.common.moreSelectedItemsDialog);
			return false;
		}
		$unitBox.find("[name='ids']").filter(":checked").each(function(i) {
			value =$(this).val();
		});
	}
	return true;
}

// 返回选择的Id
function getSelectCheckBoxValue() {
	return value;
}

// 文本域带回信息
function common_textarea(item) {
	var $this = $(item);
	var url = $this.attr('lookupUrl') + "?nameField=" + $this.attr('nameField') + "&content="
	+ encodeURI(encodeURI($($this).prevAll("textarea").val()));
	item.href=url;
}


// 比较开始日期不能大于结束日期
function compare(){
	var startDateText = "";
	var endDateText = "";
	$(".date,input[group*='group1']").each(function(i){//找到class 为date 且分组为group1的值
		if(i == 0){
			startDateText = $(this).val();
		}
		if(i == 1){
			endDateText = $(this).val();
		}
	});
	if(startDateText != "" && endDateText != ""){
 		var aStart=startDateText.split('-'); //转成成数组，分别为年，月，日，下同
	    var aEnd=endDateText.split('-');
	    var startDate = aStart[0]+"/" + aStart[1]+ "/" + aStart[2];
	    var endDate = aEnd[0] + "/" + aEnd[1] + "/" + aEnd[2];
	    if (startDate > endDate) {
	    	alertMsg.info(I18N.common.errorMsgDate);
	    	return false;
	   	}
 	}
}

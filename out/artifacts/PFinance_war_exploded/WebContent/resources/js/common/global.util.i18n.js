function getDwzContext(locale){
	var dwzFrag = "dwz.frag.xml";
	if(locale=='zh_CN'){
		dwzFrag = "dwz.frag.zh_CN.xml";
	}
	return dwzFrag;
};
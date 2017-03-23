 // add attachment
	var indexForI = 0;

   function AddFiletoSelect(aoFile, afile, aclass){
		var form = document.forms[0];
	   //var form=$("#noticeForm");
//		alert(aoFile.value);
  		if ((aoFile==null)||(aoFile.value=="")) return;
  		
  		var loOpts = $("#SelectFile").get(0).options;
  		var path=aoFile.value;
  		var fileName=path.substring(path.lastIndexOf("\\")+1);
 			if(path.indexOf("/")>0){
  			fileName=path.substring(path.lastIndexOf("/"));
 			}
 			if(path.indexOf("\\")>0){
  			fileName=path.substring(path.lastIndexOf("\\")+1);
 			}
// 		alert(fileName);
 		
//		loOpts[loOpts.length] = new Option(fileName,aoFile.uniqueID);
//		alert(aoFile.uniqueID);
		loOpts[loOpts.length] = new Option(fileName,indexForI);
//		alert("尝试！");
//		alert(loOpts[0].text);
//		alert(loOpts[0].val());
//		alert(indexForI);
		//alert(aoFile.parentNode.id);
		aoFile.parentNode.style.display = "none";
		aoFile.parentNode.id="sp"+indexForI;
		indexForI = indexForI+1;
		//alert(indexForI);
		var loObj = document.createElement("span");
		//alert(indexForI+1);
		loObj.innerHTML = '<input id="'+indexForI+'"  name="' + afile + '" class="'+aclass+'" type="file" style=\"border:0px;background: transparent;margin-top: 2px;width:65px\" onChange="AddFiletoSelect(this,\''+afile+'\',\''+aclass+'\')">';
		//alert(indexForI+2);
		document.getElementById('AffixFile').appendChild(loObj);
		//$('#AffixFile').insertBefore(loObj);
		//alert(indexForI+3);
	}
	
	// add attachment index
	function AddFiletoSelectArray(aoFile, afile,index){
		var form = document.forms[0];
		//var form=$("#noticeForm");
  		if ((aoFile==null)||(aoFile.value=="")) return;
  		var SelectFileId = 'SelectFile_'+index;
  		var AffixFileId = 'AffixFile'+index;
  		
  		var loOpts = $("#SelectFile").get(0).options;
  		var path=aoFile.value;
  		var fileName=path.substring(path.lastIndexOf("\\")+1);
 			if(path.indexOf("/")>0){
  			fileName=path.substring(path.lastIndexOf("/"));
 			}
 			if(path.indexOf("\\")>0){
  			fileName=path.substring(path.lastIndexOf("\\")+1);
  		}
		loOpts[loOpts.length] = new Option(fileName);
		
		aoFile.parentNode.style.display = "none";
		var loObj = $("<span></span>");
		loObj.innerHTML = '<input  name="' + afile + '" type="file" style=\"border:0px;background: transparent;margin-top: 2px;width:65px\"  onpropertychange="AddFiletoSelectArray(this,\''+afile+'\',\''+index+'\')">';
		document.getElementById('AffixFile').appendChild(loObj);
		//AffixFile[index].insertBefore(loObj);
	}
	
	// del attachment 
	function DelFiletoSelect(){
		var form = document.forms[0];
		//var form=$("#noticeForm");
		
		
		
		var op = $("select[name=filename]").find("option:selected");
//		alert("1");
//		alert($("select[name=filename]").attr("name"));
//		alert(op.text());
//		alert("2");
//		alert(op.val());
		var name ="sp" + op.val();
//		alert(name);
//		alert("获取spans");
		var spans= $("#AffixFile").get(0).childNodes;
//		alert(spans.length);
		if(spans!=null && spans.length>0){
			for(i=0;i<spans.length;i++){
//				alert(spans[i].id);
//				alert(spans[i].name);
				if(spans[i].id== name){
//					alert(spans[i].id);
//					alert("准备删除");
					spans[i].parentNode.removeChild(spans[i]);
//					alert("OK");
					break;
				}
			}
			
		}

//		alert("获取options");
		var loOpts = $("#SelectFile").get(0).options;

		if(loOpts!=null&&loOpts.length>0){
			
			for(j=0;j<loOpts.length;j++){
				
				if(loOpts[j].text == op.text()){
					//alert("select长度"+loOpts.length);
					loOpts.remove(j);
					//alert("select长度"+loOpts.length);
					break;
				}
			}
				
		}
		
	}
	
	// del attachment index
	function DelFiletoSelectArray(index){
		var form = document.forms[0];
		//var form=$("#noticeForm");
		loEL = $("#SelectFile option:selected");
		if (loEL!=null){
				loEL = loEL.parentNode;
				AffixFile[index].removeChild(loEL);
		}
		var loOpts = form.SelectFile[index].options;
		if(loOpts!=null&&loOpts.length>0){
				loSel = loOpts[form.SelectFile[index].selectedIndex]
				loOpts.removeChild(loSel);
		}
	}
	//判断照片大小 
	function getPhotoSize(obj){ 
	    photoExt=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名 
	    if(photoExt!='.jpg'&&photoExt!='.bmp'&&photoExt!='.gif'&&photoExt!='.png'){
	    	if(obj.value != null){
		    	alertMsg.info("请按照规则上传照片!"); 
	    	}
	    	var file = $("#"+obj.id);
	    	  file.after(file.clone().val(""));  
	    	  file.remove();

	        return false; 
	    } 
	    //AddFiletoSelect(obj, 'uploadFiles',  'Content_input_style3');
	    /*var fileSize = 0; 
	    var isIE = /msie/i.test(navigator.userAgent) && !window.opera;             
	    if (isIE && !obj.files) {           
	         var filePath = obj.value;  
	         alert(123);
	         var fileSystem = new ActiveXObject("Scripting.FileSystemObject");    
	         alert(321);
	         var file = fileSystem.GetFile (filePath);                
	         fileSize = file.Size;          
	    }else {   
	         fileSize = obj.files[0].size;      
	    }  
	    fileSize=Math.round(fileSize/1024*100)/100; //单位为KB 
	    if(fileSize>=1024){ 
	        alertMsg.info("照片最大尺寸为1024KB，请重新上传!"); 
	    	var file = $("#"+obj.id);
	    	  file.after(file.clone().val(""));  
	    	  file.remove();
	        return false; 
	    } */
	} 

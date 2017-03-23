$(document).ready(function(){
	$(".button").click(function(){
		var a=$(this).val();
		$("iframe").attr("src","showUser?name="+a);
	});

});
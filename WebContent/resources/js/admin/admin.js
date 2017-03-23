$(document).ready(function() {

	$("#system").click(function(){
		$(window.parent.document).find("#loadpage").attr("src","admin/getSystemPage");
	});
	$("#userManager").click(function(){
		$(window.parent.document).find("#loadpage").attr("src","admin/userManager");
	});
	$("#departmentManager").click(function(){
		$(window.parent.document).find("#loadpage").attr("src","admin/departmentManager");
	});
	$("#evalutionerManager").click(function(){
		$(window.parent.document).find("#loadpage").attr("src","admin/evalutionerManager");
	});
	$("#team").click(function(){
		$(window.parent.document).find("#loadpage").attr("src","admin/getTeam");
	});
	$("#departmentNum").click(function(){
		$(window.parent.document).find("#loadpage").attr("src","admin/departmentNum");
	});
	$("#vote1").click(function(){
		$(window.parent.document).find("#loadpage").attr("src","admin/voteManager");
	});
	$("#vote2").click(function(){
		$(window.parent.document).find("#loadpage").attr("src","admin/getFinalUser");
	});
});
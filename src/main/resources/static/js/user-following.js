/*
* @Author: joesn
* @Date:   2017-12-22 11:41:27
* @Last Modified by:   joesn
* @Last Modified time: 2017-12-22 11:41:50
*/
$(function(){
	$(".user").bind('mouseover',function(){
		$(this).addClass('open');
	});
	$(".user").bind('mouseout',function(){
		$(this).removeClass('open');
	});
});
// 切换攻略菜单
var changeArticle = function(target){
	var liArray = $(".trigger-menu").children('li');
	$.each(liArray, function(index, val) {
		 $(val).removeClass('active');
	});
	$(target).addClass('active');
	var index = $(target).attr("index");
	console.log(index);
	if(index=="0")
		loadFollower();
	else
		loadFans();
		
};

var loadFollower = function(){
	var fristNum = 0;
	var lastNum = 10;
	var data = '{"fristNum":"'+fristNum+',"lastNum":"'+lastNum+'"}';
	$.ajax({
		url: '/user/getFollow',
		type: 'post',
		dataType: 'json',
		data: data,
	})
	.done(function(result) {
		console.log("success");
		$(".user-list").empty();
		var myTemp = $.templates("#like");
		var html = myTemp.render(result);
		$(".user-list").append(html);
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
};

var loadFans = function(){
	var fristNum = 0;
	var lastNum = 10;
	var data = '{"fristNum":"'+fristNum+',"lastNum":"'+lastNum+'"}';
	$.ajax({
		url: '/user/getFans',
		type: 'post',
		dataType: 'json',
		data: data,
	})
	.done(function(result) {
		console.log("success");
		$(".user-list").empty();
		var myTemp = $.templates("#fans");
		var html = myTemp.render(result);
		$(".user-list").append(html);
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
};

var addFollow = function(target,fanId){
	var url = "/user/addFan/"+fanId;
	$.ajax({
		url: url,
		type: 'post',
		dataType: 'json'
	})
	.done(function(result) {
		console.log("success");
		$(target).removeClass("btn-success follow");
		$(target).addClass("btn-default following");
		var i = $(target).children("i");
		i.removeClass("fa-plus");
		i.addClass("fa-check");
		$(target).children("span").text("已关注");
		$(target).attr("onclick","cancelFollow(this,"+fanId+")");
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
};

var cancelFollow = function(target,fanId){
	var url = "/user/cancelFollow/"+fanId;
	$.ajax({
		url: url,
		type: 'post',
		dataType: 'json'
	})
	.done(function(result) {
		console.log("success");
		$(target).removeClass("btn-success follow");
		$(target).addClass("btn-default following");
		var i = $(target).children("i");
		i.removeClass("fa-plus");
		i.addClass("fa-check");
		$(target).children("span").text("关注");
		$(target).attr("onclick","addFollow(this,"+fanId+")");
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
};
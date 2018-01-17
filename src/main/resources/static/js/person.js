/*
* @Author: joesn
* @Date:   2017-12-20 18:24:33
* @Last Modified by:   joesn
* @Last Modified time: 2017-12-20 18:33:16
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
	loadArticle();
};

var loadArticle = function(){
	var fristNum = 0;
	var lastNum = 10;
	var data = jQuery.parseJSON('{"fristNum":"'+fristNum+'","lastNum":"'+lastNum+'"}');
	$.ajax({
		url: '/user/getArticle',
		type: 'post',
		dataType: 'json',
		data: data,
	})
	.done(function(result) {
		console.log("success");
		var myTemp = $.templates("#article");
		var html = myTemp.render(result);
		$(".note-list").append(html);
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
		var myTemp = $.templates("#article");
		var html = myTemp.render(result);
		$(".note-list").append(html);
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
};
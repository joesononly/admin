/*
* @Author: joesn
* @Date:   2017-12-18 21:26:13
* @Last Modified by:   joesn
* @Last Modified time: 2017-12-18 22:11:53
*/
$(function(){
//	$("#targetEdit")[0].contentWindow.reload(1);
});

var changeActive = function(target){
	var childrens = $(target).parent("ul").children('li');
	$.each(childrens, function(index, val) {
		 if($(val).hasClass("article-active")){
			 $(val).removeClass('article-active');
			 $(val).children("div").remove();
			 $(val).attr("onclick","changeActive(this)");
			 return false;
		}
	});

	var tmpl = $.templates("#myTemplate");
	var html = tmpl.render();
	// console.log(html);
	$(target).append(html);
	$(target).addClass('article-active');
	$(target).attr("onclick","");
//	alert($(target).attr("value"));
	console.log($("#targetEdit"));
	$("#targetEdit")[0].contentWindow.reload($(target).attr("value"));
	// console.log($("#targetEdit")[0].contentWindow);
	 // $(window.parent.document).contents().find("#targetEdit")[0].contentWindow.upload()
};

var reflashBeforeCreate = function(target,number){
	var childrens = $(target).parent("ul").children('li');
	$.each(childrens, function(index, val) {
		 if($(val).hasClass("article-active")){
			 $(val).removeClass('article-active');
			 $(val).children("div").remove();
			 $(val).attr("onclick","changeActive(this)");
			 return false;
		}
	});

	var tmpl = $.templates("#myTemplate");
	var html = tmpl.render();
	// console.log(html);
	$(target).append(html);
	$(target).addClass('article-active');
	$(target).attr("onclick","");
	$("#targetEdit")[0].contentWindow.reload(number);
};

var createArticle = function(){
	var childrens = $(".article-list-ul").children('li');
	$.each(childrens, function(index, val) {
		 if($(val).hasClass("article-active")){
			 $(val).removeClass('article-active');
			 $(val).children("div").remove();
			 $(val).attr("onclick","changeActive(this)");
			 return false;
		}
	});
	$.ajax({
		url: '/edit/addArticle',
		type: 'get',
		dataType: 'json'
	})
	.done(function(result) {
//		console.log(result);
		var tmpl = $.templates("#article");
		var html = tmpl.render(result);
		$(".article-list-ul li:first").before(html);
		reflashBeforeCreate(html,result.id);
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
	
};
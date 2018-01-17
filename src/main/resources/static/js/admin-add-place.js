/*
* @Author: joesn
* @Date:   2018-01-08 14:17:02
* @Last Modified by:   joesn
* @Last Modified time: 2018-01-08 14:26:56
*/
$(function(){
	//设置瀑布流排版
	$('.show-image').masonry({
        itemSelector: '.show-item',
    });
	$("input[name='image']").bind("change",function(){
		uploadImage();
	});
});

var uploadImage = function(){
//	var targetTimer =setInterval(getProgress,100);
	 // 上传设置  
    var options = {
        // 规定把请求发送到那个URL  
        url: "/admin/place/upload",
        // 请求方式  
        type: "post",
        // 服务器响应的数据类型  
        // 请求成功时执行的回调函数  
        dataType: "json",
        success: function(data) {
            console.log(data);
//            clearInterval(targetTimer);
        }
        
    };
    $("#uploadImage").ajaxSubmit(options);
};

var getProgress = function(){
	$.ajax({
		url: '/admin/place/getProgress',
		type: 'post',
		dataType: 'json'
	})
	.done(function(result) {
		console.log(result);
		var template = $.templates("#progress");
		if($("#progressShow"+result.pItems)[0]){
			$("#progressShow"+result.pItems).css({
				width:((result.pBytesRead/result.pContentLength)*100)+"%"
			});
		}else{
			console.log(result);
			var html = template.render(result);
			$("#progressBox").append(html);
		}
		
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
};
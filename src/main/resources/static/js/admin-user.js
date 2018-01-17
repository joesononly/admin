/*
* @Author: joesn
* @Date:   2018-01-08 09:35:35
* @Last Modified by:   joesn
* @Last Modified time: 2018-01-08 09:36:21
*/
var pageSize = 5;
$(function(){
	init(1,pageSize);
	 
});

var init = function(pageIndex,pageSize){
	$.ajax({
		url: '/admin/user/get/list',
		type: 'post',
		dataType: 'json',
		data: {"pageIndex": pageIndex,"pageSize":pageSize},
	})
	.done(function(result) {
		console.log("success");
		resetData(result.dataList);
		setpage(result);
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});

};

var resetData = function(result){
	var tmpl  = $.templates("#userListItem");
	var html = tmpl.render(result);
	$("#userList").empty();
	$("#userList").append(html);
};

var getUserData = function(pageIndex,pageSize){
	$.ajax({
		url: '/admin/user/get/list',
		type: 'post',
		dataType: 'json',
		data: {"pageIndex": pageIndex,"pageSize":pageSize},
	})
	.done(function(result) {
		console.log("success");
		resetData(result.dataList);
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
};

var setpage = function(result){
	window.pagObj = $('#pagination').twbsPagination({
        totalPages: result.total,
        visiblePages: pageSize,
        first:"首页",
        prev:"上一页",
        next:"下一页",
        last:"最后一页",
        onPageClick: function (event, page) {
        	getUserData(page,pageSize);
            console.info(page + ' (from options)');
        }
    }).on('page', function (event, page) {
        console.info(page + ' (from event listening)');
    });
};

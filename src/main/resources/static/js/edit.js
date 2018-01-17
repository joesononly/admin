

$(function() { 
	initEdit();
}); 

var initEdit = function(){
	var maxHeight = $(document).height();
	console.log(maxHeight);
//	maxHeight = 200;
	maxHeight = maxHeight-200;
    $('div#target').on('froalaEditor.image.removed', function (e, editor, $img) {
    	var imgName = getImageName($img);
    	deleteImage(imgName);
    }).froalaEditor({
    	imageUploadURL: "/edit/upload",
    	heightMax:maxHeight,
    	height: maxHeight
    });
};

var upload = function(id){
	var title = $("input[name='title']").val();
	var html = $('div#target').froalaEditor('html.get', true);
//	console.log(html);
	html = html.replace(/\"/g,"'");
	var str = '{"title":"'+title+'","content":"'+html+'","id":"'+id+'"}';
	var data = jQuery.parseJSON(str);
	console.log(data);
//	return;
	$.ajax({
		url: '/edit/saveArticle',
		type: 'post',
		dataType: 'json',
		data:data
	})
	.done(function(result) {
		window.location = result;
		console.log(result);
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
	
};

var createArticle = function(){
	
};

var deleteImage = function(fileName){
	$.ajax({
		url: '/edit/delete/'+fileName,
		type: 'get',
		dataType: 'json',
	})
	.done(function() {
		console.log("success");
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
};

var getImageName = function($img){
	var imgSrc = $img[0].src;
	var imgName = imgSrc.substring(imgSrc.lastIndexOf('/') + 1);
	return imgName;
};

var reload = function(id){
	$("#report").attr("onclick","upload("+id+")");
 	$.ajax({
 		url: '/edit/get',
 		type: 'post',
 		dataType: 'json',
 		data: {id: id},
 	})
 	.done(function(data) {
 		console.log(data);
 		$("input[name='title']").val(data.title);
 		$('div#target').froalaEditor('destroy');
// 		console.log(data.content);
 		$('div#target').html("");
 		$('div#target').html(data.content);
 		initEdit();
 	})
 	.fail(function() {
 		console.log("error");
 		$("input[name='title']").val("");
 		$('div#target').html("");
 		$('div#target').froalaEditor('destroy');
 		initEdit();
 	})
 	.always(function() {
 		console.log("complete");
 	});
 	
 };
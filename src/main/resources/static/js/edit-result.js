/*
 * @Author: joesn
 * @Date:   2017-12-29 18:57:49
 * @Last Modified by:   joesn
 * @Last Modified time: 2017-12-29 23:42:31
 */
// 标题
var imagePath;

$.fn.serializeObject = function()
{
  var o = {};
  var a = this.serializeArray();
  $.each(a, function() {
    if (o[this.name]) {
      if (!o[this.name].push) {
        o[this.name] = [o[this.name]];
      }
      o[this.name].push(this.value || '');
    } else {
      o[this.name] = this.value || '';
    }
  });
  return o;
};

$(function() {
    var w = $("#j-active-img").width();
    console.log(w);
    $("#j-active-img").height(w);
    
    var boxWidth = $("#j-box").width();
    $("#j-box").height(boxWidth*(4/15));

     $("#fileName").bind('click', function(event) {
    	 $("#targetImage").trigger('click');
     });

    $("#j-box").bind('click', function(event) {
        /* Act on the event */
        $('#show').modal('show');
        $("#images").height(500);
    });
    
    $("#finishUpload").bind('click',function(){
    	uploadPic();
    });
    
    $("#j-report").bind('click',function(){
    	finalUpload();
    });
    
    $("#country").bind('change',function(){
    	changeCountry();
    });
    
    $("#province").bind('change',function(){
    	changeProvince();
    });
    
    fileInit();

});

var uploadImage = function() {
    // $("#pic").trigger('click');
	$('#j-article-img').Jcrop({
        minSize: [100, 100],
        maxSize: [100, 100],
        onChange: selectEvent()
    });

};

var selectEvent = function(target) {
    console.log(target);
};

var uploadPic = function() {

    // 上传设置  
    var options = {
        // 规定把请求发送到那个URL  
        url: "/edit/uploadCover",
        // 请求方式  
        type: "post",
        // 服务器响应的数据类型  
        // 请求成功时执行的回调函数  
        dataType: "json",
        success: function(data) {
            console.log(data.link);
            // 图片显示地址  
            $("#j-article-img").attr("src", data.link);

            imagePath = data.link;
            $('#show').modal('hide');
        }
    };

    $("#jvForm").ajaxSubmit(options);
};

var fileInit = function() {
    $("#targetImage").bind('change', function(event) {
        $("#j-upload-image-box").empty();
        $("#j-upload-image-box").append('<img src="" id="images">');
        var objUrl = getObjectURL(this.files[0]);
        console.log(this.files);
        if (objUrl) {
            $("#fileName").text(this.files[0].name);
            $("#images").attr("src", objUrl);
            $("#images").Jcrop({
                aspectRatio: 11 / 4,
                onSelect: function(e) {
                	$("input[name='rWidth']").val(parseInt($("#images").width()));
                	$("input[name='rHeight']").val(parseInt($("#images").height()));
                    $("input[name='x']").val(parseInt(e.x));
                    $("input[name='y']").val(parseInt(e.y));
                    $("input[name='width']").val(parseInt(e.w));
                    $("input[name='height']").val(parseInt(e.h));
                }
            });
        }
    });
};

function getObjectURL(file) {
    var url = null;
    if (window.createObjectURL != undefined) { // basic
        url = window.createObjectURL(file);
    } else if (window.URL != undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file);
    } else if (window.webkitURL != undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file);
    }
    return url;
};

var finalUpload = function(){
	var gistFormJson = $("#gistForm").serializeObject();
	console.log(gistFormJson);
//	return;
//	var data = jQuery.parseJSON(gistFormJson);
//	console.log(data);
//	return;
	$.ajax({
		url: '/edit/report',
		type: 'post',
		dataType: 'json',
		data:gistFormJson
	})
	.done(function(result) {
		//window.location = result.link;
		console.log(result);
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
};

var changeCountry = function(){
	
	var chooseVal = $("#country").val();
	var data = jQuery.parseJSON('{"countryId":"'+chooseVal+'"}');
	$.ajax({
		url: '/area/getProvinces',
		type: 'post',
		dataType: 'json',
		data:data
	})
	.done(function(result) {
		$("#province").empty();
		$("#province").append('<option value="0">--- 省 ---</option>');
		$("#province").removeClass("j-stop-click");
		
		console.log(result);
		
		var templ = $.templates("#provinceTempl");
		var html = templ.render(result);
		$("#province").append(html);
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
};

var changeProvince = function(){
	
	var chooseVal = $("#province").val();
	var data = jQuery.parseJSON('{"provinceCode":"'+chooseVal+'"}');
	$.ajax({
		url: '/area/getCities',
		type: 'post',
		dataType: 'json',
		data:data
	})
	.done(function(result) {
		$("#city").empty();
		$("#city").append('<option value="0">--- 市 ---</option>');
		$("#city").removeClass("j-stop-click");
		
		console.log(result);
		var templ = $.templates("#cityTempl");
		var html = templ.render(result);
		$("#city").append(html);
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
};
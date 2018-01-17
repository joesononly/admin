/*
* @Author: joesn
* @Date:   2018-01-06 12:24:10
* @Last Modified by:   joesn
* @Last Modified time: 2018-01-06 12:24:38
*/
$(function() {
    init();
    fileInit();
    $.FroalaEditor.DefineIcon('alert', { NAME: 'info' });
    $.FroalaEditor.RegisterCommand('alert', {
        title: 'Hello',
        focus: false,
        undo: false,
        refreshAfterCallback: false,
        callback: function() {
            alert('Hello!');
        }
    });
    $('div#target').froalaEditor({
        height:500,
         paragraphMultipleStyles: false
    });
});
var uploaddImage = function() {
    $("#articleImg").trigger("click");
}
var init = function() {
    var w = $(".showCover").width();
    var h = w * (1 / 4);
    $(".showCover").height(h);
    var pageH = h/3;
    pageH-=33.5;
    $(".set_page").css({"paddingTop":pageH});

    $("#_j_upload_toppic").bind('click', function(event) {
    /* Act on the event */
    $('#show').modal('show');
    var tw = $("#images").width();
    $("#images").height(500);
    });


    // $("#articleImg").width(w);
    // $("#articleImg").height(h);
}
var upload = function() {
    var html = $('textarea').froalaEditor('html.get', true);
    console.log(html);
}
var reload = function(id) {
    $.ajax({
            url: '/edit/get',
            type: 'post',
            dataType: 'json',
            data: { id: id },
        })
        .done(function(data) {
            console.log(data);
        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
            console.log("complete");
        });

}

var uploadImage = function() {
    // $("#pic").trigger('click');
    var target = $('#j-article-img').Jcrop({
        minSize: [100, 100],
        maxSize: [100, 100],
        onChange: selectEvent(target)
    });

}

var selectEvent = function(target) {
    console.log(target);
}

var uploadPic = function() {

    // 上传设置  
    var options = {
        // 规定把请求发送到那个URL  
        url: "/edit/articleImage",
        // 请求方式  
        type: "post",
        // 服务器响应的数据类型  
        // 请求成功时执行的回调函数  
        dataType: "json",
        success: function(data) {
            console.log(data.link);
            $(".showCover").css({
                "background":"url("+data.link+")",
                "backgroundSize":"100%"
            });
        }
    };

    $("#jvForm").ajaxSubmit(options);
}

var fileInit = function() {
    $("#articleImg").bind('change', function(event) {
        $("#j-upload-image-box").empty();
        $("#j-upload-image-box").append('<img src="" id="images">');
        var objUrl = getObjectURL(this.files[0]);
        console.log(this.files);
        if (objUrl) {
            $("#fileName").text(this.files[0].name);
            $("#images").attr("src", objUrl);
            $("#images").Jcrop({
                aspectRatio: 3 / 1,
                onSelect: function(e) {
                    console.log(e);
                }
            });
        }
    });
}

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
}
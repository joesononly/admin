<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>发布编辑</title>
</head>
<link rel="stylesheet" type="text/css" href="/common/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/common/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/common/Jcrop/css/jquery.Jcrop.min.css">
<link rel="stylesheet" type="text/css" href="/css/edit-home.css">
<link rel="stylesheet" type="text/css" href="/css/ative-edit.css">

<script type="text/javascript" src="/common/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/common/js/jquery.form.js"></script>
<script type="text/javascript" src="/common/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/common/Jcrop/js/jquery.Jcrop.min.js"></script>
<script type="text/javascript" src="/common/js/jsrender.min.js"></script>
<script type="text/javascript" src="/js/edit-result.js"></script>
<style type="text/css">
	.j-article-img{
		width: 100%;
		height: 450px;
		background: rgba(0,0,0,0.6);
		cursor: pointer;
		/*text-align: center;*/
		overflow:hidden;
	}
	.j-article-img .col-md-2{
		text-align: center;
	}
	.j-article-img i{
		line-height: 450px;
		color: #fff;
	}
	.j-article-img i{
            transition: all 0.5s ease-in-out 0s;
        }
    .j-article-img:hover i{
        transform: rotate(360deg);
    }
    .j-article-tip p{
    	color: #fff;
    	font-size: 24px;
    	line-height: 450px;
    	text-align: left;
    }
	.back{
		background-color: #f2f2f2;
	}
	.j-article-title{
		text-align: center;
		margin-top: 20px;
	}
	.j-article-title a{
		text-decoration: none;
		color: #000;
		font-size: 24px;
	}
	.j-article-gist{
		margin-bottom: 40px;
		margin-top: 40px;
	}
	.j-article-gist textarea{
		width: 100%;
	}
	.j-article-final{
		text-align: center;
		margin-bottom: 50px;
	}
	.j-article-final button{
		margin: 0px 5px;
	}
	._1s967 {
	    height: 40px;
	    border-radius: 50% 50% 0 0/100% 100% 0 0;
	    background-color: #fff;
	    margin-top: -40px;
	}
	.row {
	margin-left:0px !important;
	margin-right:0px !important;
}
</style>



<script id="provinceTempl" type="text/x-jsrender">
	<option value="{{:code}}">{{:name}}</option>
</script>

<script id="cityTempl" type="text/x-jsrender">
	<option value="{{:code}}">{{:name}}</option>
</script>
<body>
	<div class="container-fluid back" style="padding:0px" >
		<div class="row">
				<div class="j-article-img" id="j-box">
					<img id="j-article-img" src="/edit/show/dest/${(article.imagePath)!}" style="width:100%;"/>
					<div class="col-md-2 col-md-offset-5">
						<i class="fa fa-plus fa-5x" aria-hidden="true"></i>
					</div>
				</div>
		</div>
		<form action="/" methd="post" id="gistForm">
		<div class="row">
			<div class="col-md-12 j-article-title">
				<a id="title">${article.title}</a>
			</div>
		</div>
		<div class="row">
			<div class="row j-box">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-1" style="padding: 0px;">
							<span class="j-active-gist">活动介绍</span>
						</div>
						<div class="col-md-11" style="padding: 0px;">
							<textarea name="gist" style="margin-left:0px;"></textarea>
						</div>
						
					</div>
					<div class="row" style="margin-top:15px;">
						<div class="col-md-1" style="padding: 0px;">
							<span>活动时间</span>
						</div>
						<div class="col-md-11" style="padding: 0px;">
							<input type="date" name="startTime">
							<span class="zhi">至</span>
							<input type="date" name="endTime">
						</div>
					</div>
					<div class="row" style="margin-top:15px;">
						<div class="col-md-1" style="padding: 0px;">
							<span>活动费用</span>
						</div>
						<div class="col-md-11" style="padding: 0px;">
							<input type="text" name="money"> 元
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="margin-top:15px;margin-bottom:15px;">
				<div class="col-md-1">
					<span>活动位置</span>
				</div>
				<div class="col-md-2">
					<select class="j-select" name="countryCode" id="country">
						<option value="0">--- 国家 ---</option>
						<#list countries as country>
							<option value="${country.code}">${country.name}</option>
						</#list>
					</select>
				</div>
				<div class="col-md-2">
					<select class="j-select j-stop-click" name="provinceCode" id="province">
						<option value="0">--- 省 ---</option>
					</select>
				</div>
				<div class="col-md-2">
					<select class="j-select j-stop-click" name="cityCode" id="city">
						<option value="0">--- 市 ---</option>
					</select>
				</div>
			</div>
			<input type="text" name="id" value="${article.id}" style="display: none;">
			</form>
			<div class="row" style="margin-bottom:50px;">
				<div class="col-md-1 col-md-offset-5">
					<div class="j-report" id="j-report">提交</div>
				</div>
				<div class="col-md-1">
					<div class="j-see">预览</div>
				</div>
			</div>
		</div>
		<div class="row">
				<div class="_1s967"></div>
		</div>
		
	</div>
	
	<div class="modal fade bs-example-modal-lg" id="show" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	    	<div class="row" style="margin: 0px;">
	    		 <div class="j-upload-image-box" id="j-upload-image-box">
	    		 	
	    		 </div>
	    		 <form id="jvForm" action="/edit/articleImage" method="post" enctype="multipart/form-data">  
					<input type="file" name="file" id="targetImage" style="display: none;">
					<input type="text" name="rWidth" style="display: none;">
					<input type="text" name="rHeight" style="display: none;">
					<input type="text" name="x" style="display: none;">
					<input type="text" name="y" style="display: none;">
					<input type="text" name="width" style="display: none;">
					<input type="text" name="height" style="display: none;">
					<input type="text" name="id" value="${article.id}" style="display: none;">
				</form>
	    		 
	    	</div>
	     	<div class="row" style="margin: 0px;">
	     		<div class="col-md-10">
	     			<div class="col-md-12" id="uploadButton" style="cursor: pointer;">
	     				<p id="fileName" style="height: 40px;margin:0px;line-height: 40px;">
	     					点击上传图片
	     				</p>
	     			</div>
	     		</div>
	     		<div class="col-md-2" style="padding: 0px;">
	     			<span class="j-uploadButton" id="finishUpload">确认上传</span>
	     		</div>
	     	</div>
	    </div>
	  </div>
	</div>
</body>
</html>
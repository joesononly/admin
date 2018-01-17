<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>添加新景点</title>
</head>
<!--common css style-->
<link rel="stylesheet" type="text/css" href="/common/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/common/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- common js -->

<script type="text/javascript" src="/common/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/common/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/common/js/echarts.min.js"></script>
<script type="text/javascript" src="/common/js/jquery.form.js"></script>
<script type="text/javascript" src="/common/js/jsrender.min.js"></script>
<script type="text/javascript" src="/common/js/masonry.pkgd.min.js"></script>
<!-- 百度地图API -->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=faBITYDnNjjpvtRSlC0TBqseea1ppte8"></script>

<!-- my css -->
<link rel="stylesheet" href="/css/admin-add-place.css">

<!-- my js -->
<script type="text/javascript" src="/js/admin-add-place.js"></script>

<script id="progress" type="text/x-jsrender">
	<!-- 上传进度条 -->
	<div class="progress">
	  <div class="progress-bar progress-bar-success" id="progressShow{{:pItems}}" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
	    <span class="sr-only">40% Complete (success)</span>
	  </div>
	</div>
</script>
<body>
	<div class="container-fluid">
		 <div class="row">
            <ol class="breadcrumb">
                <li><a href="admin-total.html">首页</a></li>
                <li>旅游景点管理</li>
                <li class="active">新增景点</li>
            </ol>
        </div>
		<div class="row" style="margin: 0px;padding: 0px 15px;">
			<div class="in-box">
				<h4>景区名</h4>
				<input type="text" name="title" placeholder="请输入景区名...">
			</div>
		</div>
		<div class="row" style="margin: 15px 0px 0px 0px;">
			<!-- 上传文件区 -->
			<div class="col-md-5">
				<div class="in-box">
					<div class="row" style="margin: 0px;">
						<div class="col-md-6">
							<h4 style="margin: 0px;padding: 15px;border-bottom: solid 1px #f1f2f7;">上传景区图片</h4>
						</div>
						<div class="col-md-1 col-md-offset-5">
							<i class="fa fa-plus fa-2x" aria-hidden="true" style="position: absolute;"></i>
							<form id="uploadImage" action="/user/place/upload" method="post" enctype="multipart/form-data">
								<input type="file" name="image" class="upload-hidden" multiple="multiple">
							</form>
						</div>
					</div>
					
					<div class="upload-img" id="progressBox">
						
						<!--  -->
					</div>
				</div>
			</div>
			<!--  -->

			<!-- 图片显示区 -->
			<div class="col-md-7 show-area" style="">
				<div class="in-box">
					<h4>景区图片</h4>
					<div class="row" style="margin: 0px;">
						<div class="show-image">
							<div class="col-md-4 show-item">
								<img src="image/item2.jpg" alt="test">
							</div>
							<div class="col-md-4 show-item">
								<img src="image/admin-place/1.jpg" alt="test">
							</div>
							<div class="col-md-4 show-item">
								<img src="image/admin-place/12.jpg" alt="test">
							</div>
							<div class="col-md-4 show-item">
								<img src="image/admin-place/2.jpg" alt="test">
							</div>
							<div class="col-md-4 show-item">
								<img src="image/admin-place/22.jpg" alt="test">
							</div>
							<div class="col-md-4 show-item">
								<img src="image/admin-place/20120316041115481.jpg" alt="test">
							</div>
							<div class="col-md-4 show-item">
								<img src="image/admin-place/22.jpg" alt="test">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--  -->

			
			
		</div>

		<!-- 景区简介 -->
		<div class="row" style="margin: 15px;">
			<div class="in-box">
				<h4>景区简介</h4>
				<textarea placeholder="请输入景区简介..."></textarea>
			</div>
		</div>

		<!-- 使用费用 -->
		<div class="row" style="margin: 0px;padding: 0px 15px;">
			<div class="in-box">
				<h4>费用</h4>
				<input type="number" name="cost" placeholder="请输入费用...">
			</div>
		</div>

		<!-- 交通 -->
		<div class="row" style="margin: 15px;">
			<div class="in-box">
				<h4>交通</h4>
				<textarea name="traffic" placeholder="请输入交通情况..."></textarea>
			</div>
		</div>

		<!-- 门票 -->
		<div class="row" style="margin: 0px;padding: 0px 15px;">
			<div class="in-box">
				<h4>门票</h4>
				<input type="number" name="ticket" placeholder="请输入门票金额...">
			</div>
		</div>

		<!-- 开放时间 -->
		<div class="row" style="margin: 15px;">
			<div class="in-box">
				<h4>开放时间</h4>
				<input type="text" name="openTime" placeholder="请输入开放时间...">
			</div>
		</div>

		<!-- 开放时间 -->
		<div class="row" style="margin: 15px;height: 300px;">
			<div class="in-box">
				<h4>景区地点</h4>
				<input type="text" name="city" id="city" placeholder="请输入景区地点...">
				<div class="show-map"  id="mapId"></div>
			</div>
		</div>
		<script type="text/javascript">
			var map = new BMap.Map("mapId");
			// 创建地图实例  
			var point = new BMap.Point(116.404, 39.915);
			// 创建点坐标  
			map.centerAndZoom(point, 15);
			// 初始化地图，设置中心点坐标和地图级别  
			map.enableScrollWheelZoom(true); 
			//开启鼠标滚轮缩放
			var geolocation = new BMap.Geolocation();
			// 开启SDK辅助定位
			geolocation.enableSDKLocation();
			geolocation.getCurrentPosition(function(r){
				if(this.getStatus() == BMAP_STATUS_SUCCESS){
					var mk = new BMap.Marker(r.point);
					map.addOverlay(mk);
					map.panTo(r.point);
				}
				else {
					alert('failed'+this.getStatus());
				}        
			});

			// 百度地图API功能
			function G(id) {
				return document.getElementById(id);
			}

			var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
				{"input" : "city"
				,"location" : map
			});

			ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
				var str = "";
				var _value = e.fromitem.value;
				var value = "";
				if (e.fromitem.index > -1) {
					value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
				}    
				str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
				
				value = "";
				if (e.toitem.index > -1) {
					_value = e.toitem.value;
					value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
				}    
				str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
				console.log(str);
			});

			var myValue;
			ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
				var _value = e.item.value;
				myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
				console.log("onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue);
				
				setPlace();
			});

			map.addEventListener("click", function(e){    
			    // alert(e.point.lng + ", " + e.point.lat);    
			    map.clearOverlays();    //清除地图上所有覆盖物
			    map.centerAndZoom(e.point, 18);
				map.addOverlay(new BMap.Marker(e.point));    //添加标注
			});

			function setPlace(){
				map.clearOverlays();    //清除地图上所有覆盖物
				function myFun(){
					var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
					console.log(local);
					map.centerAndZoom(pp, 18);
					map.addOverlay(new BMap.Marker(pp));    //添加标注
				}
				var local = new BMap.LocalSearch(map, { //智能搜索
				  onSearchComplete: myFun
				});
				local.search(myValue);
			}
		</script>

	</div>
	<!-- container-fluid -->
</body>
</html>
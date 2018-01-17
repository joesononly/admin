<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<script type="text/javascript" src="/common/js/echarts.min.js"></script>
	<title>Document</title>
</head>
<!--common css style-->
<link rel="stylesheet" type="text/css" href="/common/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/common/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- common js -->
<script type="text/javascript" src="/common/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/common/bootstrap/js/bootstrap.min.js"></script>


<!-- my css -->
<link rel="stylesheet" href="/css/admin-total.css">

<!-- my js -->
<script type="text/javascript" src="/js/admin-total.js"></script>

<body>
	<div class="container-fluid">
		<div class="row">
			<ol class="breadcrumb">
			    <li class="active">首页</li>
			</ol>
		</div>
	
		<div class="row show-page-head">
			<div class="col-md-3 show-info-box">
				<a href="">
					<ul>
						<#if (notSeeData.userNumber)?exists>
							<span class="badge">${notSeeData.userNumber}</span>
						</#if>
						<li><i class="fa fa-user-circle fa-5x" aria-hidden="true"></i></li>
						<li><h4>总用户</h4></li>
						<li>201</li>
					</ul>
				</a>
			</div>
			<div class="col-md-3 show-info-box">
				<a href="">
					<ul>
						<#if (ontSeeData.palceNumber)?exists>
							<span class="badge">${notSeeData.placeNumber}</span>
						</#if>
						<li><i class="fa fa-flag-o fa-5x" aria-hidden="true"></i></li>
						<li><h4>景点</h4></li>
						<li>201</li>
					</ul>
				</a>
			</div>
			<div class="col-md-3 show-info-box">
				<a href="">
				<ul>
					<#if (notSeeData.orderNumber)?exists>
						<span class="badge">${notSeeData.orderNumber}</span>
					</#if>
					<li><i class="fa fa-newspaper-o fa-5x" aria-hidden="true"></i></li>
					<li><h4>总订单</h4></li>
					<li>201</li>
				</ul>
				</a>
			</div>
			<div class="col-md-3 show-info-box">
				<a href="">
					<ul>
						<#if (notSeeData.articleNumber)?exists>
							<span class="badge">${notSeeData.articleNumber}</span>
						</#if>
						<li><i class="fa fa-file-text fa-5x" aria-hidden="true"></i></li>
						<li><h4>总攻略数</h4></li>
						<li>20001</li>
					</ul>
				</a>
			</div>
		</div>
		<!--  -->

		<div class="row" style="margin-top: 50px;">
			<div class="col-md-12 show-user-line" id="line"></div>
		</div>
	</div>
	<script type="text/javascript">
		
		// 对Date的扩展，将 Date 转化为指定格式的String  
		// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，   
		// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)   
		Date.prototype.Format = function (fmt) { //author: meizz   
		    var o = {  
		        "M+": this.getMonth() + 1, //月份   
		        "d+": this.getDate(), //日   
		        "H+": this.getHours(), //小时   
		        "m+": this.getMinutes(), //分   
		        "s+": this.getSeconds(), //秒   
		        "q+": Math.floor((this.getMonth() + 3) / 3), //季度   
		        "S": this.getMilliseconds() //毫秒   
		    };  
		    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));  
		    for (var k in o)  
		    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));  
		    return fmt;  
		}
		
		function addDay(dayNumber, date) {
	        date = date ? date : new Date();
	        var ms = dayNumber * (1000 * 60 * 60 * 24)
	        var newDate = new Date(date.getTime() - ms);
	        return newDate.Format("yyyy-MM-dd");
	    }
	    
	    var drawChar = function(){
	    	$.ajax({
				url: '/admin/getTotalData',
				type: 'post',
				dataType: 'json',
				data:{"date":"6"}
			})
			.done(function(result) {
				console.log("success");
				initChar(result);
			})
			.fail(function() {
				console.log("error");
			})
			.always(function() {
				console.log("complete");
			});
	    	
	    }
		
		drawChar();
		var initChar = function(result){
			//测试x轴
			var xData = result.dateList;
	        // 基于准备好的dom，初始化echarts实例
	        var myChart = echarts.init(document.getElementById('line'));
	
	        // 指定图表的配置项和数据
	        var option = {
	            title: {
	                text: '网站数据概述图'
	            },
	            tooltip: {
	            	trigger: 'axis'
	            },
	            legend: {
	                data:['用户在线数数量','订单数数量','攻略发布数量','景点数量']
	            },
	            xAxis: {
	                data: xData
	            },
	            yAxis: {},
	            dataZoom: [{
		            startValue: result.dateList[0]
		        }, {
		            type: 'inside'
		        }],
	            series: [
			            {
			                name: '用户在线数数量',
			                type: 'line',
			                smooth: true,
			                data: result.userNumber
			            },
			            {
			                name: '订单数数量',
			                type: 'line',
			                smooth: true,
			                data: result.orderNumber
			            },
			            {
			                name: '攻略发布数量',
			                type: 'line',
			                smooth: true,
			                data: result.articleNumber
			            },
			             {
			                name: '景点数量',
			                type: 'line',
			                smooth: true,
			                data: result.placeNumber
			            }
	            ]
	        };
	
	        // 使用刚指定的配置项和数据显示图表。
	        myChart.setOption(option);
		}
		
    </script>
</body>
</html>
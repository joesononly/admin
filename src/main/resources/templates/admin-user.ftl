<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>用户管理</title>
</head>
<!--common css style-->
<link rel="stylesheet" type="text/css" href="/common/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/common/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- common js -->
<script type="text/javascript" src="/common/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/common/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/common/js/echarts.min.js"></script>
<script type="text/javascript" src="/common/js/jquery.twbsPagination.min.js"></script>
<script type="text/javascript" src="/common/js/jsrender.min.js"></script>

<!-- my css -->
<link rel="stylesheet" href="/css/admin-user.css">

<!-- my js -->
<script type="text/javascript" src="/js/admin-user.js"></script>

<!-- js render template -->
<script id="userListItem" type="text/x-jsrender">
	<tr>
      <th scope="row">{{: #index+1}}</th>
      <td>{{:username}}</td>
      <td>lv.{{:level}}</td>
      <td>{{:registerTime}}</td>
      <td>{{:articleNumber}}</td>
      <td>{{:fans}}</td>
      <td>21</td>
      <td>{{:likeNumber}}</td>
    </tr>
</script>

<body>
	<div class="container-fluid">
        <div class="row">
            <ol class="breadcrumb">
                <li><a href="admin-total.html">首页</a></li>
                <li class="active">用户管理</li>
            </ol>
        </div>
        <div class="row" style="margin: 25px -15px;">
            <!-- 用户最热文章排名 -->
            <div class="col-md-4">
                <div class="hot-article-5">
                    <h4>最热文章</h4>
                    <table class="table table-striped">
                      <thead>
                          <tr>
                              <th>#</th>
                              <th>文章</th>
                              <th>作者</th>
                              <th>热度</th>
                          </tr>
                      </thead>
                      <tbody>
                      	<#list hotArticleList as article>
                      		<tr>
	                          <th scope="row">${article_index+1}</th>
	                          <td>${article.title}</td>
	                          <td>${article.user.username}</td>
	                          <td>${article.hotPoint}℃</td>
	                        </tr>
                      	</#list>
                        
                      </tbody>
                    </table>
                </div>
            </div>
            <!--  -->

            <!-- 用户等级排名 -->
            <div class="col-md-8">
                <div class="hot-article-5">
                    <h4>用户等级排名</h4>
                    <table class="table table-striped">
                      <thead>
                          <tr>
                              <th>#</th>
                              <th>用户名</th>
                              <th>等级</th>
                              <th>注册时间</th>
                              <th>发表攻略数</th>
                              <th>粉丝</th>
                              <th>收藏</th>
                              <th>获得爱心</th>
                          </tr>
                      </thead>
                      <tbody>
                      	<#list userList as user>
                      		 <tr>
	                          <th scope="row">${user_index+1}</th>
	                          <td>${user.username}</td>
	                          <td>lv.${user.level}</td>
	                          <td>${user.registerTime}</td>
	                          <td>${user.articleNumber}</td>
	                          <td>${user.fans}</td>
	                          <td>21</td>
	                          <td>${user.likeNumber}</td>
	                        </tr>
                      	</#list>
                       
                      </tbody>
                    </table>
                </div>
            </div>

        </div>

        <!-- 用户分析图表 -->
		<div class="row" style="background: #fff; padding: 15px 0px;">
			<div class="col-md-6" >
                <div class="user-char char-big" id="new-user"></div>         
            </div>
            <div class="col-md-6">
                <div class="user-char char-big" id="user-age""></div>  
            </div>
		</div>

        <!-- 全部用户列表 -->
        <div class="row" style="margin: 25px -15px;">
            <div class="row" style="margin: 0px;">
                    <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>#</th>
                              <th>用户名</th>
                              <th>等级</th>
                              <th>注册时间</th>
                              <th>发表攻略数</th>
                              <th>粉丝</th>
                              <th>收藏</th>
                              <th>获得爱心</th>
                          </tr>
                      </thead>
                      <tbody id="userList">
                        
                        
                      </tbody>
                    </table>
                </div>
        </div>

        <!-- 页脚分页 -->
        <div class="row" style="text-align: right;">
            <nav aria-label="Page navigation" style="padding-right: 25px;">
              <ul id="pagination" class="pagination">
              </ul>
            </nav>
        </div>
	</div>
<script type="text/javascript">
var dranLine = function(result){
	//测试x轴
	var xData = result.dateList;
	// 基于准备好的dom，初始化echarts实例
	var myChart = echarts.init(document.getElementById('new-user'));
	
	// 指定图表的配置项和数据
	var option = {
	    title: {
	        text: '新用户增长趋势'
	    },
	    tooltip: {
	    	trigger: 'axis'
	    },
	    legend: {
	        data:['新用户数量']
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
	                name: '新用户数量',
	                type: 'line',
	                smooth: true,
	                data: result.userNumber
	            }
	    ]
	};
	
	// 使用刚指定的配置项和数据显示图表。
	myChart.setOption(option);
}

var initLine = function(){
	$.ajax({
				url: '/admin/user/get/userData',
				type: 'post',
				dataType: 'json',
				data:{"date":"6"}
			})
			.done(function(result) {
				console.log("success");
				dranLine(result);
			})
			.fail(function() {
				console.log("error");
			})
			.always(function() {
				console.log("complete");
			});
}

initLine();

</script>
<!-- 用户年龄饼状图 -->
<script type="text/javascript">
var drawChar = function(result){
	// 基于准备好的dom，初始化echarts实例
	var userAgeChart = echarts.init(document.getElementById('user-age'));
	var userAgeoption = {
	    // backgroundColor: '#2c343c',
	    color:['#f6da22','#bbe2e8','#6cacde'],
	    title: {
	        text: '用户年龄',
	        left: 'center',
	        top: 20,
	        textStyle: {
	            // color: '#ccc'
	        }
	    },
	
	    tooltip : {
	        trigger: 'item',
	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    },
	
	    visualMap: {
	        show: false,
	        min: 80,
	        max: 600,
	        inRange: {
	            colorLightness: [0, 1]
	        }
	    },
	    series : [
	        {
	            name:'数据分析',
	            type:'pie',
	            radius : '55%',
	            center: ['50%', '50%'],
	            data:result.sort(function (a, b) { return a.value - b.value; }),
	            roseType: 'radius',
	            label: {
	                normal: {
	                    textStyle: {
	                        // color: 'rgba(255, 255, 255, 0.3)'
	                    }
	                }
	            },
	            labelLine: {
	                normal: {
	                    lineStyle: {
	                        // color: 'rgba(255, 255, 255, 0.3)'
	                    },
	                    smooth: 0.2,
	                    length: 10,
	                    length2: 20
	                }
	            },
	            itemStyle: {
	                normal: {
	                    // color: '#c23531',
	                    // shadowBlur: 200,
	                    // shadowColor: 'rgba(0, 0, 0, 0.5)'
	                }
	            },
	
	            animationType: 'scale',
	            animationEasing: 'elasticOut',
	            animationDelay: function (idx) {
	                return Math.random() * 200;
	            }
	        }
	    ]
	};
	// 使用刚指定的配置项和数据显示图表。
	userAgeChart.setOption(userAgeoption);
}

var initChar = function(){
	$.ajax({
			url: '/admin/user/get/userAge',
			type: 'post',
			dataType: 'json'
		})
		.done(function(result) {
			console.log("success");
			drawChar(result);
		})
		.fail(function() {
			console.log("error");
		})
		.always(function() {
			console.log("complete");
		});
}
initChar();
</script>
</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>后台</title>
</head>
<!--common css style-->
<link rel="stylesheet" type="text/css" href="/common/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/common/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- common js -->
<script type="text/javascript" src="/common/js/jquery-3.2.1.min.js"></script>

<script type="text/javascript" src="/common/bootstrap/js/bootstrap.min.js"></script>

<!-- my css -->
<link rel="stylesheet" href="/css/admin.css">

<!-- my js -->
<script type="text/javascript" src="/js/admin.js"></script>
<body>
	<div class="container-fluid" style="height: 100%">
		<div class="row" style="height: 100%;">
			<div class="col-md-2" style="height: 100%;padding: 0px;position: fixed;">
				<ul class="j-menu">
					<li class="active">
						<a href="/admin/total" target="showTarget"><i class="fa fa-user-circle" aria-hidden="true"></i> 首页</a>
					</li>
					<li child-menu="2">
						<i class="fa fa-flag-o" aria-hidden="true"></i> 旅游景点管理 <span class="caret"></span>
						<ol ><a href="/admin/place" target="showTarget">添加景点</a></ol>
						<ol ><a href="admin-place-list.html" target="showTarget">景点列表</a></ol>
					</li>
					<li>
						<a href="admin-article.html" target="showTarget"><i class="fa fa-file-text"" aria-hidden="true"></i> 文章管理</a>
					</li>
					<li >
						<a href="admin-order.html" target="showTarget"><i class="fa fa-newspaper-o" aria-hidden="true"></i> 订单管理</a>
					</li>
					<li child-menu="2">
						<i class="fa fa-fire" aria-hidden="true"></i> 热点景点统计  <span class="caret"></span>
						<ol><a href="#" target="#">热门搜索</a></ol>
						<ol><a href="#" target="#">热门地区</a></ol>
					</li>
					<li>
						<a href="/admin/user" target="showTarget"><i class="fa fa-user-circle" aria-hidden="true"></i> 用户管理</a>
					</li>
				</ul>
			</div>
			<!--  -->
			<!-- 显示区域 -->
			<div class="col-md-10" style="margin-left: 16.66666667%;padding: 0px;">
				<!-- 4:3 aspect ratio -->
				<div class="embed-responsive embed-responsive-4by3">
				  <iframe class="embed-responsive-item" name="showTarget" src="/admin/total"></iframe>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
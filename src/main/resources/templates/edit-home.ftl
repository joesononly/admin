<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>书写人生</title>
</head>
<link rel="stylesheet" type="text/css" href="/common/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/common/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/css/edit-home.css">

<script type="text/javascript" src="/common/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/common/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/common/js/jsrender.min.js"></script>
<script type="text/javascript" src="/js/edit-home.js"></script>

<script id="myTemplate" type="text/x-jsrender">
	<div class="btn-group j-right">
	  <a type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    <i class="fa fa-cog" aria-hidden="true"></i>
	  </a>
	  <ul class="dropdown-menu">
	    <li><a href="#">置顶</a></li>
	    <li><a href="#">Another action</a></li>
	    <li><a href="#">Something else here</a></li>
	    <li role="separator" class="divider"></li>
	    <li><a href="#">删除文章</a></li>
	  </ul>
	</div>
</script>

<script type="text/x-jsrender" id="article">
	<li class="article-active  value="{{:id}}">
		<i class="fa fa-file-word-o fa-2x" aria-hidden="true"> </i>
		<span>新建文章</span>
		<!-- Single button -->
		<div class="btn-group j-right">
		  <a type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    <i class="fa fa-cog" aria-hidden="true"></i>
		  </a>
		  <ul class="dropdown-menu">
		    <li><a href="#">置顶</a></li>
		    <li><a href="#">Another action</a></li>
		    <li><a href="#">Something else here</a></li>
		    <li role="separator" class="divider"></li>
		    <li><a href="#">删除文章</a></li>
		  </ul>
		</div>
	</li>
</script>

<body>
	<div class="container-fluid" style="height: 100%;">
		<div class="row" style="height: 100%;">
			<div class="col-md-3 article-list">
				<div class="row" style="margin: 0px;">
					<a href="javascript:createArticle()" class="article-add">
						<i class="fa fa-pencil-square-o" aria-hidden="true"> 新建文章</i>
					</a>
				</div>
				<ul class="article-list-ul">
					
					
					
					<#list articles as article>
						<#if article_index == 0 >
							<li class="article-active" value="${article.id}">
								<i class="fa fa-file-word-o fa-2x" aria-hidden="true"> </i>
								<span>${article.title}</span>
								<!-- Single button -->
								<div class="btn-group j-right">
								  <a type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								    <i class="fa fa-cog" aria-hidden="true"></i>
								  </a>
								  <ul class="dropdown-menu">
								    <li><a href="#">置顶</a></li>
								    <li><a href="#">Another action</a></li>
								    <li><a href="#">Something else here</a></li>
								    <li role="separator" class="divider"></li>
								    <li><a href="#">删除文章</a></li>
								  </ul>
								</div>
							</li>
						<#else>
							 <li onclick="changeActive(this)" value="${article.id}">
								<i class="fa fa-file-word-o fa-2x" aria-hidden="true"> </i>
								<span title="${article.title}">${article.title}</span>
							  </li>
						</#if>
					 
					</#list>
				</ul>
			</div>
			<div class="col-md-9 article">
				<div class="embed-responsive embed-responsive-16by9">
				  <iframe id="targetEdit" class="embed-responsive-item" src="/edit"></iframe>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
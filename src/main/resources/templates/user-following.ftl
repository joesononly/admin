<!DOCTYPE html>
<html><!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=no">

  <!-- Start of Baidu Transcode -->
  <meta http-equiv="Cache-Control" content="no-siteapp">
  <meta http-equiv="Cache-Control" content ="no-transform">
  <meta name="applicable-device" content="pc,mobile">
  <meta name="MobileOptimized" content="width">
  <meta name="HandheldFriendly" content="true">
  <meta name="mobile-agent" content="format=html5;">
  <!-- End of Baidu Transcode -->


  <meta name="360-site-verification" content="604a14b53c6b871206001285921e81d8">
  <meta property="wb:webmaster" content="294ec9de89e7fadb">
  <meta property="qc:admins" content="104102651453316562112116375">
  <meta property="qc:admins" content="11635613706305617">
  <meta property="qc:admins" content="1163561616621163056375">
  <meta name="google-site-verification" content="cV4-qkUJZR6gmFeajx_UyPe47GW9vY6cnCrYtCHYNh4">
  <meta name="google-site-verification" content="HF7lfF8YEGs1qtCE-kPml8Z469e2RHhGajy6JPVy5XI">
  <meta http-equiv="mobile-agent" content="format=html5;">

  <!-- Apple -->
  <meta name="apple-mobile-web-app-title" content="鹰巢">
    <title>鹰巢</title>
  <meta name="csrf-param" content="authenticity_token">
<meta name="csrf-token" content="8K/AU8+BGtWefr8detf/g9xYJxk7Xjvd6MfnHMBAcE5J9u3cQVzdGPhEKcwIPFRWkBj2DMnQbmMrVcdyq87Zfg==">	


  <link rel="stylesheet" media="all" href="/css/web-8e4fd86a49b411611e61.css">
  
  <link rel="stylesheet" media="all" href="/css/entry-4022a9cdb8df13d630ea.css">
  <link rel="stylesheet" href="/common/font-awesome-4.7.0/css/font-awesome.min.css">
  <script type="text/javascript" src="/common/js/jquery-3.2.1.min.js"></script>
  <script type="text/javascript" src="/common/js/jsrender.min.js"></script>
  <script type="text/javascript" src="/js/user-following.js"></script>

  <script id="loading" type="text/x-jsrender">
  	<div id="list-container">
		<div class="users-placeholder">
			<div class="avatar"></div>
			<div class="wrap">
				<div class="btn"></div>
				<div class="name"></div>
				<div class="text"></div>
				<div class="text short-text"></div>
			</div>
		</div>
	</div>
  </script>

  <script id="like" type="text/x-jsrender">
	<!-- 关注了一个驴友 -->
  	<li>
	  	<a class="avatar" href="/u/ctgwSJ">
	    	<img src="/admin/show/{{:userImagePath}}" alt="180">
		</a>  
		<div class="info">
	    <a class="name" href="/u/ctgwSJ">{{:username}}</a>
	    <div class="meta">
	      <span>关注 {{:followeder}}</span><span>粉丝 {{:fans}}</span><span>文章 5</span>
	    </div>
	    <div class="meta">
	      写了 2598 字，获得了 {{:likeNumber}}个喜欢
	    </div>
	  </div>
	    <a class="btn btn-default following"><i class="fa fa-check" aria-hidden="true"></i><span>已关注</span></a>
	</li>
  </script>

  <script id="fans" type="text/x-jsrender">
	<!-- 捕获了一个粉丝 -->
	<li>
	  	<a class="avatar" href="/u/7548ca33d152">
	    	<img src="/admin/show/{{:userImagePath}}" alt="180">
		</a>  
		<div class="info">
	    <a class="name" href="/u/7548ca33d152">{{:username}}</a>
	    <div class="meta">
	      <span>关注 {{:followeder}}</span><span>粉丝 {{:fans}}</span><span>文章 0</span>
	    </div>
	    <div class="meta">
	      写了 0 字，获得了 {{:likeNumber}} 个喜欢
	    </div>
	  </div>
	  {{if isFollowed}}
	    <a class="btn btn-default following" onclick="cancelFollow(this,{{:userId}})"><i class="fa fa-check" aria-hidden="true"></i><span>已关注</span></a>
	  {{else}}
	  	<a class="btn btn-success follow" onclick="addFollow(this,{{:userId}})"><i class="fa fa-plus" aria-hidden="true"></i><span>关注</span></a>
	  {{/if}}
	</li>
  </script>

</head>

  <body lang="zh-CN" class="reader-black-font" style="overflow-y: scroll;">
    <!-- 全局顶部导航栏 -->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="width-limit">
    <!-- 左上方 Logo -->
    <a class="logo" href="">
    	<img src="./简书_files/logo-58fd04f6f0de908401aa561cda6a0688.png" alt="Logo">
    </a>

    <!-- 右上角 -->
      <!-- 登录显示写文章 -->
    <a class="btn write-btn" target="_blank" href="/editHome">
        <i class="fa fa-pencil" aria-hidden="true"></i> 写文章
	</a>
    <!-- 如果用户登录，显示下拉菜单 -->
    <div class="user">
        <div data-hover="dropdown">
          <a class="avatar" href=""><img src="/admin/show/${user.userImagePath}" alt="120"></a>
        </div>
        <ul class="dropdown-menu">
          	<li>
	            <a href="">
	              <i class="fa fa-user-circle" aria-hidden="true"></i><span>我的主页</span>
				</a>          
			</li>
          	<li>
            <!-- TODO bookmarks_path -->
	            <a href="">
	              <i class="fa fa-star" aria-hidden="true"></i><span>收藏的文章</span>
				</a>          
			</li>
        </ul>
      </div>


    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu" aria-expanded="false">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse" id="menu">
        <ul class="nav navbar-nav">
            <li class="tab ">
              <a href="">
                <span class="menu-text">首页</span>
			  </a>           
			</li>
            <li class="tab ">
              <a href="">
                <span class="menu-text">目的地</span>
			  </a>            
			</li>
			<li class="tab ">
              <a href="">
                <span class="menu-text">社区</span>
			  </a>            
			</li>
            <li class="tab notification">
	            <a data-hover="dropdown" href="" class="notification-btn">
	            	<span class="menu-text">攻略</span>
	            </a> 
	            <ul class="dropdown-menu">
		            <li>
			            <a href="">
			            	<i class="iconfont ic-comments"></i> <span>评论</span>
			            </a>
		            </li>
		            <li>
			            <a href="">
			            	<i class="iconfont ic-chats"></i> <span>简信</span> <!---->
			            </a>
		            </li>
		             <li>
		             	<a href="">
		             	<i class="iconfont ic-requests"></i> <span>投稿请求</span>
		             	</a>
		             </li>
		             <li>
		             	<a href="">
		             	<i class="iconfont ic-likes"></i> 
		             	<span>喜欢和赞</span> 
		             	</a>
		             </li>
		             <li>
		             	<a href="">
		             	<i class="iconfont ic-follows"></i> 
		             	<span>关注</span>
		             	</a>
		             </li>
	           </ul>
          </li>
          <li class="search">
            <form target="_blank" action="http://www.jianshu.com/search" accept-charset="UTF-8" method="get">
            	<input name="utf8" type="hidden" value="✓">
              	<input type="text" name="q" id="q" value="" autocomplete="off" placeholder="搜索" class="search-input">
              		<a class="search-btn" href="javascript:void(null)">
              			<i class="fa fa-search" aria-hidden="true" style="margin-top:5px;"></i>
              		</a>
			</form>          
		   </li>
        </ul>
      </div>
    </div>
  </div>
</nav>

    

<div class="container person">
  <div class="row">
    <div class="col-xs-16 main">
	    <div class="main-top">
	  		<a class="avatar" href="">
	    		<img src="/admin/show/${user.userImagePath}" alt="240">
			</a>

			<div class="title">
			    <a class="name" href="">${user.username}</a>
			</div>

		  	<div class="info">
			    <ul>
				      <li>
				        <div class="meta-block">
				          <a href="">
				            <p>${user.followeder}</p>
				            关注 <i class="fa fa-angle-right" aria-hidden="true"></i>
						  </a>        
						</div>
				      </li>
				      <li>
				        <div class="meta-block">
				          <a href="">
				            <p>${user.fans}</p>
				            粉丝 <i class="fa fa-angle-right" aria-hidden="true"></i>
						  </a>        
				   		</div>
				      </li>
				      <li>
				        <div class="meta-block">
				          <a href="">
				            <p>0</p>
				            文章 <i class="fa fa-angle-right" aria-hidden="true"></i>
						  </a>        
						</div>
				      </li>
				      <li>
				        <div class="meta-block">
				          <p>0</p>
				          <div>字数</div>
				        </div>
				      </li>
				      <li>
				        <div class="meta-block">
				          <p>0</p>
				          <div>收获喜欢</div>
				        </div>
				      </li>
			    </ul>
		  </div>
		</div>

      <div id="outer-container">
        <ul class="trigger-menu" data-pjax-container="#list-container">
	        <li class="active" onclick="changeArticle(this)" index="0">
	        	<a href="javascript:void(0)">
	        		关注用户 ${user.followeder}
	        	</a>
	        </li>
	        <li class="" onclick="changeArticle(this)" index="1">
	        	<a href="javascript:void(0)">
	        		粉丝 ${user.fans}
	        	</a>
	        </li>
        </ul>

        <div id="list-container">
          <!-- 动态列表模块 -->
			<ul class="user-list" infinite-scroll-url="/users/2f485834e969/following">
				<#if followers?exists>
					<#list followers as follower>
						<!-- 关注了一个驴友 -->
						<li>
						  	<a class="avatar" href="/u/ctgwSJ">
						    	<img src="/admin/show/${follower.userImagePath?default('Joeson.png')}" alt="180">
							</a>  
							<div class="info">
						    <a class="name" href="/u/ctgwSJ">${follower.username}</a>
						    <div class="meta">
						      <span>关注 ${follower.followeder}</span><span>粉丝 ${follower.fans}</span><span>文章 1</span>
						    </div>
						    <div class="meta">
						    	  写了 2598 字，获得了  ${follower.likeNumber}个喜欢
						    </div>
						  </div>
						    <a class="btn btn-default following"><i class="fa fa-check" aria-hidden="true"></i><span>已关注</span></a>
						</li>
					</#list>
				<#else>
				
					<div id="list-container">
						<div class="users-placeholder">
							<div class="avatar"></div>
							<div class="wrap">
								<div class="btn"></div>
								<div class="name"></div>
								<div class="text"></div>
								<div class="text short-text"></div>
							</div>
						</div>
					</div>
				</#if>
			
			</ul>

        </div>
      </div>
    </div>
    
<div class="col-xs-7 col-xs-offset-1 aside">
  <div class="description">
    <div class="js-intro"></div>
    
    
  </div>
  <div id="user-publications"><!----></div>
  <ul class="list user-dynamic">
    <li>
      <a href="http://www.jianshu.com/users/2f485834e969/subscriptions">
        <i class="fa fa-bookmark" aria-hidden="true"></i> 
        <span>我关注的专题/文集</span>
	  </a>
	</li>
    <li>
      <a href="http://www.jianshu.com/users/2f485834e969/liked_notes">
        <i class="fa fa-heart" aria-hidden="true"></i>
        <span>我喜欢的文章</span>
	  </a>
	</li>
  </ul>
  <!-- 专题和文集 -->
  <div>
  	<div><!----> 
	  	<div class="title">我创建的专题</div>
	  	<div class="new-collection-block">
		  	<a href="http://www.jianshu.com/collections/new" class="new-collection-btn">
		  	<i class="fa fa-plus" aria-hidden="true"></i>
		  	<span>创建一个新大陆</span>
		  	</a>
	  	</div>
  	</div> <!----> <!---->
  </div>
</div>



  </div>
</div>

</body>

</html>
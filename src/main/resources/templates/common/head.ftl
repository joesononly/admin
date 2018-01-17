<!-- 全局顶部导航栏 -->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="width-limit">
        <!-- 左上方 Logo -->
        <a class="logo" href="https://www.jianshu.com/"><img src="./设置 - 简书_files/nav-logo-4c7bbafe27adc892f3046e6978459bac.png" alt="Nav logo"></a>
        <!-- 右上角 -->
        <!-- 登录显示写文章 -->
        <a class="btn write-btn" target="_blank" href="/edit/home">
        	<i class="iconfont ic-write"></i>写文章
        </a>
        
        <#if user?exists>
		<!-- 如果用户登录，显示下拉菜单 -->
	    <div class="user">
	        <div data-hover="dropdown">
	          <a class="avatar" href=""><img src="/admin/show/${user.userImagePath}" alt="120"></a>
	        </div>
	        <ul class="dropdown-menu">
	          	<li>
		            <a href="/user/home">
		              <i class="fa fa-user-circle" aria-hidden="true"></i><span>我的主页</span>
					</a>          
				</li>
	          	<li>
	            <!-- 收藏文章主页 -->
		            <a href="">
		              <i class="fa fa-star" aria-hidden="true"></i><span><span>收藏的文章</span>
					</a>          
				</li>
				<li>
	            <!-- 设置主页 -->
		            <a href="/user/set">
		              <i class="fa fa-cog" aria-hidden="true"></i><span><span>设置</span>
					</a>          
				</li>
	        </ul>
	      </div>
	<#else>
	    <a class="btn log-in" href="/sign_in">登录</a>
		<a class="btn sign-up" href="/sign_up">注册</a>
	</#if>

        
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
		              <a href="/index">
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
                        <form target="_blank" action="https://www.jianshu.com/search" accept-charset="UTF-8" method="get">
                            <input name="utf8" type="hidden" value="✓">
                            <input type="text" name="q" id="q" value="" autocomplete="off" placeholder="搜索" class="search-input">
                            <a class="search-btn" href="javascript:void(null)"><i class="iconfont ic-search"></i></a>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<!DOCTYPE html>
<!-- saved from url=(0038)https://www.jianshu.com/settings/basic -->
<html>
<!--<![endif]-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=no">
    <!-- Start of Baidu Transcode -->
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <meta http-equiv="Cache-Control" content="no-transform">
    <meta name="applicable-device" content="pc,mobile">
    <meta name="MobileOptimized" content="width">
    <meta name="HandheldFriendly" content="true">
    <meta name="mobile-agent" content="format=html5;url=https://www.jianshu.com/settings">
    <!-- End of Baidu Transcode -->
    <meta name="360-site-verification" content="604a14b53c6b871206001285921e81d8">
    <meta property="wb:webmaster" content="294ec9de89e7fadb">
    <meta property="qc:admins" content="104102651453316562112116375">
    <meta property="qc:admins" content="11635613706305617">
    <meta property="qc:admins" content="1163561616621163056375">
    <meta name="google-site-verification" content="cV4-qkUJZR6gmFeajx_UyPe47GW9vY6cnCrYtCHYNh4">
    <meta name="google-site-verification" content="HF7lfF8YEGs1qtCE-kPml8Z469e2RHhGajy6JPVy5XI">
    <meta http-equiv="mobile-agent" content="format=html5; url=https://www.jianshu.com/settings">
    <!-- Apple -->
    <meta name="apple-mobile-web-app-title" content="简书">
    <title>设置 - 简书</title>
    <meta name="csrf-param" content="authenticity_token">
    <meta name="csrf-token" content="E+E0wy/d1t0/Uvvde12Lpl9K/OuMhID1gmITZYQWGabaHVJsq/zujtHeNxC0CqhxbM+XhmlXorBmCkX9+lqT5A==">
    <link rel="stylesheet" media="all" href="/css/web-9a426ac97f34593e6662.css">
    <link rel="stylesheet" media="all" href="/css/entry-7b434205f766417bd833.css">
    <link rel="stylesheet" type="text/css" href="/common/font-awesome-4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="/common/js/jquery-3.2.1.min.js"></script>
  	<script type="text/javascript" src="/common/js/jsrender.min.js"></script>
  	<script type="text/javascript" src="/js/person.js"></script>
    <style type="text/css">
    @charset "UTF-8";
    /*
 * 变量
*/
    .pc-bind-phone-modal .modal-content,
    .pc-bind-phone-modal .modal-body {
        overflow: visible;
    }

    .pc-bind-phone-modal .dropdown-menu {
        max-height: 300px;
        overflow: auto;
    }

    .pc-bind-phone-modal .dropdown-menu .tag {
        background-color: #efefef;
        color: #4A4A4A;
        height: 28px;
        line-height: 28px;
        padding-left: 25px;
        font-size: 12px;
    }

    .reader-night-mode .pc-bind-phone-modal .dropdown-menu .tag {
        background-color: #2F2F2F;
        color: #999999;
    }
    .j-aside{
        position: fixed;
	    top: 0;
	    bottom: 0;
	    margin: 86px 0 0;
	    padding: 0 0 30px;
	    width: 280px;
	    overflow: auto;
    }
    </style>
</head>

<body lang="zh-CN" class="reader-black-font" style="overflow-y: scroll;">
<#include "/common/head.ftl">


    <div class="container setting">
        <div class="row">
            <div class="aside">
                <ul>
                    <li class="router-link-exact-active active">
                        <a href="/settings/basic">
                            <div class="setting-icon">
                              <i class="fa fa-address-card" aria-hidden="true"></i>
                            </div> 
                            <span>基础设置</span>
                            <!---->
                        </a>
                    </li>
                    <li class="">
                        <a href="https://www.jianshu.com/settings/blacklist">
                            <div class="setting-icon">
                              <i class="fa fa-ban" aria-hidden="true"></i>
                            </div> 
                            <span>黑名单</span>
                            <!---->
                        </a>
                    </li>
                    <li class="">
                        <a href="https://www.jianshu.com/settings/misc">
                            <div class="setting-icon">
                              <i class="fa fa-cog" aria-hidden="true"></i>
                            </div> 
                            <span>帐号管理</span>
                            <!---->
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-xs-16 col-xs-offset-8 main">
                <table>
                    <thead>
                        <tr>
                            <th class="setting-head responsive-head"></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody class="base">
                        <tr>
                            <td class="top-line">
                                <div class="avatar"><img src="/admin/show/${user.userImagePath}"></div>
                            </td>
                            <td class="top-line">
                                <a class="btn btn-hollow">
                                    <input unselectable="on" name="headImge" type="file" class="hide"> 更改头像
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="setting-title">
                               	 昵称
                            </td>
                            <td>
                                <input type="text" name="name" value="${user.username}" placeholder="请输入昵称">
                            </td>
                        </tr>
                         <tr>
                            <td class="top-line setting-title setting-verticle" style="padding-top: 20px;">
                                	性别
                            </td>
                            <td class="top-line" style="padding-top: 20px;">
                                <input type="radio" name="sex" value="1"> <span>男</span>
                                <input type="radio" name="sex" value="2"> <span>女</span>
                                <input type="radio" name="sex" value="0" checked> <span>保密</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="setting-title">电子邮件</td>
                            <td>
                                <form>
                                    <input type="button" value="发送" class="btn btn-hollow pull-right">
                                    <input type="email" name="email" placeholder="请输入你的常用邮箱">
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td class="setting-title pull-left">个人简介</td>
                            <td>
                                <form>
                                    <textarea name="gist" placeholder="填写你的个人简介"></textarea>
                                </form>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <input type="submit" class="btn btn-success setting-save" value="保存">
                <!---->
                <!---->
                <!---->
                <!---->
            </div>
        </div>
    </div>
</body>
<style type="text/css">
#yddContainer {
    display: block;
    font-family: Microsoft YaHei;
    position: relative;
    width: 100%;
    height: 100%;
    top: -4px;
    left: -4px;
    font-size: 12px;
    border: 1px solid
}

#yddTop {
    display: block;
    height: 22px
}

#yddTopBorderlr {
    display: block;
    position: static;
    height: 17px;
    padding: 2px 28px;
    line-height: 17px;
    font-size: 12px;
    color: #5079bb;
    font-weight: bold;
    border-style: none solid;
    border-width: 1px
}

#yddTopBorderlr .ydd-sp {
    position: absolute;
    top: 2px;
    height: 0;
    overflow: hidden
}

.ydd-icon {
    left: 5px;
    width: 17px;
    padding: 0px 0px 0px 0px;
    padding-top: 17px;
    background-position: -16px -44px
}

.ydd-close {
    right: 5px;
    width: 16px;
    padding-top: 16px;
    background-position: left -44px
}

#yddKeyTitle {
    float: left;
    text-decoration: none
}

#yddMiddle {
    display: block;
    margin-bottom: 10px
}

.ydd-tabs {
    display: block;
    margin: 5px 0;
    padding: 0 5px;
    height: 18px;
    border-bottom: 1px solid
}

.ydd-tab {
    display: block;
    float: left;
    height: 18px;
    margin: 0 5px -1px 0;
    padding: 0 4px;
    line-height: 18px;
    border: 1px solid;
    border-bottom: none
}

.ydd-trans-container {
    display: block;
    line-height: 160%
}

.ydd-trans-container a {
    text-decoration: none;
}

#yddBottom {
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 22px;
    line-height: 22px;
    overflow: hidden;
    background-position: left -22px
}

.ydd-padding010 {
    padding: 0 10px
}

#yddWrapper {
    color: #252525;
    z-index: 10001;
    background: url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ab20.png);
}

#yddContainer {
    background: #fff;
    border-color: #4b7598
}

#yddTopBorderlr {
    border-color: #f0f8fc
}

#yddWrapper .ydd-sp {
    background-image: url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ydd-sprite.png)
}

#yddWrapper a,
#yddWrapper a:hover,
#yddWrapper a:visited {
    color: #50799b
}

#yddWrapper .ydd-tabs {
    color: #959595
}

.ydd-tabs,
.ydd-tab {
    background: #fff;
    border-color: #d5e7f3
}

#yddBottom {
    color: #363636
}

#yddWrapper {
    min-width: 250px;
    max-width: 400px;
}
</style>

</html>
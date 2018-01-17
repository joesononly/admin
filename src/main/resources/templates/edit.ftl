<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
 	<!-- Include Bootstrap style -->
    <link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.min.css">

    <!-- Include external CSS. -->
    <link href="/common/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/common/css/codemirror.min.css">
 
    <!-- Include Editor style. -->
    <link href="/common/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
    <link href="/common/css/froala_style.min.css" rel="stylesheet" type="text/css" />

	<!-- Include Custom style -->
	<link rel="stylesheet" type="text/css" href="css/edit.css">
  </head>
 
  <body>
    <!-- Create a tag that we will use as the editable area. -->
    <!-- You can use a div tag as well. -->
 
    <!-- Include external JS libs. -->
    <script type="text/javascript" src="/common/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/common/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/common/js/codemirror.min.js"></script>
    <script type="text/javascript" src="/common/js/xml.min.js"></script>
 
    <!-- Include Editor JS files. -->
    <script type="text/javascript" src="/common/js/froala_editor.pkgd.min.js"></script>
 
    <!-- Initialize the editor. -->
    <script type="text/javascript" src="/js/edit.js"></script>

	<input type="text" name="title" class="title" value="${(article.title)!}"  placeholder="请输入标题" />
    <div id="target">
    		${(article.content)!}
    </div>
    <a id="report" class="btn r-btn highlight text-small commit" onclick="upload(${(article.id)!})">发表</a>
    <a id="save" class="btn r-btn highlight text-small commit">暂时保存</a>
  </body>
</html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <!-- Include Bootstrap style -->
    <link rel="stylesheet" type="text/css" href="/common/bootstrap/css/bootstrap.min.css">
    <!-- Include external CSS. -->
    <link href="/common/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/common/css/codemirror.min.css">
    <!-- Include Editor style. -->
    <link href="/common/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
    <link href="/common/css/froala_style.min.css" rel="stylesheet" type="text/css" />
    <!-- Include Custom style -->
    <title>Document</title>
</head>
<!-- Create a tag that we will use as the editable area. -->
<!-- You can use a div tag as well. -->
<!-- Include external JS libs. -->
<script type="text/javascript" src="/common/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/common/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/common/js/codemirror.min.js"></script>
<script type="text/javascript" src="/common/js/xml.min.js"></script>
<script type="text/javascript" src="/common/js/jquery.form.js"></script>
<!-- Include Editor JS files. -->
<script type="text/javascript" src="/common/js/froala_editor.pkgd.min.js"></script>

<!-- Jcorp js -->

<link rel="stylesheet" type="text/css" href="/common/css/jquery.Jcrop.min.css">
<script type="text/javascript" src="/common/js/jquery.Jcrop.min.js"></script>

<!-- Initialize the editor. -->
<link rel="stylesheet" type="text/css" href="/css/edit-article.css">
<script type="text/javascript" src="/js/edit-article.js"></script>

<body>

    <div class="modal fade bs-example-modal-lg" id="show" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="row" style="margin: 0px;">
                 <div class="j-upload-image-box" id="j-upload-image-box">
                    
                 </div>
                 <form id="jvForm" action="/edit/articleImage" method="post" enctype="multipart/form-data">  
                    <input type="file" name="targetImage" id="targetImage" style="display: none;">
                    <input type="text" name="x" style="display: none;">
                    <input type="text" name="y" style="display: none;">
                    <input type="text" name="width" style="display: none;">
                    <input type="text" name="height" style="display: none;">
                </form>
                 
            </div>
            <div class="row" style="margin: 0px;">
                <div class="col-md-10">
                    <div class="col-md-12" id="uploadButton" style="cursor: pointer;">
                        <input id="articleImg" class="imageInput" onclick="javascript:upload();" name="pic" type="file" style="">
                        <p id="fileName" style="height: 40px;margin:0px;line-height: 40px;">
                            点击上传图片
                        </p>
                    </div>
                </div>
                <div class="col-md-2" style="padding: 0px;">
                    <span class="j-uploadButton">确认上传</span>
                </div>
            </div>
        </div>
      </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="showCover">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="set_page">
                            
                            <a role="button" class="set_add  _j_uploaderattop _j_upload_toppic" id="_j_upload_toppic"></a>
                            <h2 style="margin: 0px 0px 10px 0px;">设置游记头图</h2>
                            <p>图片建议选择尺寸大于1680px的高清大图，如相机原图</p>
                            <div class="clear"></div>
                        </div>
                    </div>  
                </div>
                
                <div class="row" style="margin-top: 100px;">
                    <div class="container">
                        <div class="row">
                            <div class="set_title">
                                <input type="text" id="_j_title" value="" placeholder="填写游记标题" maxlength="48">
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
    </div>
    <div class="container" style="margin-top: 50px;">
        <div class="row">
            <div class="col-md-9" style="padding: 0px;">
                <div class="edit" id="target"></div>
            </div>
            <div class="col-md-3 btn-list" style="padding-left: 50px;">
                <!-- <div class="row">
                    <a role="button" class="add-btn _j_insert_choice"><i class="icon-photo"></i>插入图片</a>
                </div> -->
                <div class="row">
                    <a role="button" class="add-save _j_save"><i class="icon-photo"></i>暂时保存</a>
                </div>

                <div class="row">
                    <a role="button" class="add-save _j_save"><i class="icon-photo"></i>发表</a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
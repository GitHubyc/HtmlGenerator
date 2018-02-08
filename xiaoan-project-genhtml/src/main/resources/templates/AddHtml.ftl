<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity4"
      xmlns:shiro="http://www.pollix.at/thymeleaf/shiro">
<head>
    <meta charset="utf-8">
    <title>添加${table_annotation}</title>
    <!-- 公共css -->
    <link th:replace="fragments/configcss :: css"/>
</head>

<body>
<div class="x_panel">
    <div class="x_top x_top1 clearfix">
        <h4>新增${table_annotation}信息</h4>
    </div>

    <div class="x_content ">
        <form class="form-horizontal" id="${modelName}_add" onsubmit="return false;">
            <input type="hidden" name="isOpenAccount" value="0"> <input
                type="hidden" name="threeColorWarning" value="3">

            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">

                    <div class="pic_updateimg">
                        <div class="pic">
                            <img class="Img" id="pic" src="../img/noimage.png"/>
                            <div id="upload-info"></div>
                        </div>
                        <a id="upload-target" class="btn btn-blue btn-color">
                            添加${table_annotation}图片<i class="glyphicon glyphicon-plus"
                                     style="margin-left: 5px;"></i>
                        </a> <input type="hidden" name="${modelName?uncap_first}Img"/>
                    </div>
                </div>


                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                    <div class="form_content">
                        <h4 class="font_ioc_blue">
                            <strong><i class="fa fa-gear"></i>填写${table_annotation}信息</strong>
                        </h4>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <#list model_column?keys as key>
                                    <div class="item form-group">
                                        <label class="text-left col-lg-4 col-md-4 col-sm-4 col-xs-12 control-label">${model_column[key].Remarks}:</label>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                            <input class="form-control" name="${model_column[key].ChangeColumnName}" placeholder="请输入${model_column[key].Remarks}"/>
                                        </div>
                                    </div>
                                </#list>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="item form-group">
                                    <label class="text-left col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label">详情:</label>
                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                        <textarea class="form-control" name="${modelName?uncap_first}Details" placeholder="请输入详情"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <button type="submit" class="btn btn-success">提交</button>
                            <button type="reset" class="btn btn-primary">重置</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<!-- 公共js -->
<script th:replace="fragments/configjs :: js" type="text/javascript"></script>
<!-- 图片上传-->
<script type="text/javascript" src="../js/Q.js"></script>
<script type="text/javascript" src="../js/Q.Uploader.js"></script>
<script type="text/javascript" src="../js/uploader.js"></script>

<script src="../js/${modelName?uncap_first}/${modelName}_add.js"></script>
</html>



<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity4"
      xmlns:shiro="http://www.pollix.at/thymeleaf/shiro">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>主页</title>
    <!-- 公共css -->
    <link th:replace="fragments/configcss :: css"/>
    <!-- 自定义样式 -->
    <link href="../css/list.css" rel="stylesheet" media="screen">
</head>
<body>
<div class="container">
    <!-- 头部 -->
    <div th:replace="fragments/header :: header">头部</div>
    <div class="content_x">
        <!-- 左菜单 -->
        <div th:replace="fragments/menu :: menu">左菜单</div>
        <!--右内容 -->
        <div class="right_col">
            <div class="right_top clearfix">
                <form class="form-horizontal form_style" id="${modelName?uncap_first}_list_form">
                    <!--搜索条 -->
                    <div id="top_box" style="display: block">
                        <div class="col-lg-5 col-md-8 col-sm-8 col-xs-7">
                            <input type="hidden" name="currentPage" value="1"/>
                            <input type="hidden" name="pageSize" value="12"/>
                            <div class="input-group left_s">
                                <span class="input-group-btn">
                                    <button type="button" class="s_search_right btn btn-default form_left">组合查询
                                        <span class="caret"></span>
                                    </button>
                                </span>
                                <i class="ioc_line"></i>
                                <input type="text" class="form-input" placeholder="输入你要查询的问题">
                                <span class="input-group-btn">
                                    <button onclick="page(1)" class="s_search btn btn-blue btn-color ">
                                        <i class="fa fa-search"></i>检索
                                    </button>
                                </span>
                            </div>
                        </div>
                        <!--搜索条结束 -->
                        <div class="right col-lg-7 col-md-4 col-sm-4 col-xs-3">

                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="s_type clearfix" style="display:none">
                        <div class="form-horizontal">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <h4 class="font_ioc_blue">
                                    <strong><i class="fa fa-gear"></i>多条件组合查询</strong>
                                </h4>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                        <#list model_column?keys as key>
                                            <div class="item form-group">
                                                <label class="text-left col-lg-4 col-md-4 col-sm-4 col-xs-12 control-label">${model_column[key].Remarks}
                                                    :</label>
                                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                    <input class="form-control" name="${model_column[key].ChangeColumnName}"
                                                           placeholder="请输入${model_column[key].Remarks}"
                                                           th:value="${r"$"}{paramMap.${model_column[key].ChangeColumnName}}"/>
                                                </div>
                                            </div>
                                        </#list>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <input type="hidden" name="display">
                            <button class="btn btn-success" type="submit" onclick="page(1)">提交</button>
                            <button class="btn btn-primary" id="cencel" type="button">取消</button>
                        </div>
                    </div>

                </form>
            </div>
            <div class="padding_20">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <div class="s_panel text-left">
                            <!-- 内容标题 -->
                            <div class="x_top clearfix">
                                <div class="font-left">
                                    <h5>${table_annotation}列表</h5>
                                </div>
                                <div class="pull-right font_black">
                                    <a href="JavaScript:void(0)" id="${modelName}_add"
                                       class="btn btn-blue btn-color pull-right">
                                        <span>新增${table_annotation}</span>
                                        <i class="fa_icon fa-plus"></i>
                                    </a>
                                </div>
                            </div>
                            <!-- 内容标题结束 -->
                            <div class="s_content">
                                <ul class="list_table">
                                    <table class="table table-hover text-center">
                                        <thead>
                                        <tr class="active">
                                            <th style="display:none"></th>
                                            <th>图片</th>
                                            <th>名称</th>
                                            <#list model_column?keys as key>
                                                <th>${model_column[key].Remarks}</th>
                                            </#list>
                                            <th>详情</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>

                                        <tbody th:if="${r"$"}{object.data !=null  and object.data !='null' and  not #lists.isEmpty(object.data)}">
                                        <tr th:each="${modelName?uncap_first} : ${r"$"}{object.data}">
                                            <td style="display:none"
                                                th:text="${r"$"}{${modelName?uncap_first}.${modelName?uncap_first}Id}"></td>
                                            <td>
                                                <img class="list_icon" style="height:50px;width:30.9px;"
                                                     th:src="${r"$"}{${modelName?uncap_first}.${modelName?uncap_first}Img}==null?'../img/noimage.png':${r"$"}{${modelName?uncap_first}.${modelName?uncap_first}Img}">
                                                <img class="img_show"
                                                     th:src="${r"$"}{${modelName?uncap_first}.${modelName?uncap_first}Img}==null?'../img/noimage.png':${r"$"}{${modelName?uncap_first}.${modelName?uncap_first}Img}"
                                                     width="100%" style="display: none;">
                                            </td>
                                            <td>
                                                <a href="javascript:(0)" class="${modelName}_details"
                                                   th:text="${r"$"}{${modelName?uncap_first}.${modelName?uncap_first}Name}"
                                                   th:id="${r"$"}{${modelName?uncap_first}.${modelName?uncap_first}Id}"></a>
                                            </td>
                                            <#list model_column?keys as key>
                                             <td th:text="${r"${"}${modelName?uncap_first}.${model_column[key].ChangeColumnName}}"></td>
                                            </#list>
                                            <td><a class="details"><i class="fa fa-sign-in"></i>
                                                <div style="display:none"
                                                     th:text="${r"$"}{${modelName?uncap_first}.${modelName?uncap_first}Details}"></div>
                                            </a></td>
                                            <td>
                                                <a class="fa fa-lg fa-pencil ${modelName}_edit"
                                                   href="JavaScript:void(0)"
                                                   th:id="${r"$"}{${modelName?uncap_first}.${modelName?uncap_first}Id}"
                                                   title="修改"></a>
                                                <a class="fa fa-lg fa-times ${modelName}_del" href="JavaScript:void(0)"
                                                   th:id="${r"$"}{${modelName?uncap_first}.${modelName?uncap_first}Id}"
                                                   title="删除"></a>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <dl class="list_table"
                                        th:if="${r"$"}{object.data == null or object.data =='null' or #lists.isEmpty(object.data)}">
                                        <div class="null">暂无数据</div>
                                    </dl>
                                </ul>
                                <div th:replace="fragments/page :: page('${modelName?uncap_first}_list_form','/${modelName?uncap_first}/list')">
                                    分页
                                </div>
                            </div>
                            <div class="s_content" th:if="${r"$"}{object.status} != 200">
                                <dl class="list_table">
                                    <div class="null">你访问的资源不存在,请重新登录</div>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<!-- 公共js -->
<script th:replace="fragments/configjs :: js" type="text/javascript"></script>

<script type="text/javascript" src="../js/list.js"></script>
<script type="text/javascript" src="../js/${modelName?uncap_first}/${modelName}_list.js"></script>
</html>
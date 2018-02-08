$(document).ready(function(){
    Uploader('upload-target','fileimgid');
    //添加验证
    $('#${modelName}_add')
    .bootstrapValidator({
        message: 'This value is not valid',
        live: 'enabled',
        trigger:'blur keyup',
        feedbackIcons: {//input状态样式图片
            valid: 'glyphicon ',
            invalid: 'glyphicon ',
            validating: 'glyphicon '
        },
        container: 'popover',
        fields: {//验证：规则
            <#list model_column?keys as key>
                 ${model_column[key].ChangeColumnName}:{
                    message:'${model_column[key].Remarks}',
                      validators: {
                          notEmpty: {
                              message: '${model_column[key].Remarks}不能为空'
                          }
                      }
                },
            </#list>
        }
    }).on('success.form.bv', function(e) {//点击提交之后
        e.preventDefault();
        var $form = $(e.target);
        var bv = $form.data('bootstrapValidator');
        if( bv.isValid()){
            var data = {};
            var t = $('#${modelName}_add').serializeArray();
            $.each(t, function() {
             data[this.name] = this.value;
          });
            data['${modelName?uncap_first}Img']=$("#pic").attr("src");
//            data["icon"] = $('#updateimg').attr("value");
            // 使用Ajax提交form表单数据
    		$.ajax({
     		    url: '/${modelName?uncap_first}/add',
     		    type: 'post',
     		    contentType: "application/json; charset=utf-8",
     	        data: JSON.stringify(data),
     	        dataType: "json",
     	       success : function(data) {
					if (data.status == 200) {
						toastr.success(data.msg);
						setTimeout(function(){
	     		    		parent.layer.closeAll('iframe');
	     		    		window.parent.location.reload();
	     		    	},500);
					} else {
						toastr.error(data.msg);
					}
				},
				error : function(data) {
					toastr.error('服务无响应')
				}
     		});
        }
    });
})

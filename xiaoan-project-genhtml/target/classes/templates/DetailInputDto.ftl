package ${package_name};



import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import java.io.Serializable;
<#if hasDateType == "true">
import java.util.Date;
</#if>
/**
 * 描述:${table_annotation}详细
 * 表名:${table_name}
 * 作者:${author}
 * 时间:${date}
 */
 
@ApiModel(value = "${table_annotation}详细", description = "${table_annotation}详细")
@Data
public class ${modelName?cap_first}DetailInputDto implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "${table_annotation}ID", name = "${table_key_change?uncap_first}", example = "${table_annotation}ID")
    private String ${table_key_change?uncap_first};//${table_annotation}ID
}

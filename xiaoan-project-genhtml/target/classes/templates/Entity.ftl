package ${package_name};

import lombok.Data;
<#if hasDateType == "true">
import java.util.Date;
</#if>
/**
 * 描述:${table_annotation}
 * 表名:${table_name}
 * 作者:${author}
 * 时间:${date}
 */
@Data
public class ${modelName?cap_first}Entity {
<#list model_column?keys as key>
    <#if model_column[key].ColumnType == "NUMBER">

    private Integer ${model_column[key].ChangeColumnName};//${model_column[key].Remarks}
    <#elseif model_column[key].ColumnType == "FLOAT">

    private Float ${model_column[key].ChangeColumnName};//${model_column[key].Remarks}
    <#elseif model_column[key].ColumnType == "DATE">

    private Date ${model_column[key].ChangeColumnName};//${model_column[key].Remarks}
    <#else>

    private String ${model_column[key].ChangeColumnName};//${model_column[key].Remarks}
    </#if>
</#list>
}

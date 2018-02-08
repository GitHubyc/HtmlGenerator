package ${package_name};

import java.util.List;

import ${entityPackage};

/**
 * ${table_annotation}数据库层
 * 作者:${author}
 * 时间:${date}
 */
public interface ${modelName}Dao {

	/**
	 * 增加
	 */
	public int save(${modelName}Entity ${modelName?uncap_first}Entity) ;

	/**
	 * 批量添加
	 */
	public void savaBatch(List<${modelName}Entity> ${modelName?uncap_first}List);

	/**
	 * 删除
	 */
	<#assign tablekeytype="" />
	<#--主键类型-->
	<#if table_key_type?default('NVARCHAR2') == "NUMBER">
		<#assign tablekeytype="Integer" />
	<#elseif table_key_type?default('NVARCHAR2') == "FLOAT">
		<#assign tablekeytype="Float" />
	<#else>
		<#assign tablekeytype="String" />
	</#if>
	public int delete(${tablekeytype} ${table_key?uncap_first}) ;

	/**
	 * 批量删除
	 */
	public void deleteBatch(List<${modelName}Entity> ${modelName?uncap_first}List);

	/**
	 * 修改
	 */
	public int update(${modelName}Entity ${modelName?uncap_first}Entity) ;

	/**
	 * 批量修改
	 */
	public void updateBatch(List<${modelName}Entity> ${modelName?uncap_first}List);

	/**
	 * 查询单个对象
	 */
	<#assign tablekeytype="" />
	<#--主键类型-->
	<#if table_key_type?default('NVARCHAR2') == "NUMBER">
		<#assign tablekeytype="Integer" />
	<#elseif table_key_type?default('NVARCHAR2') == "FLOAT">
		<#assign tablekeytype="Float" />
	<#else>
		<#assign tablekeytype="String" />
	</#if>
	public List<${modelName}Entity> findOne(${modelName}Entity ${modelName?uncap_first}Entity) ;

	/**
	 * 查询所有
	 */
	public List<${modelName}Entity> findAll(int page,int pageSize,${modelName}Entity ${modelName?uncap_first}Entity);

	/**
	 * 统计
	 */
	public int count(${modelName}Entity ${modelName?uncap_first}Entity) ;
}

package ${package_name};

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import ${daoPackage};
import ${entityPackage};
import org.springframework.util.StringUtils;

/**
 * ${table_annotation}数据库实现层
 * 作者:${author}
 * 时间:${date}
 */
@Repository
public class ${modelName}DaoImpl implements ${modelName}Dao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	/**
	 * 增加
	 */
	@Override
	public int save(${modelName}Entity ${modelName?uncap_first}Entity) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		<#--拼装SQL语句-->
		<#assign tablecolums="" />
		<#assign parameters="" />
		<#list model_column?keys as key>
			<#if key_has_next>
				<#assign tablecolums = tablecolums+"${key?upper_case}"+"," />
				<#assign parameters = parameters+"?," />
			<#else>
				<#assign tablecolums = tablecolums+"${key?upper_case}"/>
				<#assign parameters = parameters+"?"/>
			</#if>
		</#list>

		sql.append("INSERT INTO ${table_name} (${tablecolums}) VALUES (${parameters})");
		<#--遍历赋值-->
		<#list model_column?keys as key>
		params.add(${modelName?uncap_first}Entity.get${model_column[key].ChangeColumnName?cap_first}());
		</#list>

		return this.jdbcTemplate.update(sql.toString(), params.toArray());

	}

	/**
	 * 批量增加
	 */
	@Override
	public void savaBatch(final List<${modelName}Entity> ${modelName?uncap_first}List) {
		<#--拼装SQL语句-->
		<#assign tablecolums="" />
		<#assign parameters="" />
		<#list model_column?keys as key>
			<#if key_has_next>
				<#assign tablecolums = tablecolums+"${key?upper_case}"+"," />
				<#assign parameters = parameters+"?," />
			<#else>
				<#assign tablecolums = tablecolums+"${key?upper_case}"/>
				<#assign parameters = parameters+"?"/>
			</#if>
		</#list>
		String sql = "INSERT INTO ${table_name} (${tablecolums}) VALUES (${parameters})";
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				${modelName}Entity ${modelName?uncap_first}Entity = ${modelName?uncap_first}List.get(i);
				<#list model_column?keys as key>
				<#--数字类型-->
				<#if model_column[key].ColumnType == "NUMBER">
				ps.setInt(${key_index+1}, ${modelName?uncap_first}Entity.get${model_column[key].ChangeColumnName?cap_first}());
				<#--浮点类型-->
				<#elseif model_column[key].ColumnType == "FLOAT">
				ps.setFloat(${key_index+1}, ${modelName?uncap_first}Entity.get${model_column[key].ChangeColumnName?cap_first}());
				<#--日期类型-->
				<#elseif model_column[key].ColumnType == "DATE">
				ps.setDate(${key_index+1}, new java.sql.Date(${modelName?uncap_first}Entity.get${model_column[key].ChangeColumnName?cap_first}().getTime()));
				<#--字符串类型-->
				<#else>
				ps.setString(${key_index+1}, ${modelName?uncap_first}Entity.get${model_column[key].ChangeColumnName?cap_first}());
				</#if>
				</#list>
			}

			public int getBatchSize() {
				return ${modelName?uncap_first}List.size();
			}
		});
	}

	/**
	 * 删除
	 */
	@Override
	<#assign tablekeytype="" />
	<#--主键类型-->
	<#if table_key_type?default('NVARCHAR2') == "NUMBER">
		<#assign tablekeytype="Integer" />
	<#elseif table_key_type?default('NVARCHAR2') == "FLOAT">
		<#assign tablekeytype="Float" />
	<#else>
		<#assign tablekeytype="String" />
	</#if>
	public int delete(${tablekeytype} ${table_key?uncap_first}) {
		StringBuffer sql = new StringBuffer();
		sql.append("DELETE FROM ${table_name} WHERE ${table_key?upper_case}=?");
		return this.jdbcTemplate.update(sql.toString(), ${table_key?uncap_first});
	}

	/**
	 * 批量删除
	 */
	@Override
	public void deleteBatch(final List<${modelName}Entity> ${modelName?uncap_first}List) {
		String sql="DELETE FROM ${table_name} WHERE ${table_key?upper_case}=? ";

		this.jdbcTemplate.batchUpdate(sql,new BatchPreparedStatementSetter() {
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				${modelName}Entity ${modelName?uncap_first}Entity = ${modelName?uncap_first}List.get(i);
				<#if table_key_type?default('NVARCHAR2') == "NUMBER">
				ps.setInt(1, ${modelName?uncap_first}Entity.get${table_key_change?cap_first}());
				<#elseif table_key_type?default('NVARCHAR2') == "FLOAT">
				ps.setFloat(1, ${modelName?uncap_first}Entity.get${table_key_change?cap_first}());
				<#else>
				ps.setString(1, ${modelName?uncap_first}Entity.get${table_key_change?cap_first}());
				</#if>
			}
			public int getBatchSize() {
				return ${modelName?uncap_first}List.size();
			}
		});
	}


	/**
	 * 更新
	 */
	@Override
	public int update(${modelName}Entity ${modelName?uncap_first}Entity) {
		StringBuffer sql = new StringBuffer();
		List<Object> params = new ArrayList<Object>();
		sql.append("UPDATE ${table_name} SET ");
		<#--遍历赋值-->
		<#list model_column?keys as key>
		if (!StringUtils.isEmpty(${modelName?uncap_first}Entity.get${model_column[key].ChangeColumnName?cap_first}())) 
		{
		     sql.append(" ${key?upper_case}=?, ");
		     params.add(${modelName?uncap_first}Entity.get${model_column[key].ChangeColumnName?cap_first}());
		}
		</#list>
		sql.delete(sql.lastIndexOf(","), sql.lastIndexOf(",")+1);
		sql.append(" WHERE ${table_key?upper_case}=? ");
		params.add(${modelName?uncap_first}Entity.get${table_key_change?cap_first}());

		return this.jdbcTemplate.update(sql.toString(), params.toArray());

	}

	/**
	 * 批量更新
	 */
	@Override
	<#assign updatetablekeytype="" />
	<#--主键类型-->
	<#if table_key_type?default('NVARCHAR2') == "NUMBER">
		<#assign updatetablekeytype="Int" />
	<#elseif table_key_type?default('NVARCHAR2') == "FLOAT">
		<#assign updatetablekeytype="Float" />
	<#else>
		<#assign updatetablekeytype="String" />
	</#if>
	public void updateBatch(final List<${modelName}Entity> ${modelName?uncap_first}List) {
		<#--拼装SQL语句-->
		<#assign tablecolums="" />
		<#list model_column?keys as key>
			<#if key_has_next>
				<#assign tablecolums = tablecolums+"${key?upper_case}"+"=? ," />
			<#else>
				<#assign tablecolums = tablecolums+"${key?upper_case}=? "/>
			</#if>
		</#list>
		String sql="UPDATE ${table_name} SET ${tablecolums} WHERE ${table_key?upper_case}=? ";

		this.jdbcTemplate.batchUpdate(sql,new BatchPreparedStatementSetter() {
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				${modelName}Entity ${modelName?uncap_first}Entity = ${modelName?uncap_first}List.get(i);
				<#list model_column?keys as key>
				<#--数字类型-->
				<#if model_column[key].ColumnType == "NUMBER">
				ps.setInt(${key_index+1}, ${modelName?uncap_first}Entity.get${model_column[key].ChangeColumnName?cap_first}());
				<#--浮点类型-->
				<#elseif model_column[key].ColumnType == "FLOAT">
				ps.setFloat(${key_index+1}, ${modelName?uncap_first}Entity.get${model_column[key].ChangeColumnName?cap_first}());
				<#--日期类型-->
				<#elseif model_column[key].ColumnType == "DATE">
				ps.setDate(${key_index+1}, new java.sql.Date(${modelName?uncap_first}Entity.get${model_column[key].ChangeColumnName?cap_first}().getTime()));
				<#--字符串类型-->
				<#else>
				ps.setString(${key_index+1}, ${modelName?uncap_first}Entity.get${model_column[key].ChangeColumnName?cap_first}());
				</#if>
				</#list>
				ps.set${updatetablekeytype}(${model_column?size+1}, ${modelName?uncap_first}Entity.get${table_key_change?cap_first}());
			}

			public int getBatchSize() {
				return ${modelName?uncap_first}List.size();
			}
		});
	}

	/**
	 * 查询单个对象
	 */
	@Override
	<#assign tablekeytype="" />
	<#--主键类型-->
	<#if table_key_type?default('NVARCHAR2') == "NUMBER">
		<#assign tablekeytype="Integer" />
	<#elseif table_key_type?default('NVARCHAR2') == "FLOAT">
		<#assign tablekeytype="Float" />
	<#else>
		<#assign tablekeytype="String" />
	</#if>
	public List<${modelName}Entity> findOne(${modelName}Entity ${modelName?uncap_first}Entity) {
		StringBuffer sql = new StringBuffer();
        List<Object> params = new ArrayList<Object>();
		sql.append("SELECT * FROM ${table_name} WHERE 1=1");

		<#--遍历-->
		<#list model_column?keys as key>
		if (!StringUtils.isEmpty(${modelName?uncap_first}Entity.get${model_column[key].ChangeColumnName?cap_first}()))
		{
			sql.append(" AND ${key?upper_case}=? ");
			params.add(${modelName?uncap_first}Entity.get${model_column[key].ChangeColumnName?cap_first}());
		}
		</#list>

        return this.jdbcTemplate.query(sql.toString(), params.toArray(), new BeanPropertyRowMapper(${modelName}Entity.class));
	}

	/**
	 * 分页查询所有
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<${modelName}Entity> findAll(int currentPage, int pageSize, ${modelName}Entity ${modelName?uncap_first}Entity) {
		StringBuffer sql = new StringBuffer();
		List<Object> params = new ArrayList<Object>();

		sql.append("SELECT * FROM ( SELECT A.*, ROWNUM RN FROM (SELECT * FROM ${table_name} WHERE 1=1 ");

		<#--遍历-->
		<#list model_column?keys as key>
		if (!StringUtils.isEmpty(${modelName?uncap_first}Entity.get${model_column[key].ChangeColumnName?cap_first}())) 
		{
			sql.append(" AND ${key?upper_case}=? ");
			params.add(${modelName?uncap_first}Entity.get${model_column[key].ChangeColumnName?cap_first}());
		}
		</#list>

		sql.append(") A WHERE ROWNUM <= ?) WHERE RN >= ? ");
        int tempcurrent=currentPage;
        currentPage =  (currentPage-1) * pageSize+1;
        pageSize = tempcurrent * pageSize;
        params.add(pageSize);
		params.add(currentPage);

		return this.jdbcTemplate.query(sql.toString(), params.toArray(), new BeanPropertyRowMapper(${modelName}Entity.class));
	}

	/**
	 * 统计
	 */
	@Override
	public int count(${modelName}Entity ${modelName?uncap_first}Entity) {
		StringBuffer sql = new StringBuffer();
		List<Object> params = new ArrayList<Object>();
		sql.append("SELECT COUNT(*) FROM ${table_name} WHERE 1=1 ");

		<#--遍历-->
		<#list model_column?keys as key>
		if (!StringUtils.isEmpty(${modelName?uncap_first}Entity.get${model_column[key].ChangeColumnName?cap_first}())) 
		{
			sql.append(" AND ${key?upper_case}=? ");
			params.add(${modelName?uncap_first}Entity.get${model_column[key].ChangeColumnName?cap_first}());
		}
		</#list>

		return this.jdbcTemplate.queryForObject(sql.toString(), params.toArray(), Integer.class);
	}
}

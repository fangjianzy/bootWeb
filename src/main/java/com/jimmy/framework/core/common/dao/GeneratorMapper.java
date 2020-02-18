package com.jimmy.framework.core.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

public interface GeneratorMapper {
	@Select("<script> select table_name tableName, engine, table_comment tableComment, create_time createTime from information_schema.tables"
			+ " where table_schema = (select database())"
			+ " <if test='tableName != null'> and table_name = #{tableName}</if>  "
			+ " ORDER BY createTime DESC "
			+ " <if test='offset != null and limit != null'>"
			+ "    limit #{offset}, #{limit}"
		    + "</if>"
			+ "</script>")
	List<Map<String, Object>> list(Map<String, Object> map);

	@Select("<script> select count(*) from information_schema.tables where table_schema = (select database()) "
			+ " <if test='tableName != null'> and table_name = #{tableName}</if>  "
			+ " </script>")
	int count(Map<String, Object> map);

	@Select("select table_name tableName, engine, table_comment tableComment, create_time createTime from information_schema.tables \r\n"
			+ "	where table_schema = (select database()) and table_name = #{tableName}")
	Map<String, String> get(String tableName);

	@Select("select column_name columnName, data_type dataType, column_comment columnComment, column_key columnKey, extra from information_schema.columns\r\n"
			+ " where table_name = #{tableName} and table_schema = (select database()) order by ordinal_position")
	List<Map<String, String>> listColumns(String tableName);
}

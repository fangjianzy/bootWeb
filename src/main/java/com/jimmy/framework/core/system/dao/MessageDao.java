package com.jimmy.framework.core.system.dao;

import com.jimmy.framework.core.system.domain.MessageDO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * @author jimmy.fang
 * @email yyjcf1986@163.com
 * @date 2019-09-16 17:07:25
 */
@Mapper
public interface MessageDao {
	/**
	 *根据ID获取对象
	*/
	MessageDO get(Long mid);
	
	/**
	 *
	 * 根据查询对象获取list数据
	*/
	List<MessageDO> list(Map<String,Object> map);
	
	/**
	 *
	 * 根据查询对象获取数据条数，主要用于分页
	*/
	int count(Map<String,Object> map);
	
	/**
	 *
	 * 保存对象
	*/
	int save(MessageDO message);
	
	/**
	 *
	 * 更新对象
	*/
	int update(MessageDO message);
	
	/**
	 *
	 * 删除对象
	*/
	int remove(Long mid);
	/**
	 *
	 * 批量删除对象
	*/
	int batchRemove(Long[] mids);
}

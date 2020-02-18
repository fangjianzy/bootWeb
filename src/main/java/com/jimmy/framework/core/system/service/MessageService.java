package com.jimmy.framework.core.system.service;

import com.jimmy.framework.core.system.domain.MessageDO;
import com.jimmy.framework.core.common.entity.PageDO;
import com.jimmy.framework.core.common.utils.PageUtils;
import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author jimmy.fang
 * @email yyjcf1986@163.com
 * @date 2019-09-16 17:07:25
 */
public interface MessageService {
	
	/**
	 *根据ID获取对象
	*/
	MessageDO get(Long mid);
	
	/**
	 *根据列表对象
	*/
	List<MessageDO> list(Map<String, Object> map);
	
	/**
	 *获取列表对象数据，主用于分页
	*/
	int count(Map<String, Object> map);
	
	/**
	 *保存对象
	*/
	int save(MessageDO message);
	
	/**
	 *更新对象
	*/
	int update(MessageDO message);
	
	/**
	 *删除对象
	*/
	int remove(Long mid);
	
	/**
	 *批量删除对象
	*/
	int batchRemove(Long[] mids);
	
	/**
	* 高度整合分页方式
	*/
	PageDO<MessageDO> queryPageList(Map<String, Object> query);
}

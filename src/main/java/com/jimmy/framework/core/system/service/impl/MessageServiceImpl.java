package com.jimmy.framework.core.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jimmy.framework.core.common.utils.PageUtils;
import java.util.List;
import java.util.Map;
import com.jimmy.framework.core.common.entity.PageDO;
import com.jimmy.framework.core.system.dao.MessageDao;
import com.jimmy.framework.core.system.domain.MessageDO;
import com.jimmy.framework.core.system.service.MessageService;



@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDao messageDao;
	
	@Override
	public MessageDO get(Long mid){
		return messageDao.get(mid);
	}
	
	@Override
	public List<MessageDO> list(Map<String, Object> map){
		return messageDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return messageDao.count(map);
	}
	
	@Override
	public int save(MessageDO message){
		return messageDao.save(message);
	}
	
	@Override
	public int update(MessageDO message){
		return messageDao.update(message);
	}
	
	@Override
	public int remove(Long mid){
		return messageDao.remove(mid);
	}
	
	@Override
	public int batchRemove(Long[] mids){
		return messageDao.batchRemove(mids);
	}
	
	/**
	* 另外一种分页方式
	*/
	@Override
	public PageDO<MessageDO> queryPageList(Map<String, Object> query){
		int total = messageDao.count(query);
		List<MessageDO> listDatas = messageDao.list(query);
		PageDO<MessageDO> page = new PageDO<>();
		page.setTotal(total);
		page.setRows(listDatas);
		return page;
	}
	
	
	
}

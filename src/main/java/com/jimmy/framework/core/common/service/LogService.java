package com.jimmy.framework.core.common.service;

import org.springframework.stereotype.Service;

import com.jimmy.framework.core.common.entity.LogDO;
import com.jimmy.framework.core.common.entity.PageDO;
import com.jimmy.framework.core.common.utils.Query;
@Service
public interface LogService {
	void save(LogDO logDO);
	PageDO<LogDO> queryList(Query query);
	int remove(Long id);
	int batchRemove(Long[] ids);
}

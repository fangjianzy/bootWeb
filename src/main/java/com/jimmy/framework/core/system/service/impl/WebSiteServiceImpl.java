package com.jimmy.framework.core.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jimmy.framework.core.system.dao.WebSiteDao;
import com.jimmy.framework.core.system.entity.WebSite;
import com.jimmy.framework.core.system.service.WebSiteService;

@Transactional
@Service
public class WebSiteServiceImpl implements WebSiteService {
	
	@Autowired
	private WebSiteDao webSiteMapper;
		
	@Override
	public WebSite get(Long id) {
		return webSiteMapper.get(id);
	}

	@Override
	public int save(WebSite website) {
		return webSiteMapper.save(website);
	}

	@Override
	public int update(WebSite website) {
		return webSiteMapper.update(website);
	}

	@Override
	public int remove(Long id) {
		return webSiteMapper.remove(id);
	}

}

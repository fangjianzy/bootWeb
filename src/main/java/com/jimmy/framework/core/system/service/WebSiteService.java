package com.jimmy.framework.core.system.service;

import org.springframework.stereotype.Service;

import com.jimmy.framework.core.system.entity.WebSite;

/**
 * 网站设置服务
 * @author Jimmy.fang
 *
 */
@Service
public interface WebSiteService {
	WebSite get(Long id);
	
	int save(WebSite website);
	
	int update(WebSite website);
	
	int remove(Long id);
}

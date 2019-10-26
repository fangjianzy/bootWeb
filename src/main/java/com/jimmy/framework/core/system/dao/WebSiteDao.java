package com.jimmy.framework.core.system.dao;

import org.apache.ibatis.annotations.Mapper;

import com.jimmy.framework.core.system.entity.WebSite;

@Mapper
public interface WebSiteDao {
	
	WebSite get(Long id);
	
	int save(WebSite website);
	
	int update(WebSite website);
	
	int remove(Long id);
}

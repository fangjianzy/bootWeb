package com.jimmy.framework.core.system.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.jimmy.framework.core.system.entity.RoleDO;

@Service
public interface RoleService {

	RoleDO get(Long id);

	List<RoleDO> list(Map<String, Object> params);
	int count(Map<String, Object> params);
	
	int save(RoleDO role);

	int update(RoleDO role);

	int remove(Long id);

	List<RoleDO> list(Long userId);

	int batchremove(Long[] ids);
}

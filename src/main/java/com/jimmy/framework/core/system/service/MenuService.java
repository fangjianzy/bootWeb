package com.jimmy.framework.core.system.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.jimmy.framework.core.common.entity.Tree;
import com.jimmy.framework.core.common.utils.Query;
import com.jimmy.framework.core.system.entity.MenuDO;

@Service
public interface MenuService {
	Tree<MenuDO> getSysMenuTree(Long id);

	List<Tree<MenuDO>> listMenuTree(Long id);

	Tree<MenuDO> getTree();

	Tree<MenuDO> getTree(Long id);

	List<MenuDO> list(Map<String, Object> params);

	int remove(Long id);

	int save(MenuDO menu);

	int update(MenuDO menu);

	MenuDO get(Long id);

	Set<String> listPerms(Long userId);

	List<Tree<MenuDO>> listAllMenuTree();

	int count(Map<String, Object> params);
}

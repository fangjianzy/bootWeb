package com.jimmy.framework.core.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jimmy.framework.core.common.controller.BaseController;
import com.jimmy.framework.core.common.entity.Tree;
import com.jimmy.framework.core.system.entity.MenuDO;
import com.jimmy.framework.core.system.service.DeptService;
import com.jimmy.framework.core.system.service.MenuService;
import com.jimmy.framework.core.system.service.RoleService;

/**
 * 树桩菜单
 * 
 * @author jimmy
 * @email yyjcf1986@163.com
 * @date 2019-08-29 18:28:07
 */
@RequestMapping("/sys/tree")
@Controller
public class TreeController extends BaseController{
	
	String prefix = "system/tree";
	
	@Autowired
	MenuService menuService;
	
	@Autowired
	private DeptService sysDeptService;
	
	@Autowired
	RoleService roleService;
	
	@GetMapping()
	String tree(Model model) {
		Tree<MenuDO>  tree = menuService.getTree();
		model.addAttribute("menutree", tree);
		return prefix + "/tree";
	}
	/*
	 * 部门树
	 */
	@GetMapping("/deptTree")
	String deptTree(Model model) {
		Tree<MenuDO>  tree = menuService.getTree();
		model.addAttribute("deptTree", tree);
		return prefix + "/deptTree";
	}
}

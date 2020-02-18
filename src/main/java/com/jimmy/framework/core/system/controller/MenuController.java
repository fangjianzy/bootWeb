package com.jimmy.framework.core.system.controller;

import com.jimmy.framework.core.common.annotation.Log;
import com.jimmy.framework.core.common.config.Constant;
import com.jimmy.framework.core.common.controller.BaseController;
import com.jimmy.framework.core.common.entity.Tree;
import com.jimmy.framework.core.common.utils.Query;
import com.jimmy.framework.core.common.utils.R;
import com.jimmy.framework.core.system.entity.MenuDO;
import com.jimmy.framework.core.system.service.MenuService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 资源菜单
 * @author jimmy
 * @email yyjcf1986@163.com
 * @date 2019-08-29 18:28:07
 */
@RequestMapping("/sys/menu")
@Controller
public class MenuController extends BaseController {
	String prefix = "system/menu";
	@Autowired
	MenuService menuService;

	@GetMapping()
	String menu(Model model) {
		return prefix+"/menu";
	}
	/**
	 * 标准返回格式
	 * @param params
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	R list(@RequestParam Map<String, Object> params) {
		// 查询列表数据
		Query query = new Query(params);
		List<MenuDO> menus = menuService.list(query);
		int total = menuService.count(query);
		Map map = new HashMap();
		map.put("data", menus);
		map.put("total", total);
		return  R.ok(map);
	}

	@Log("添加菜单")
	@GetMapping("/add/{pId}")
	String add(Model model, @PathVariable("pId") Long pId) {
		model.addAttribute("pId", pId);
		if (pId == 0) {
			model.addAttribute("pName", "根目录");
		} else {
			model.addAttribute("pName", menuService.get(pId).getName());
		}
		return prefix + "/menu_add";
	}

	@Log("编辑菜单")
	@GetMapping("/edit/{id}")
	String edit(Model model, @PathVariable("id") Long id) {
		MenuDO mdo = menuService.get(id);
		Long pId = mdo.getParentId();
		model.addAttribute("pId", pId);
		if (pId == 0) {
			model.addAttribute("pName", "根目录");
		} else {
			model.addAttribute("pName", menuService.get(pId).getName());
		}
		model.addAttribute("menu", mdo);
		return prefix+"/menu_edit";
	}

	@Log("保存菜单")
	@PostMapping("/save")
	@ResponseBody
	R save(@RequestBody MenuDO menu) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		if (menuService.save(menu) > 0) {
			return R.ok();
		} else {
			return R.error(1, "保存失败");
		}
	}

	@Log("更新菜单")
	@PostMapping("/update")
	@ResponseBody
	R update(MenuDO menu) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		if (menuService.update(menu) > 0) {
			return R.ok();
		} else {
			return R.error(1, "更新失败");
		}
	}

	@Log("删除菜单")
	@PostMapping("/remove")
	@ResponseBody
	R remove(Long id) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		if (menuService.remove(id) > 0) {
			return R.ok();
		} else {
			return R.error(1, "删除失败");
		}
	}

	@GetMapping("/tree")
	@ResponseBody
	Tree<MenuDO> tree() {
		Tree<MenuDO>  tree = menuService.getTree();
		return tree;
	}

	@GetMapping("/tree/{roleId}")
	@ResponseBody
	Tree<MenuDO> tree(@PathVariable("roleId") Long roleId) {
		Tree<MenuDO> tree = menuService.getTree(roleId);
		return tree;
	}

	@ResponseBody
	@GetMapping("/permission/tree")
	List<Tree<MenuDO>> permissionTree() {
		List<Tree<MenuDO>> trees = menuService.listAllMenuTree();
		return trees;
	}


}

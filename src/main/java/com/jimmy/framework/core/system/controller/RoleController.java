package com.jimmy.framework.core.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jimmy.framework.core.common.annotation.Log;
import com.jimmy.framework.core.common.config.Constant;
import com.jimmy.framework.core.common.controller.BaseController;
import com.jimmy.framework.core.common.utils.Query;
import com.jimmy.framework.core.common.utils.R;
import com.jimmy.framework.core.system.entity.RoleDO;
import com.jimmy.framework.core.system.service.RoleService;

/**
 * 全系管理
 * 
 * @author jimmy
 * @email yyjcf1986@163.com
 * @date 2019-08-29 18:28:07
 */
@RequestMapping("/sys/role")
@Controller
public class RoleController extends BaseController {
	String prefix = "system/role";
	@Autowired
	RoleService roleService;

	@GetMapping()
	String role() {
		return prefix + "/role";
	}

	@GetMapping("/list")
	@ResponseBody()
	R list(@RequestParam Map<String, Object> params) {
		// 查询列表数据
		Query query = new Query(params);
		List<RoleDO> roles = roleService.list(query);
		int total = roleService.count(query);
		Map map = new HashMap();
		map.put("data", roles);
		map.put("total", total);
		//PageUtils pageUtil = new PageUtils(sysUserList, total);
		return R.ok(map);
	}

	@Log("添加角色")
	@GetMapping("/add")
	String add() {
		return prefix + "/role_add";
	}

	@Log("编辑角色")
	@GetMapping("/edit/{id}")
	String edit(@PathVariable("id") Long id, Model model) {
		RoleDO roleDO = roleService.get(id);
		model.addAttribute("role", roleDO);
		return prefix + "/role_edit";
	}

	@Log("保存角色")
	@PostMapping("/save")
	@ResponseBody()
	R save(@RequestBody RoleDO role) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		if (roleService.save(role) > 0) {
			return R.ok();
		} else {
			return R.error(1, "保存失败");
		}
	}

	@Log("更新角色")
	@PostMapping("/update")
	@ResponseBody()
	R update(@RequestBody RoleDO role) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		if (roleService.update(role) > 0) {
			return R.ok();
		} else {
			return R.error(1, "保存失败");
		}
	}

	@Log("删除角色")
	@PostMapping("/remove")
	@ResponseBody()
	R save(Long id) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		if (roleService.remove(id) > 0) {
			return R.ok();
		} else {
			return R.error(1, "删除失败");
		}
	}
	
	@Log("批量删除角色")
	@PostMapping("/batchRemove")
	@ResponseBody
	R batchRemove(@RequestParam("ids[]") Long[] ids) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		int r = roleService.batchremove(ids);
		if (r > 0) {
			return R.ok();
		}
		return R.error();
	}
}

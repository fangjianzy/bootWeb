package com.jimmy.framework.core.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartFile;

import com.jimmy.framework.core.common.annotation.Log;
import com.jimmy.framework.core.common.config.Constant;
import com.jimmy.framework.core.common.controller.BaseController;
import com.jimmy.framework.core.common.entity.Tree;
import com.jimmy.framework.core.common.service.DictService;
import com.jimmy.framework.core.common.utils.MD5Utils;
import com.jimmy.framework.core.common.utils.PageUtils;
import com.jimmy.framework.core.common.utils.Query;
import com.jimmy.framework.core.common.utils.R;
import com.jimmy.framework.core.system.entity.DeptDO;
import com.jimmy.framework.core.system.entity.RoleDO;
import com.jimmy.framework.core.system.entity.UserDO;
import com.jimmy.framework.core.system.service.RoleService;
import com.jimmy.framework.core.system.service.UserService;
import com.jimmy.framework.core.system.vo.UserVO;

/**
 * 用户管理
 * 
 * @author jimmy
 * @email yyjcf1986@163.com
 * @date 2019-08-29 18:28:07
 */
@RequestMapping("/sys/user")
@Controller
public class UserController extends BaseController {
	private String prefix="system/user"  ;
	@Autowired
	UserService userService;
	@Autowired
	RoleService roleService;
	@Autowired
	DictService dictService;
	@GetMapping("")
	String user(Model model) {
		return prefix + "/user_list";
	}

	@GetMapping("/list")
	@ResponseBody
	R list(@RequestParam Map<String, Object> params) {
		// 查询列表数据
		Query query = new Query(params);
		List<UserDO> sysUserList = userService.list(query);
		int total = userService.count(query);
		Map map = new HashMap();
		map.put("data", sysUserList);
		map.put("total", total);
		//PageUtils pageUtil = new PageUtils(sysUserList, total);
		return R.ok(map);
	}

	@Log("添加用户")
	@GetMapping("/add")
	String add(Model model) {
		Map<String, Object>  query = new HashMap<String, Object>();
		List<RoleDO> roles = roleService.list(query);
		model.addAttribute("roles", roles);
		return prefix + "/user_add";
	}

	@Log("编辑用户")
	@GetMapping("/edit/{id}")
	String edit(Model model, @PathVariable("id") Long id) {
		UserDO userDO = userService.get(id);
		model.addAttribute("user", userDO);
		List<RoleDO> roles = roleService.list(id);
		model.addAttribute("roles", roles);
		return prefix+"/user_edit";
	}


	@GetMapping("/check/{id}")
	String check(Model model, @PathVariable("id") Long id) {
		UserDO userDO = userService.get(id);
		model.addAttribute("user", userDO);
//		List<RoleDO> roles = roleService.list(id);
//		model.addAttribute("roles", roles);
		return prefix+"/check";
	}

	@Log("保存用户")
	@PostMapping("/save")
	@ResponseBody
	R save(@RequestBody UserDO user) {
		System.out.println(user.getName());
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		String defaultPwd = "123456";
		user.setStatus(1);
		user.setPassword(MD5Utils.encrypt(user.getUsername(), defaultPwd));
		if (userService.save(user) > 0) {
			return R.ok();
		}
		return R.error();
	}

	@Log("更新用户")
	@PostMapping("/update")
	@ResponseBody
	R update(@RequestBody UserDO user) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		if (userService.update(user) > 0) {
			return R.ok();
		}
		return R.error();
	}


	@Log("更新用户")
	@PostMapping("/updatePeronal")
	@ResponseBody
	R updatePeronal(UserDO user) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		if (userService.updatePersonal(user) > 0) {
			return R.ok();
		}
		return R.error();
	}


	@Log("删除用户")
	@PostMapping("/remove")
	@ResponseBody
	R remove(Long id) {
		System.out.println("id="+id);
		if (userService.remove(id) > 0) {
			return R.ok();
		}
		return R.error();
	}

	@Log("批量删除用户")
	@PostMapping("/batchRemove")
	@ResponseBody
	R batchRemove(@RequestParam("ids[]") Long[] userIds) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		int r = userService.batchremove(userIds);
		if (r > 0) {
			return R.ok();
		}
		return R.error();
	}

	@PostMapping("/exit")
	@ResponseBody
	boolean exit(@RequestParam Map<String, Object> params) {
		// 存在，不通过，false
		return !userService.exit(params);
	}

	@Log("请求更改用户密码")
	@GetMapping("/resetPwd")
	String resetPwd(Model model) {
		UserDO userDO  = userService.get(getUserId());
		model.addAttribute("user", userDO);
		return prefix + "/user_resetpwd";
	}

	@Log("提交更改用户密码")
	@PostMapping("/resetPwd")
	@ResponseBody
	R resetPwd(UserVO userVO) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		try{
			userService.resetPwd(userVO,getUser());
			return R.ok();
		}catch (Exception e){
			return R.error(1,e.getMessage());
		}

	}
	@Log("admin提交更改用户密码")
	@PostMapping("/adminResetPwd")
	@ResponseBody
	R adminResetPwd(UserVO userVO) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		try{
			userService.adminResetPwd(userVO);
			return R.ok();
		}catch (Exception e){
			return R.error(1,e.getMessage());
		}

	}
	@GetMapping("/tree")
	@ResponseBody
	public Tree<DeptDO> tree() {
		Tree<DeptDO> tree = new Tree<DeptDO>();
		tree = userService.getTree();
		return tree;
	}

	@GetMapping("/treeView")
	String treeView() {
		return  prefix + "/userTree";
	}

	@GetMapping("/personal")
	String personal(Model model) {
		UserDO userDO  = userService.get(getUserId());
		model.addAttribute("user",userDO);
		model.addAttribute("hobbyList",dictService.getHobbyList(userDO));
		model.addAttribute("sexList",dictService.getSexList());
		return prefix + "/user_personal";
	}
	@ResponseBody
	@PostMapping("/uploadImg")
	R uploadImg(@RequestParam("avatar_file") MultipartFile file, String avatar_data, HttpServletRequest request) {
		if ("test".equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		Map<String, Object> result = new HashMap<>();
		try {
			result = userService.updatePersonalImg(file, avatar_data, getUserId());
		} catch (Exception e) {
			return R.error("更新图像失败！");
		}
		if(result!=null && result.size()>0){
			return R.ok(result);
		}else {
			return R.error("更新图像失败！");
		}
	}
}

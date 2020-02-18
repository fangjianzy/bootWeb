package com.jimmy.framework.core.system.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jimmy.framework.core.common.annotation.Log;
import com.jimmy.framework.core.common.controller.BaseController;
import com.jimmy.framework.core.common.entity.FileDO;
import com.jimmy.framework.core.common.entity.Tree;
import com.jimmy.framework.core.common.service.FileService;
import com.jimmy.framework.core.common.utils.JSONUtils;
import com.jimmy.framework.core.common.utils.MD5Utils;
import com.jimmy.framework.core.common.utils.Query;
import com.jimmy.framework.core.common.utils.R;
import com.jimmy.framework.core.common.utils.ShiroUtils;
import com.jimmy.framework.core.system.entity.MenuDO;
import com.jimmy.framework.core.system.entity.WebSite;
import com.jimmy.framework.core.system.service.MenuService;
import com.jimmy.framework.core.system.service.WebSiteService;

/**
 * 登陆相关
 * 
 * @author jimmy
 * @email yyjcf1986@163.com
 * @date 2019-08-29 18:28:07
 */
@Controller
public class LoginController extends BaseController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private MenuService menuService;
	@Autowired
	private FileService fileService;
	@Autowired
	private WebSiteService webSiteService;
	
	@GetMapping({ "/", "" })
	String welcome(Model model) {

		return "redirect:/login";
	}

	@Log("请求访问主页")
	@GetMapping({ "/index2" })
	String index2(Model model) {
		List<Tree<MenuDO>> menus = menuService.listMenuTree(getUserId());
		model.addAttribute("menus", menus);
		model.addAttribute("name", getUser().getName());
		FileDO fileDO = fileService.get(getUser().getPicId());
		if(fileDO!=null&&fileDO.getUrl()!=null){
			if(fileService.isExist(fileDO.getUrl())){
				model.addAttribute("picUrl",fileDO.getUrl());
			}else {
				model.addAttribute("picUrl","/img/photo_s.jpg");
			}
		}else {
			model.addAttribute("picUrl","/img/photo_s.jpg");
		}
		model.addAttribute("username", getUser().getUsername());
		return "index_v2";
	}
	
	@Log("请求访问主页")
	@GetMapping({ "/console/index" })
	String index(Model model) {
		List<Tree<MenuDO>> menus = menuService.listMenuTree(getUserId());
		System.out.println(JSONUtils.beanToJson(menus));
		model.addAttribute("menus", menus);
		model.addAttribute("name", getUser().getName());
		FileDO fileDO = fileService.get(getUser().getPicId());
		if(fileDO!=null&&fileDO.getUrl()!=null){
			if(fileService.isExist(fileDO.getUrl())){
				model.addAttribute("picUrl",fileDO.getUrl());
			}else {
				model.addAttribute("picUrl","/img/photo_s.jpg");
			}
		}else {
			model.addAttribute("picUrl","/img/photo_s.jpg");
		}
		
		WebSite website = this.webSiteService.get(1L);
		model.addAttribute("sys", website);
		
		model.addAttribute("username", getUser().getUsername());
		return "index_v1";
	}

	@GetMapping("/login")
	String login(Model model) {
		WebSite website = this.webSiteService.get(1L);
		model.addAttribute("sys", website);
		return "login";
	}

	@Log("登录")
	@PostMapping("/login")
	@ResponseBody
	R ajaxLogin(String username, String password) {
		Map result = new HashMap<>(4);
    	Map map1 = new HashMap();
		password = MD5Utils.encrypt(username, password);
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		Subject subject = SecurityUtils.getSubject();
		try {
			subject.login(token);
			result.put("code", 0);
            result.put("msg", "登录成功");
            map1.put("access_token", subject.getSession().getId());
            result.put("data", map1);
			return R.ok(result);
		} catch (AuthenticationException e) {
			return R.error("用户或密码错误");
		}
	}

	@GetMapping("/logout")
	String logout() {
		ShiroUtils.logout();
		return "redirect:/login";
	}

	@GetMapping("/main")
	String main(Model model) {
		String userName = getUser().getUsername();
		if(userName!=null && userName!=""){

			Map<String, Object> params = new LinkedHashMap<String, Object>();
			params.put("userName", userName);
			params.put("offset",0);
			params.put("limit",5);
			//待办
			Query query = new Query(params); 
			
			
		}
		return "main";
	}

	
	
	
	private static String  getDayHourStr(String stayedHoursStr){
		if(stayedHoursStr!=null&&!"".equals(stayedHoursStr)){
			Double day = new Double(stayedHoursStr)/24;
			String dayStr = String.format("%.2f", day);
			int dotIndex = dayStr.indexOf(".");
			String dayStrZh = !"0".equals(dayStr.substring(0,dotIndex)) ? dayStr.substring(0,dotIndex)+"天" : "" ;
			Double hour =  new Double("0"+dayStr.substring(dotIndex,dayStr.length()))*24;
			String hourStrZh = String.format("%.2f", hour)+"小时";
			
			stayedHoursStr = dayStrZh + hourStrZh;
			
		}
		return stayedHoursStr;
	}
	
	@Log("访问模板页面")
	@RequestMapping(value = "/home/demo/{filename}")
	public String html(@PathVariable("filename") String filename){
		
        return "/home/demo/"+filename;
	}
	
	@Log("注册")
	@RequestMapping(value = "/sys/regAction")
	public String regAction(Model model){
		WebSite website = this.webSiteService.get(1L);
		model.addAttribute("sys", website);
        return "/system/login/regAction";
	}
	
	@Log("忘记密码")
	@RequestMapping(value = "/sys/forgetAction")
	public String forgetAction(Model model){
		WebSite website = this.webSiteService.get(1L);
		model.addAttribute("sys", website);
        return "/system/login/forgetAction";
	}
	
	
	public static void main(String[] args) {
		System.out.println(getDayHourStr("64"));
	}
}

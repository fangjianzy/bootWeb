package com.jimmy.framework.core.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jimmy.framework.core.common.annotation.Log;
import com.jimmy.framework.core.common.controller.BaseController;
import com.jimmy.framework.core.common.utils.R;
import com.jimmy.framework.core.system.entity.WebSite;
import com.jimmy.framework.core.system.service.WebSiteService;

/**
 * 网站设置controller
 * @author Jimmy.fang
 * @date 2019-9-6
 */
@RequestMapping("/sys/website")
@Controller
public class WebSiteController extends BaseController{
	private String prefix="system/website";
	@Autowired
	private WebSiteService webSiteService;
	
	@GetMapping("")
	String websiteString(Model model) {
		WebSite website = webSiteService.get(1L);
		model.addAttribute("website", website);
		return prefix + "/website_view";
	}
	
	@Log("添加信息")
	@GetMapping("/add")
	String add(Model model,WebSite website) {
		webSiteService.save(website);
		model.addAttribute("website", website);
		return prefix + "/website_add";
	}

	@Log("更新系统设置信息")
	@PostMapping("/edit")
	@ResponseBody
	R edit(Model model,@RequestBody WebSite dto) {
		WebSite website = webSiteService.get(dto.getId());
		website.setSiteName(dto.getSiteName());
		website.setSiteWwwname(dto.getSiteWwwname());
		website.setCacheTime(dto.getCacheTime());
		website.setMaxFilekb(dto.getMaxFilekb());
		website.setFileUploadtype(dto.getFileUploadtype());
		website.setIndexTitle(dto.getIndexTitle());
		website.setMetaKey(dto.getMetaKey());
		website.setMetaInfo(dto.getMetaInfo());
		website.setSiteVersion(dto.getSiteVersion());
		model.addAttribute("website", website);
		if(webSiteService.update(website)>0){
			return R.ok();
		}else{
			return R.error();
		}
	}
	
	@Log("获取信息")
	@GetMapping("/findByid/{id}")
	String findByid(Model model, @PathVariable("id") Long id) {
		WebSite website = webSiteService.get(id);
		model.addAttribute("website", website);
		return prefix+"/website_view";
	}
}

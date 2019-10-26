package com.jimmy.framework.core.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jimmy.framework.core.common.controller.BaseController;


@RequestMapping("/sys/emailsite")
@Controller
public class EmailController extends BaseController{
	private String prefix="system/website";
	
	@GetMapping("")
	String websiteString(Model model) {
		return prefix + "/email_view";
	}
}

package com.jimmy.framework.core.common.controller;

import org.springframework.stereotype.Controller;

import com.jimmy.framework.core.common.utils.ShiroUtils;
import com.jimmy.framework.core.system.entity.UserDO;

/**
 * 常规公共controller
 * @author jimmy
 * @email yyjcf1986@163.com
 * @date 2019-08-29 18:28:07
 */
@Controller
public class BaseController {
	public UserDO getUser() {
		return ShiroUtils.getUser();
	}

	public Long getUserId() {
		return getUser().getUserId();
	}

	public String getUsername() {
		return getUser().getUsername();
	}
}
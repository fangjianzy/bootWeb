package com.jimmy.framework.core.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/common/websocket")
@Controller
public class WebSocketController {
	
	String prefix = "common/websocket";
	
	@GetMapping("/topic")
	String topic(Model model) {
		return prefix + "/topic";
	}
	
	@GetMapping("/queue")
	String queue(Model model) {
		return prefix + "/queue";
	}

}

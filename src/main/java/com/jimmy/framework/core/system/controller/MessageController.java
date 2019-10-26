package com.jimmy.framework.core.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jimmy.framework.core.system.domain.MessageDO;
import com.jimmy.framework.core.system.service.MessageService;
import com.jimmy.framework.core.common.utils.Query;
import com.jimmy.framework.core.common.utils.R;
import com.jimmy.framework.core.common.controller.BaseController;
import com.jimmy.framework.core.common.entity.PageDO;
import com.jimmy.framework.core.common.utils.PageUtils;

/**
 * 
 * 
 * @author jimmy.fang
 * @email yyjcf1986@163.com
 * @date 2019-09-16 17:07:25
 */
@Controller
@RequestMapping("/system/message")
public class MessageController extends BaseController{

	private String prefix="system/message"  ;
	
	@Autowired
	private MessageService messageService;
	
	@GetMapping()
	//@RequiresPermissions("system:message:message")
	String Message(Model model){
		Map<String, Object> query = new HashMap<String, Object>();
		query.put("toUser", super.getUserId());//查询本人
		query.put("ready", '0');//查询未读
		int readyAll = 0,notice=0,direct=0;
		readyAll = this.messageService.count(query);
		
		query.put("msgType", "notice");//查询通知未读
		notice = this.messageService.count(query);
		
		Map<String, Object> query2 = new HashMap<String, Object>();
		query2.put("toUser", super.getUserId());//查询本人
		query2.put("ready", '0');//查询未读
		query2.put("msgType", "direct");//查询私信未读
		direct = this.messageService.count(query2);
		
		model.addAttribute("readyAll", readyAll);
		model.addAttribute("notice", notice);
		model.addAttribute("direct", direct);
		
	    return prefix+"/message";
	}
	
	@ResponseBody
	@GetMapping("/list")
	//@RequiresPermissions("system:message:message")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
        query.put("toUser", super.getUserId());
        PageDO<MessageDO>  page = messageService.queryPageList(query);
		//List<MessageDO> messageList = messageService.list(query);
		//int total = messageService.count(query);
		Map map = new HashMap();
		map.put("data", page.getRows());
		map.put("total", page.getTotal());
		return R.ok(map);
	}
	
	@GetMapping("/add")
	//@RequiresPermissions("system:message:add")
	String add(){
	    return prefix+"/message_add";
	}

	@GetMapping("/edit/{mid}")
	//@RequiresPermissions("system:message:edit")
	String edit(@PathVariable("mid") Long mid,Model model){
		MessageDO message = messageService.get(mid);
		model.addAttribute("message", message);
	    return prefix+"/message_edit";
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	//@RequiresPermissions("system:message:add")
	public R save(@RequestBody MessageDO message){
		if(messageService.save(message)>0){
			return R.ok();
		}
		return R.error();
	}
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	//@RequiresPermissions("system:message:edit")
	public R update(@RequestBody MessageDO message){
		messageService.update(message);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/remove")
	@ResponseBody
	//@RequiresPermissions("system:message:remove")
	public R remove( Long mid){
		if(messageService.remove(mid)>0){
		return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 批量删除
	 */
	@PostMapping( "/batchRemove")
	@ResponseBody
	//@RequiresPermissions("system:message:batchRemove")
	public R remove(@RequestParam("ids[]") Long[] mids){
		messageService.batchRemove(mids);
		return R.ok();
	}
	
}

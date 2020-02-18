package com.jimmy.framework.core.system.domain;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author jimmy.fang
 * @email yyjcf1986@163.com
 * @date 2019-09-16 17:07:25
 */
public class MessageDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//主键
	private Long mid;
	//标题内容
	private String msgTitle;
	//信息类型
	private String msgType;
	//标记读取
	private Integer ready;
	//时间
	private Date msgTime;
	//发送人
	private Long fromUser;
	//接收人
	private Long toUser;

	/**
	 * 设置：主键
	 */
	public void setMid(Long mid) {
		this.mid = mid;
	}
	/**
	 * 获取：主键
	 */
	public Long getMid() {
		return mid;
	}
	/**
	 * 设置：标题内容
	 */
	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}
	/**
	 * 获取：标题内容
	 */
	public String getMsgTitle() {
		return msgTitle;
	}
	/**
	 * 设置：信息类型
	 */
	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}
	/**
	 * 获取：信息类型
	 */
	public String getMsgType() {
		return msgType;
	}
	/**
	 * 设置：标记读取
	 */
	public void setReady(Integer ready) {
		this.ready = ready;
	}
	/**
	 * 获取：标记读取
	 */
	public Integer getReady() {
		return ready;
	}
	/**
	 * 设置：时间
	 */
	public void setMsgTime(Date msgTime) {
		this.msgTime = msgTime;
	}
	/**
	 * 获取：时间
	 */
	public Date getMsgTime() {
		return msgTime;
	}
	/**
	 * 设置：发送人
	 */
	public void setFromUser(Long fromUser) {
		this.fromUser = fromUser;
	}
	/**
	 * 获取：发送人
	 */
	public Long getFromUser() {
		return fromUser;
	}
	/**
	 * 设置：接收人
	 */
	public void setToUser(Long toUser) {
		this.toUser = toUser;
	}
	/**
	 * 获取：接收人
	 */
	public Long getToUser() {
		return toUser;
	}
}

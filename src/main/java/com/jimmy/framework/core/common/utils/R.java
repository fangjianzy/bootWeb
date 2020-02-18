package com.jimmy.framework.core.common.utils;

import java.util.HashMap;
import java.util.Map;
/**
 * 实现页面传值
 * layUI的配置文件中要跟这对应
 * @author Jimmy.fang
 *
 */
public class R extends HashMap<String, Object> {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 初始化
	 */
	public R() {
		put("code", 0);
		put("msg", "操作成功");
	}
	/**
	 * 返回错误
	 * @return
	 */
	public static R error() {
		return error(1, "操作失败");
	}
	/**
	 * 给错误信息的返回
	 * @param msg
	 * @return
	 */
	public static R error(String msg) {
		return error(500, msg);
	}
	/**
	 * 特定情况给code，和错误信息
	 * @param code
	 * @param msg
	 * @return
	 */
	public static R error(int code, String msg) {
		R r = new R();
		r.put("code", code);
		r.put("msg", msg);
		return r;
	}
	/**
	 * 成功返回
	 * @param msg 自定义成功信息
	 * @return
	 */
	public static R ok(String msg) {
		R r = new R();
		r.put("msg", msg);
		return r;
	}
	/**
	 * 成功返回，组装成map对象
	 * @param map
	 * @return
	 */
	public static R ok(Map<String, Object> map) {
		R r = new R();
		r.putAll(map);
		return r;
	}
	/**
	 * 成功返回，直接把对象传给前端
	 * @param data
	 * @return
	 */
	public static R ok(Object data) {
		R r = new R();
		r.put("data", data);
		return r;
	}
	/**
	 * 默认返回成功
	 * @return
	 */
	public static R ok() {
		return new R();
	}

	@Override
	public R put(String key, Object value) {
		super.put(key, value);
		return this;
	}
}

package com.jimmy.framework.core.common.utils;

import java.util.LinkedHashMap;
import java.util.Map;


/**
 * 查询参数
 */
public class Query extends LinkedHashMap<String, Object> {
	private static final long serialVersionUID = 1L;
	// 
	private int offset;
	// 每页条数
	private int limit;

	public Query(Map<String, Object> params) {
		params = processTime(params);
		this.putAll(params);
		// 分页参数,因为layui传到后台的分页总是从1开始
		this.offset = Integer.parseInt(params.get("pageNum").toString());
		this.limit = Integer.parseInt(params.get("pageSize").toString());
		if(offset>=1){
			offset = (offset -1)*limit;
		}else{
			offset= 0;
		}
		this.put("offset", offset);
		this.put("page", offset / limit + 1);
		this.put("limit", limit);
	}

	private Map<String, Object> processTime(Map<String, Object> params){
		Map<String, Object> newParams = new LinkedHashMap<String, Object>();
		newParams.putAll(params);
		params.keySet().forEach(key->{
			if(key.contains("Time")){
				Object valueTmp  = params.get(key)!=null ? params.get(key) : "";
				String valueTmpStr = valueTmp.toString().trim();
				if(valueTmpStr.contains(" - ")){
					String[] arr = valueTmpStr.split(" - ");
					newParams.put(key+"Start", arr[0]);
					newParams.put(key+"End", arr[1].length()==10 ? (arr[1]+" 23:59:59") : arr[1]);
				}
			}
		});
		//newParams.keySet().forEach(key->{System.out.println("key:"+key+" value:"+newParams.get(key));});
		return newParams;
	} 
	
	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.put("offset", offset);
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}
}

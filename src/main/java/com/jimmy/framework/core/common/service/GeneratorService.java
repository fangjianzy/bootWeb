package com.jimmy.framework.core.common.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

/**
 * 代码生成器相关
 * @author jimmy
 * @email yyjcf1986@163.com
 * @date 2019-08-29 18:28:07
 */
@Service
public interface GeneratorService {
	List<Map<String, Object>> list(Map<String, Object> map);
	int count(Map<String, Object> map);
	boolean generatorCode(String[] tableNames);
}

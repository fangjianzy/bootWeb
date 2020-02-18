package com.jimmy.framework.core.common.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jimmy.framework.core.common.dao.GeneratorMapper;
import com.jimmy.framework.core.common.service.GeneratorService;
import com.jimmy.framework.core.common.utils.GenUtils;


@Service
public class GeneratorServiceImpl implements GeneratorService {
	@Autowired
	GeneratorMapper generatorMapper;

	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) {
		List<Map<String, Object>> list = generatorMapper.list(map);
		return list;
	}
	
	@Override
	public int count(Map<String, Object> map) {
		return generatorMapper.count(map);
	}
	
	@Override
	public boolean generatorCode(String[] tableNames) {
		for(String tableName : tableNames){
			//查询表信息
			Map<String, String> table = generatorMapper.get(tableName);
			//查询列信息
			List<Map<String, String>> columns = generatorMapper.listColumns(tableName);
			//生成代码
			try {
				GenUtils.generatorCode(table, columns);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	

}

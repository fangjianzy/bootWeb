package com.jimmy.framework.core.common.utils;



import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.zip.ZipOutputStream;

import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.WordUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;

import com.jimmy.framework.core.common.config.Constant;
import com.jimmy.framework.core.common.entity.ColumnDO;
import com.jimmy.framework.core.common.entity.TableDO;

/**
 * 代码生成器   工具类
 */
public class GenUtils {


    public static List<String> getTemplates() {
        List<String> templates = new ArrayList<String>();
        templates.add("templates/common/generator/domain.java.vm");
        templates.add("templates/common/generator/Dao.java.vm");
        //templates.add("templates/common/generator/Mapper.java.vm");
        templates.add("templates/common/generator/Mapper.xml.vm");
        templates.add("templates/common/generator/Service.java.vm");
        templates.add("templates/common/generator/ServiceImpl.java.vm");
        templates.add("templates/common/generator/Controller.java.vm");
        templates.add("templates/common/generator/list.html.vm");
        templates.add("templates/common/generator/add.html.vm");
        templates.add("templates/common/generator/edit.html.vm");
        //templates.add("templates/common/generator/list.js.vm");
        //templates.add("templates/common/generator/add.js.vm");
        //templates.add("templates/common/generator/edit.js.vm");
        //templates.add("templates/common/generator/menu.sql.vm");
        return templates;
    }

    /**
     * 生成代码
     */
    public static void generatorCode(Map<String, String> table,
                                     List<Map<String, String>> columns) throws IOException{
        //配置信息
        Configuration config = getConfig();
        //表信息
        TableDO tableDO = new TableDO();
        tableDO.setTableName(table.get("tableName"));
        tableDO.setComments(table.get("tableComment"));
        //表名转换成Java类名
        String className = tableToJava(tableDO.getTableName(), config.getString("tablePrefix"), config.getString("autoRemovePre"));
        tableDO.setClassName(className);
        tableDO.setClassname(StringUtils.uncapitalize(className));
        boolean hasBigDecimal = false;
        //列信息
        List<ColumnDO> columsList = new ArrayList<>();
        for (Map<String, String> column : columns) {
            ColumnDO columnDO = new ColumnDO();
            columnDO.setColumnName(column.get("columnName"));
            columnDO.setDataType(column.get("dataType"));
            columnDO.setComments(column.get("columnComment"));
            columnDO.setExtra(column.get("extra"));

            //列名转换成Java属性名
            String attrName = columnToJava(columnDO.getColumnName());
            columnDO.setAttrName(attrName);
            columnDO.setAttrname(StringUtils.uncapitalize(attrName));

            //列的数据类型，转换成Java类型
            String attrType = config.getString(columnDO.getDataType(), "unknowType");
            columnDO.setAttrType(attrType);

            //是否主键
            if ("PRI".equalsIgnoreCase(column.get("columnKey")) && tableDO.getPk() == null) {
                tableDO.setPk(columnDO);
            }
            if(column.get("dataType").equals("decimal")){
            	hasBigDecimal = true;
            }
            columsList.add(columnDO);
        }
        tableDO.setColumns(columsList);

        //没主键，则第一个字段为主键
        if (tableDO.getPk() == null) {
            tableDO.setPk(tableDO.getColumns().get(0));
        }

        //设置velocity资源加载器
        Properties prop = new Properties();
        prop.put("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        Velocity.init(prop);
        //包名全路径
        String fullPackage = config.getString("package")+"."+config.getString("modelname");
        //业务模块名称，不要随意去改动
        String mode_name = config.getString("modelname");
        //封装模板数据
        Map<String, Object> map = new HashMap<>(16);
        map.put("tableName", tableDO.getTableName());
        map.put("comments", tableDO.getComments());
        map.put("pk", tableDO.getPk());
        map.put("className", tableDO.getClassName());
        map.put("classname", tableDO.getClassname());
        map.put("pathName", fullPackage.substring(fullPackage.lastIndexOf(".") + 1));
        map.put("columns", tableDO.getColumns());
        map.put("package", fullPackage);
        map.put("author", config.getString("author"));
        map.put("email", config.getString("email"));
        map.put("datetime", DateUtils.format(new Date(), DateUtils.DATE_TIME_PATTERN));
        map.put("hasBigDecimal", hasBigDecimal);
        VelocityContext context = new VelocityContext(map);

        //获取模板列表
        List<String> templates = getTemplates();
        for (String template : templates) {
        	//String tempFileNameAndvim = template.substring(template.lastIndexOf("/")+1);
        	//String tempFileName = tempFileNameAndvim.replace(".vm", "");
        	//String fileName = className+UnderlineToCodeTools.upperCase(tempFileName);
        	String fileName = getFileName(template, tableDO.getClassname(), tableDO.getClassName(), fullPackage,mode_name);
        	System.out.println(fileName);
            //渲染模板
            //StringWriter sw = new StringWriter();
        	//4创建文件
            File saveFile = new File("D:\\generator-output\\bootAdmin\\"+fileName);
            //获得它的父类文件，如果不存在，就创建
            if (!saveFile.getParentFile().exists()) {
                saveFile.getParentFile().mkdirs();
            }
            //创建文件输出流
            FileOutputStream outStream = new FileOutputStream(saveFile);
            //因为模板整合的时候，需要提供一个Writer，所以创建一个Writer
            OutputStreamWriter writer = new OutputStreamWriter(outStream);
            //创建一个缓冲流
            BufferedWriter bufferWriter = new BufferedWriter(writer);
            Template tpl = Velocity.getTemplate(template, "UTF-8");
            //合并信息
            tpl.merge(context, bufferWriter);
            //强制刷新
            bufferWriter.flush();
            outStream.close();
            bufferWriter.close();
        }
    }


    /**
     * 列名转换成Java属性名
     */
    public static String columnToJava(String columnName) {
        return WordUtils.capitalizeFully(columnName, new char[]{'_'}).replace("_", "");
    }

    /**
     * 表名转换成Java类名
     */
    public static String tableToJava(String tableName, String tablePrefix, String autoRemovePre) {
        if (Constant.AUTO_REOMVE_PRE.equals(autoRemovePre)) {
            tableName = tableName.substring(tableName.indexOf("_") + 1);
        }
        if (StringUtils.isNotBlank(tablePrefix)) {
            tableName = tableName.replace(tablePrefix, "");
        }

        return columnToJava(tableName);
    }

    /**
     * 获取配置信息
     */
    public static Configuration getConfig() {
        try {
            return new PropertiesConfiguration("generator.properties");
        } catch (ConfigurationException e) {
            throw new BDException("获取配置文件失败，", e);
        }
    }

    /**
     * 获取文件名
     */
    public static String getFileName(String template, String classname, String className, String packageName,String mode_name) {
        String packagePath = "main" + File.separator + "java" + File.separator;
        //String modulesname=config.getString("packageName");
        if (StringUtils.isNotBlank(packageName)) {
            packagePath += packageName.replace(".", File.separator) + File.separator;
        }

        if (template.contains("domain.java.vm")) {
            return packagePath + "domain" + File.separator + className + "DO.java";
        }

        if (template.contains("Dao.java.vm")) {
            return packagePath + "dao" + File.separator + className + "Dao.java";
        }

//		if(template.contains("Mapper.java.vm")){
//			return packagePath + "dao" + File.separator + className + "Mapper.java";
//		}

        if (template.contains("Service.java.vm")) {
            return packagePath + "service" + File.separator + className + "Service.java";
        }

        if (template.contains("ServiceImpl.java.vm")) {
            return packagePath + "service" + File.separator + "impl" + File.separator + className + "ServiceImpl.java";
        }

        if (template.contains("Controller.java.vm")) {
            return packagePath + "controller" + File.separator + className + "Controller.java";
        }

        if (template.contains("Mapper.xml.vm")) {
        	return packagePath + "mapping" + File.separator + className + "Mapper.xml";
            //return "main" + File.separator + "resources" + File.separator + "mapper" + File.separator + packageName + File.separator + className + "Mapper.xml";
        }

        if (template.contains("list.html.vm")) {
            return "main" + File.separator + "resources" + File.separator + "templates" + File.separator
                    + mode_name + File.separator + classname + File.separator + classname + ".html";
            //				+ "modules" + File.separator + "generator" + File.separator + className.toLowerCase() + ".html";
        }
        if (template.contains("add.html.vm")) {
            return "main" + File.separator + "resources" + File.separator + "templates" + File.separator
                    + mode_name + File.separator + classname + File.separator + classname + "_add.html";
        }
        if (template.contains("edit.html.vm")) {
            return "main" + File.separator + "resources" + File.separator + "templates" + File.separator
                    + mode_name + File.separator + classname + File.separator + classname + "_edit.html";
        }

//        if (template.contains("list.js.vm")) {
//            return "main" + File.separator + "resources" + File.separator + "static" + File.separator + "js" + File.separator
//                    + "appjs" + File.separator + packageName + File.separator + classname + File.separator + classname + ".js";
//            //		+ "modules" + File.separator + "generator" + File.separator + className.toLowerCase() + ".js";
//        }
//        if (template.contains("add.js.vm")) {
//            return "main" + File.separator + "resources" + File.separator + "static" + File.separator + "js" + File.separator
//                    + "appjs" + File.separator + packageName + File.separator + classname + File.separator + "add.js";
//        }
//        if (template.contains("edit.js.vm")) {
//            return "main" + File.separator + "resources" + File.separator + "static" + File.separator + "js" + File.separator
//                    + "appjs" + File.separator + packageName + File.separator + classname + File.separator + "edit.js";
//        }

//		if(template.contains("menu.sql.vm")){
//			return className.toLowerCase() + "_menu.sql";
//		}

        return null;
    }
}

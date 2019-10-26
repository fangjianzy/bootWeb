/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.180
 Source Server Type    : MySQL
 Source Server Version : 50709
 Source Host           : 192.168.1.180:3306
 Source Schema         : bootweb

 Target Server Type    : MySQL
 Target Server Version : 50709
 File Encoding         : 65001

 Date: 12/10/2019 10:01:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for boot_student
-- ----------------------------
DROP TABLE IF EXISTS `boot_student`;
CREATE TABLE `boot_student`  (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `s_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `scale` decimal(10, 0) NULL DEFAULT NULL COMMENT '分数',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `sdate` datetime(0) NULL DEFAULT NULL COMMENT '考试时间',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of boot_student
-- ----------------------------
INSERT INTO `boot_student` VALUES (1, '方坚', 56, 30, '2019-09-12 16:58:33');
INSERT INTO `boot_student` VALUES (2, '张三', 55, 24, '2019-09-03 16:58:57');
INSERT INTO `boot_student` VALUES (3, '3', 3, 1, NULL);
INSERT INTO `boot_student` VALUES (6, '3', 3, 123, NULL);
INSERT INTO `boot_student` VALUES (7, '5', 5, 5, NULL);
INSERT INTO `boot_student` VALUES (8, '系数', 1, 2, NULL);

-- ----------------------------
-- Table structure for boot_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `boot_sys_user`;
CREATE TABLE `boot_sys_user`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `user_nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `user_account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `user_phone_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `user_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `station` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户状态',
  `org_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属组织机构',
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限ID',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  `dept_head` bigint(20) NULL DEFAULT NULL COMMENT '部门负责人',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1012 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1001, 0, '总裁办', 1, 1, NULL);
INSERT INTO `sys_dept` VALUES (1002, 1001, '技术部', 2, 1, NULL);
INSERT INTO `sys_dept` VALUES (1003, 1001, '产品部', 3, 1, NULL);
INSERT INTO `sys_dept` VALUES (1004, 1001, '运营部', 4, 1, NULL);
INSERT INTO `sys_dept` VALUES (1005, 1001, '行政人事部', 5, 1, NULL);
INSERT INTO `sys_dept` VALUES (1006, 1002, '技术1部', 1, 1, 1);
INSERT INTO `sys_dept` VALUES (1011, 1002, '技术2部', 1, 1, NULL);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `sort` decimal(10, 0) NULL DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint(64) NULL DEFAULT 0 COMMENT '父级编号',
  `create_by` int(64) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_value`(`value`) USING BTREE,
  INDEX `sys_dict_label`(`name`) USING BTREE,
  INDEX `sys_dict_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, '正常', '0', 'del_flag', '删除标记', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (3, '显示', '1', 'show_hide', '显示/隐藏', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (4, '隐藏', '0', 'show_hide', '显示/隐藏', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (5, '是', '1', 'yes_no', '是/否', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (6, '否', '0', 'yes_no', '是/否', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (7, '红色', 'red', 'color', '颜色值', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (8, '绿色', 'green', 'color', '颜色值', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (9, '蓝色', 'blue', 'color', '颜色值', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (10, '黄色', 'yellow', 'color', '颜色值', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (11, '橙色', 'orange', 'color', '颜色值', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (12, '默认主题', 'default', 'theme', '主题方案', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (13, '天蓝主题', 'cerulean', 'theme', '主题方案', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (14, '橙色主题', 'readable', 'theme', '主题方案', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (15, '红色主题', 'united', 'theme', '主题方案', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (16, 'Flat主题', 'flat', 'theme', '主题方案', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (17, '国家', '1', 'sys_area_type', '区域类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (18, '省份、直辖市', '2', 'sys_area_type', '区域类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (19, '地市', '3', 'sys_area_type', '区域类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (20, '区县', '4', 'sys_area_type', '区域类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (21, '公司', '1', 'sys_office_type', '机构类型', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (22, '部门', '2', 'sys_office_type', '机构类型', 70, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (23, '小组', '3', 'sys_office_type', '机构类型', 80, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (24, '其它', '4', 'sys_office_type', '机构类型', 90, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (25, '综合部', '1', 'sys_office_common', '快捷通用部门', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (26, '开发部', '2', 'sys_office_common', '快捷通用部门', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (27, '人力部', '3', 'sys_office_common', '快捷通用部门', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (28, '一级', '1', 'sys_office_grade', '机构等级', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (29, '二级', '2', 'sys_office_grade', '机构等级', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (30, '三级', '3', 'sys_office_grade', '机构等级', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (31, '四级', '4', 'sys_office_grade', '机构等级', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (32, '所有数据', '1', 'sys_data_scope', '数据范围', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (33, '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (34, '所在公司数据', '3', 'sys_data_scope', '数据范围', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (35, '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (36, '所在部门数据', '5', 'sys_data_scope', '数据范围', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (37, '仅本人数据', '8', 'sys_data_scope', '数据范围', 90, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (38, '按明细设置', '9', 'sys_data_scope', '数据范围', 100, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (39, '系统管理', '1', 'sys_user_type', '用户类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (40, '部门经理', '2', 'sys_user_type', '用户类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (41, '普通用户', '3', 'sys_user_type', '用户类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (42, '基础主题', 'basic', 'cms_theme', '站点主题', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (43, '蓝色主题', 'blue', 'cms_theme', '站点主题', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (44, '红色主题', 'red', 'cms_theme', '站点主题', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (45, '文章模型', 'article', 'cms_module', '栏目模型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (46, '图片模型', 'picture', 'cms_module', '栏目模型', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (47, '下载模型', 'download', 'cms_module', '栏目模型', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (48, '链接模型', 'link', 'cms_module', '栏目模型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (49, '专题模型', 'special', 'cms_module', '栏目模型', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (50, '默认展现方式', '0', 'cms_show_modes', '展现方式', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (51, '首栏目内容列表', '1', 'cms_show_modes', '展现方式', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (52, '栏目第一条内容', '2', 'cms_show_modes', '展现方式', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (53, '发布', '0', 'cms_del_flag', '内容状态', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (54, '删除', '1', 'cms_del_flag', '内容状态', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (55, '审核', '2', 'cms_del_flag', '内容状态', 15, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (56, '首页焦点图', '1', 'cms_posid', '推荐位', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (57, '栏目页文章推荐', '2', 'cms_posid', '推荐位', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (58, '咨询', '1', 'cms_guestbook', '留言板分类', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (59, '建议', '2', 'cms_guestbook', '留言板分类', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (60, '投诉', '3', 'cms_guestbook', '留言板分类', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (61, '其它', '4', 'cms_guestbook', '留言板分类', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (62, '公休', '1', 'oa_leave_type', '请假类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (63, '病假', '2', 'oa_leave_type', '请假类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (64, '事假', '3', 'oa_leave_type', '请假类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (65, '调休', '4', 'oa_leave_type', '请假类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (66, '婚假', '5', 'oa_leave_type', '请假类型', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (67, '接入日志', '1', 'sys_log_type', '日志类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (68, '异常日志', '2', 'sys_log_type', '日志类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (69, '请假流程', 'leave', 'act_type', '流程类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (70, '审批测试流程', 'test_audit', 'act_type', '流程类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (71, '分类1', '1', 'act_category', '流程分类', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (72, '分类2', '2', 'act_category', '流程分类', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (73, '增删改查', 'crud', 'gen_category', '代码生成分类', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (74, '增删改查（包含从表）', 'crud_many', 'gen_category', '代码生成分类', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (75, '树结构', 'tree', 'gen_category', '代码生成分类', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (76, '=', '=', 'gen_query_type', '查询方式', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (77, '!=', '!=', 'gen_query_type', '查询方式', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (78, '&gt;', '&gt;', 'gen_query_type', '查询方式', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (79, '&lt;', '&lt;', 'gen_query_type', '查询方式', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (80, 'Between', 'between', 'gen_query_type', '查询方式', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (81, 'Like', 'like', 'gen_query_type', '查询方式', 60, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (82, 'Left Like', 'left_like', 'gen_query_type', '查询方式', 70, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (83, 'Right Like', 'right_like', 'gen_query_type', '查询方式', 80, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (84, '文本框', 'input', 'gen_show_type', '字段生成方案', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (85, '文本域', 'textarea', 'gen_show_type', '字段生成方案', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (86, '下拉框', 'select', 'gen_show_type', '字段生成方案', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (87, '复选框', 'checkbox', 'gen_show_type', '字段生成方案', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (88, '单选框', 'radiobox', 'gen_show_type', '字段生成方案', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (89, '日期选择', 'dateselect', 'gen_show_type', '字段生成方案', 60, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (90, '人员选择', 'userselect', 'gen_show_type', '字段生成方案', 70, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (91, '部门选择', 'officeselect', 'gen_show_type', '字段生成方案', 80, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (92, '区域选择', 'areaselect', 'gen_show_type', '字段生成方案', 90, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (93, 'String', 'String', 'gen_java_type', 'Java类型', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (94, 'Long', 'Long', 'gen_java_type', 'Java类型', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (95, '仅持久层', 'dao', 'gen_category', '代码生成分类', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (96, '男', '1', 'sex', '性别', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (97, '女', '2', 'sex', '性别', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (98, 'Integer', 'Integer', 'gen_java_type', 'Java类型', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (99, 'Double', 'Double', 'gen_java_type', 'Java类型', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (100, 'Date', 'java.util.Date', 'gen_java_type', 'Java类型', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (104, 'Custom', 'Custom', 'gen_java_type', 'Java类型', 90, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (105, '会议通告', '1', 'oa_notify_type', '通知通告类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (106, '奖惩通告', '2', 'oa_notify_type', '通知通告类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (107, '活动通告', '3', 'oa_notify_type', '通知通告类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (108, '草稿', '0', 'oa_notify_status', '通知通告状态', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (109, '发布', '1', 'oa_notify_status', '通知通告状态', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (110, '未读', '0', 'oa_notify_read', '通知通告状态', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (111, '已读', '1', 'oa_notify_read', '通知通告状态', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (112, '草稿', '0', 'oa_notify_status', '通知通告状态', 10, 0, 1, NULL, 1, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (113, '删除', '0', 'del_flag', '删除标记', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (118, '关于', 'about', 'blog_type', '博客类型', NULL, NULL, NULL, NULL, NULL, NULL, '全url是:/blog/open/page/about', '');
INSERT INTO `sys_dict` VALUES (119, '交流', 'communication', 'blog_type', '博客类型', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (120, '文章', 'article', 'blog_type', '博客类型', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (121, '编码', 'code', 'hobby', '爱好', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (122, '绘画', 'painting', 'hobby', '爱好', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (123, '技术类', '1', 'company_system_type', '公司制度类型', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (124, '产品类', '2', 'company_system_type', '公司制度类型', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (125, '运营类', '3', 'company_system_type', '公司制度类型', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (126, '人事类', '4', 'company_system_type', '公司制度类型', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (127, '总裁办', '1', 'company_dept', '公司部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (128, '技术部', '2', 'company_dept', '公司部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (129, '产品部', '3', 'company_dept', '公司部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (130, '运营部', '4', 'company_dept', '公司部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (131, '行政人事部', '5', 'company_dept', '公司部门', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` VALUES (132, '公假', '0', 'leave_type', '请假类别', 1, 0, 1, '2018-10-24 14:06:47', 1, '2018-10-24 14:06:53', NULL, '0');
INSERT INTO `sys_dict` VALUES (133, '病假', '1', 'leave_type', '请假类别', 1, 0, 1, '2018-10-24 14:06:47', 1, '2018-10-24 14:06:53', '', '0');
INSERT INTO `sys_dict` VALUES (134, '调休', '2', 'leave_type', '请假类别', 1, 0, 1, '2018-10-24 14:06:47', 1, '2018-10-24 14:06:53', '', '0');
INSERT INTO `sys_dict` VALUES (135, '事假', '3', 'leave_type', '请假类别', 1, 0, 1, '2018-10-24 14:06:47', 1, '2018-10-24 14:06:53', '', '0');
INSERT INTO `sys_dict` VALUES (136, '探亲假', '4', 'leave_type', '请假类别', 1, 0, 1, '2018-10-24 14:06:47', 1, '2018-10-24 14:06:53', '', '0');
INSERT INTO `sys_dict` VALUES (137, '其他(说明)', '5', 'leave_type', '请假类别', 1, 0, 1, '2018-10-24 14:06:47', 1, '2018-10-24 14:06:53', '', '0');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) NULL DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 148 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (142, 0, '/files/c088d9ad-efc9-48e4-9010-9bd099221ff1.jpg', '2018-09-26 16:47:10');
INSERT INTO `sys_file` VALUES (147, 0, '/files/4c5314fa-7a3b-44c2-bff4-6d2de98d5951.png', '2018-10-12 14:15:36');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `time` int(11) NULL DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8384 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (8367, 1, 'admin', '请求访问主页', 23, 'com.jimmy.framework.core.system.controller.LoginController.index()', '{\"menus\":[{\"attributes\":{\"icon\":\"template\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/system/message\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"90\",\"name\":\"我的通知\",\"parentId\":\"84\",\"spread\":true,\"text\":\"我的通知\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"84\",\"name\":\"通知公告\",\"parentId\":\"0\",\"spread\":true,\"text\":\"通知公告\"},{\"attributes\":{\"icon\":\"user\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/user/personal\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"139\",\"name\":\"基本资料\",\"parentId\":\"138\",\"spread\":true,\"text\":\"基本资料\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/user/resetPwd\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"140\",\"name\":\"修改密码\",\"parentId\":\"138\",\"spread\":true,\"text\":\"修改密码\"}],\"hasChildren\":true,\"hasParent\":true,\"id\":\"138\",\"name\":\"我的设置\",\"parentId\":\"3\",\"spread\":true,\"text\":\"我的设置\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/user\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"6\",\"name\":\"用户管理\",\"parentId\":\"3\",\"spread\":true,\"text\":\"用户管理\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/role\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"7\",\"name\":\"角色管理\",\"parentId\":\"3\",\"spread\":true,\"text\":\"角色管理\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/tree\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"2\",\"name\":\"系统菜单\",\"parentId\":\"3\",\"spread\":true,\"text\":\"系统菜单\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/system/sysDept/treeView\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"73\",\"name\":\"部门管理\",\"parentId\":\"3\",\"spread\":true,\"text\":\"部门管理\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/website\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"134\",\"name\":\"网站设置\",\"parentId\":\"3\",\"spread\":true,\"text\":\"网站设置\"},{\"attributes\":{\"icon\":\"app\",\"url\":\"/common/job\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"144\",\"name\":\"定时任务\",\"parentId\":\"3\",\"spread\":true,\"text\":\"定时任务\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"3\",\"name\":\"系统设置\",\"parentId\":\"0\",\"spread\":true,\"text\":\"系统设置\"},{\"attributes\":{\"icon\":\"senior\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/online\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"92\",\"name\":\"在线用户\",\"parentId\":\"91\",\"spread\":true,\"text\":\"在线用户\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/log\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"27\",\"name\":\"系统日志\",\"parentId\":\"91\",\"spread\":true,\"text\":\"系统日志\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/druid/index.html\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"57\",\"name\":\"运行监控\",\"parentId\":\"91\",\"spread\":true,\"text\":\"运行监控\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/system/message\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"141\",\"name\":\"信息中心\",\"parentId\":\"91\",\"spread\":true,\"text\":\"信息中心\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/websocket/topic\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"142\",\"name\":\"广播\",\"parentId\":\"91\",\"spread\":true,\"text\":\"广播\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/websocket/queue\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"143\",\"name\":\"点对点\",\"parentId\":\"91\",\"spread\":true,\"text\":\"点对点\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"91\",\"name\":\"系统监控\",\"parentId\":\"0\",\"spread\":true,\"text\":\"系统监控\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/dict\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"78\",\"name\":\"数据字典\",\"parentId\":\"1\",\"spread\":true,\"text\":\"数据字典\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/sysFile\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"71\",\"name\":\"文件管理\",\"parentId\":\"1\",\"spread\":true,\"text\":\"文件管理\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"1\",\"name\":\"基础管理\",\"parentId\":\"0\",\"spread\":true,\"text\":\"基础管理\"},{\"attributes\":{\"icon\":\"component\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/chart/graph_echarts.html\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"98\",\"name\":\"百度chart\",\"parentId\":\"77\",\"spread\":true,\"text\":\"百度chart\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/swagger-ui.html\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"104\",\"name\":\"swagger\",\"parentId\":\"77\",\"spread\":true,\"text\":\"swagger\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/generator\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"48\",\"name\":\"代码生成\",\"parentId\":\"77\",\"spread\":true,\"text\":\"代码生成\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/emailsite\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"72\",\"name\":\"邮件服务\",\"parentId\":\"77\",\"spread\":true,\"text\":\"邮件服务\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"77\",\"name\":\"系统工具\",\"parentId\":\"0\"', '192.168.1.199', '2019-09-20 11:30:37');
INSERT INTO `sys_log` VALUES (8368, 1, 'admin', '访问模板页面', 1, 'com.jimmy.framework.core.system.controller.LoginController.html()', NULL, '192.168.1.199', '2019-09-20 11:30:37');
INSERT INTO `sys_log` VALUES (8369, 1, 'admin', '登录', 60, 'com.jimmy.framework.core.system.controller.LoginController.ajaxLogin()', NULL, '192.168.1.199', '2019-09-20 14:28:00');
INSERT INTO `sys_log` VALUES (8370, 1, 'admin', '请求访问主页', 28, 'com.jimmy.framework.core.system.controller.LoginController.index()', '{\"menus\":[{\"attributes\":{\"icon\":\"template\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/system/message\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"90\",\"name\":\"我的通知\",\"parentId\":\"84\",\"spread\":true,\"text\":\"我的通知\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"84\",\"name\":\"通知公告\",\"parentId\":\"0\",\"spread\":true,\"text\":\"通知公告\"},{\"attributes\":{\"icon\":\"user\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/user/personal\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"139\",\"name\":\"基本资料\",\"parentId\":\"138\",\"spread\":true,\"text\":\"基本资料\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/user/resetPwd\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"140\",\"name\":\"修改密码\",\"parentId\":\"138\",\"spread\":true,\"text\":\"修改密码\"}],\"hasChildren\":true,\"hasParent\":true,\"id\":\"138\",\"name\":\"我的设置\",\"parentId\":\"3\",\"spread\":true,\"text\":\"我的设置\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/user\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"6\",\"name\":\"用户管理\",\"parentId\":\"3\",\"spread\":true,\"text\":\"用户管理\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/role\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"7\",\"name\":\"角色管理\",\"parentId\":\"3\",\"spread\":true,\"text\":\"角色管理\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/tree\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"2\",\"name\":\"系统菜单\",\"parentId\":\"3\",\"spread\":true,\"text\":\"系统菜单\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/system/sysDept/treeView\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"73\",\"name\":\"部门管理\",\"parentId\":\"3\",\"spread\":true,\"text\":\"部门管理\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/website\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"134\",\"name\":\"网站设置\",\"parentId\":\"3\",\"spread\":true,\"text\":\"网站设置\"},{\"attributes\":{\"icon\":\"app\",\"url\":\"/common/job\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"144\",\"name\":\"定时任务\",\"parentId\":\"3\",\"spread\":true,\"text\":\"定时任务\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"3\",\"name\":\"系统设置\",\"parentId\":\"0\",\"spread\":true,\"text\":\"系统设置\"},{\"attributes\":{\"icon\":\"senior\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/online\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"92\",\"name\":\"在线用户\",\"parentId\":\"91\",\"spread\":true,\"text\":\"在线用户\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/log\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"27\",\"name\":\"系统日志\",\"parentId\":\"91\",\"spread\":true,\"text\":\"系统日志\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/druid/index.html\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"57\",\"name\":\"运行监控\",\"parentId\":\"91\",\"spread\":true,\"text\":\"运行监控\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/system/message\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"141\",\"name\":\"信息中心\",\"parentId\":\"91\",\"spread\":true,\"text\":\"信息中心\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/websocket/topic\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"142\",\"name\":\"广播\",\"parentId\":\"91\",\"spread\":true,\"text\":\"广播\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/websocket/queue\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"143\",\"name\":\"点对点\",\"parentId\":\"91\",\"spread\":true,\"text\":\"点对点\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"91\",\"name\":\"系统监控\",\"parentId\":\"0\",\"spread\":true,\"text\":\"系统监控\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/dict\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"78\",\"name\":\"数据字典\",\"parentId\":\"1\",\"spread\":true,\"text\":\"数据字典\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/sysFile\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"71\",\"name\":\"文件管理\",\"parentId\":\"1\",\"spread\":true,\"text\":\"文件管理\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"1\",\"name\":\"基础管理\",\"parentId\":\"0\",\"spread\":true,\"text\":\"基础管理\"},{\"attributes\":{\"icon\":\"component\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/chart/graph_echarts.html\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"98\",\"name\":\"百度chart\",\"parentId\":\"77\",\"spread\":true,\"text\":\"百度chart\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/swagger-ui.html\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"104\",\"name\":\"swagger\",\"parentId\":\"77\",\"spread\":true,\"text\":\"swagger\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/generator\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"48\",\"name\":\"代码生成\",\"parentId\":\"77\",\"spread\":true,\"text\":\"代码生成\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/emailsite\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"72\",\"name\":\"邮件服务\",\"parentId\":\"77\",\"spread\":true,\"text\":\"邮件服务\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"77\",\"name\":\"系统工具\",\"parentId\":\"0\"', '192.168.1.199', '2019-09-20 14:28:01');
INSERT INTO `sys_log` VALUES (8371, 1, 'admin', '访问模板页面', 1, 'com.jimmy.framework.core.system.controller.LoginController.html()', NULL, '192.168.1.199', '2019-09-20 14:28:02');
INSERT INTO `sys_log` VALUES (8372, 1, 'admin', '登录', 18, 'com.jimmy.framework.core.system.controller.LoginController.ajaxLogin()', NULL, '192.168.1.199', '2019-09-20 14:55:05');
INSERT INTO `sys_log` VALUES (8373, 1, 'admin', '请求访问主页', 25, 'com.jimmy.framework.core.system.controller.LoginController.index()', '{\"menus\":[{\"attributes\":{\"icon\":\"template\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/system/message\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"90\",\"name\":\"我的通知\",\"parentId\":\"84\",\"spread\":true,\"text\":\"我的通知\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"84\",\"name\":\"通知公告\",\"parentId\":\"0\",\"spread\":true,\"text\":\"通知公告\"},{\"attributes\":{\"icon\":\"user\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/user/personal\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"139\",\"name\":\"基本资料\",\"parentId\":\"138\",\"spread\":true,\"text\":\"基本资料\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/user/resetPwd\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"140\",\"name\":\"修改密码\",\"parentId\":\"138\",\"spread\":true,\"text\":\"修改密码\"}],\"hasChildren\":true,\"hasParent\":true,\"id\":\"138\",\"name\":\"我的设置\",\"parentId\":\"3\",\"spread\":true,\"text\":\"我的设置\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/user\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"6\",\"name\":\"用户管理\",\"parentId\":\"3\",\"spread\":true,\"text\":\"用户管理\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/role\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"7\",\"name\":\"角色管理\",\"parentId\":\"3\",\"spread\":true,\"text\":\"角色管理\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/tree\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"2\",\"name\":\"系统菜单\",\"parentId\":\"3\",\"spread\":true,\"text\":\"系统菜单\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/system/sysDept/treeView\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"73\",\"name\":\"部门管理\",\"parentId\":\"3\",\"spread\":true,\"text\":\"部门管理\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/website\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"134\",\"name\":\"网站设置\",\"parentId\":\"3\",\"spread\":true,\"text\":\"网站设置\"},{\"attributes\":{\"icon\":\"app\",\"url\":\"/common/job\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"144\",\"name\":\"定时任务\",\"parentId\":\"3\",\"spread\":true,\"text\":\"定时任务\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"3\",\"name\":\"系统设置\",\"parentId\":\"0\",\"spread\":true,\"text\":\"系统设置\"},{\"attributes\":{\"icon\":\"senior\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/online\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"92\",\"name\":\"在线用户\",\"parentId\":\"91\",\"spread\":true,\"text\":\"在线用户\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/log\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"27\",\"name\":\"系统日志\",\"parentId\":\"91\",\"spread\":true,\"text\":\"系统日志\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/druid/index.html\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"57\",\"name\":\"运行监控\",\"parentId\":\"91\",\"spread\":true,\"text\":\"运行监控\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/system/message\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"141\",\"name\":\"信息中心\",\"parentId\":\"91\",\"spread\":true,\"text\":\"信息中心\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/websocket/topic\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"142\",\"name\":\"广播\",\"parentId\":\"91\",\"spread\":true,\"text\":\"广播\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/websocket/queue\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"143\",\"name\":\"点对点\",\"parentId\":\"91\",\"spread\":true,\"text\":\"点对点\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"91\",\"name\":\"系统监控\",\"parentId\":\"0\",\"spread\":true,\"text\":\"系统监控\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/dict\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"78\",\"name\":\"数据字典\",\"parentId\":\"1\",\"spread\":true,\"text\":\"数据字典\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/sysFile\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"71\",\"name\":\"文件管理\",\"parentId\":\"1\",\"spread\":true,\"text\":\"文件管理\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"1\",\"name\":\"基础管理\",\"parentId\":\"0\",\"spread\":true,\"text\":\"基础管理\"},{\"attributes\":{\"icon\":\"component\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/chart/graph_echarts.html\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"98\",\"name\":\"百度chart\",\"parentId\":\"77\",\"spread\":true,\"text\":\"百度chart\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/swagger-ui.html\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"104\",\"name\":\"swagger\",\"parentId\":\"77\",\"spread\":true,\"text\":\"swagger\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/generator\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"48\",\"name\":\"代码生成\",\"parentId\":\"77\",\"spread\":true,\"text\":\"代码生成\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/emailsite\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"72\",\"name\":\"邮件服务\",\"parentId\":\"77\",\"spread\":true,\"text\":\"邮件服务\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"77\",\"name\":\"系统工具\",\"parentId\":\"0\"', '192.168.1.199', '2019-09-20 14:55:07');
INSERT INTO `sys_log` VALUES (8374, 1, 'admin', '访问模板页面', 1, 'com.jimmy.framework.core.system.controller.LoginController.html()', NULL, '192.168.1.199', '2019-09-20 14:55:07');
INSERT INTO `sys_log` VALUES (8375, 1, 'admin', '登录', 29, 'com.jimmy.framework.core.system.controller.LoginController.ajaxLogin()', NULL, '192.168.1.199', '2019-09-20 15:39:58');
INSERT INTO `sys_log` VALUES (8376, 1, 'admin', '请求访问主页', 106, 'com.jimmy.framework.core.system.controller.LoginController.index()', '{\"menus\":[{\"attributes\":{\"icon\":\"template\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/system/message\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"90\",\"name\":\"我的通知\",\"parentId\":\"84\",\"spread\":true,\"text\":\"我的通知\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"84\",\"name\":\"通知公告\",\"parentId\":\"0\",\"spread\":true,\"text\":\"通知公告\"},{\"attributes\":{\"icon\":\"user\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/user/personal\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"139\",\"name\":\"基本资料\",\"parentId\":\"138\",\"spread\":true,\"text\":\"基本资料\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/user/resetPwd\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"140\",\"name\":\"修改密码\",\"parentId\":\"138\",\"spread\":true,\"text\":\"修改密码\"}],\"hasChildren\":true,\"hasParent\":true,\"id\":\"138\",\"name\":\"我的设置\",\"parentId\":\"3\",\"spread\":true,\"text\":\"我的设置\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/user\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"6\",\"name\":\"用户管理\",\"parentId\":\"3\",\"spread\":true,\"text\":\"用户管理\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/role\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"7\",\"name\":\"角色管理\",\"parentId\":\"3\",\"spread\":true,\"text\":\"角色管理\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/tree\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"2\",\"name\":\"系统菜单\",\"parentId\":\"3\",\"spread\":true,\"text\":\"系统菜单\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/system/sysDept/treeView\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"73\",\"name\":\"部门管理\",\"parentId\":\"3\",\"spread\":true,\"text\":\"部门管理\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/website\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"134\",\"name\":\"网站设置\",\"parentId\":\"3\",\"spread\":true,\"text\":\"网站设置\"},{\"attributes\":{\"icon\":\"app\",\"url\":\"/common/job\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"144\",\"name\":\"定时任务\",\"parentId\":\"3\",\"spread\":true,\"text\":\"定时任务\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"3\",\"name\":\"系统设置\",\"parentId\":\"0\",\"spread\":true,\"text\":\"系统设置\"},{\"attributes\":{\"icon\":\"senior\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/online\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"92\",\"name\":\"在线用户\",\"parentId\":\"91\",\"spread\":true,\"text\":\"在线用户\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/log\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"27\",\"name\":\"系统日志\",\"parentId\":\"91\",\"spread\":true,\"text\":\"系统日志\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/druid/index.html\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"57\",\"name\":\"运行监控\",\"parentId\":\"91\",\"spread\":true,\"text\":\"运行监控\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/system/message\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"141\",\"name\":\"信息中心\",\"parentId\":\"91\",\"spread\":true,\"text\":\"信息中心\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/websocket/topic\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"142\",\"name\":\"广播\",\"parentId\":\"91\",\"spread\":true,\"text\":\"广播\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/websocket/queue\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"143\",\"name\":\"点对点\",\"parentId\":\"91\",\"spread\":true,\"text\":\"点对点\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"91\",\"name\":\"系统监控\",\"parentId\":\"0\",\"spread\":true,\"text\":\"系统监控\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/dict\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"78\",\"name\":\"数据字典\",\"parentId\":\"1\",\"spread\":true,\"text\":\"数据字典\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/sysFile\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"71\",\"name\":\"文件管理\",\"parentId\":\"1\",\"spread\":true,\"text\":\"文件管理\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"1\",\"name\":\"基础管理\",\"parentId\":\"0\",\"spread\":true,\"text\":\"基础管理\"},{\"attributes\":{\"icon\":\"component\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/swagger-ui.html\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"104\",\"name\":\"swagger\",\"parentId\":\"77\",\"spread\":true,\"text\":\"swagger\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/chart/graph_echarts.html\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"98\",\"name\":\"百度chart\",\"parentId\":\"77\",\"spread\":true,\"text\":\"百度chart\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/generator\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"48\",\"name\":\"代码生成\",\"parentId\":\"77\",\"spread\":true,\"text\":\"代码生成\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/emailsite\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"72\",\"name\":\"邮件服务\",\"parentId\":\"77\",\"spread\":true,\"text\":\"邮件服务\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"77\",\"name\":\"系统工具\",\"parentId\":\"0\"', '192.168.1.199', '2019-09-20 15:39:59');
INSERT INTO `sys_log` VALUES (8377, 1, 'admin', '访问模板页面', 8, 'com.jimmy.framework.core.system.controller.LoginController.html()', NULL, '192.168.1.199', '2019-09-20 15:40:00');
INSERT INTO `sys_log` VALUES (8378, 1, 'admin', '登录', 16, 'com.jimmy.framework.core.system.controller.LoginController.ajaxLogin()', NULL, '192.168.1.199', '2019-09-20 15:40:02');
INSERT INTO `sys_log` VALUES (8379, 1, 'admin', '请求访问主页', 27, 'com.jimmy.framework.core.system.controller.LoginController.index()', '{\"menus\":[{\"attributes\":{\"icon\":\"template\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/system/message\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"90\",\"name\":\"我的通知\",\"parentId\":\"84\",\"spread\":true,\"text\":\"我的通知\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"84\",\"name\":\"通知公告\",\"parentId\":\"0\",\"spread\":true,\"text\":\"通知公告\"},{\"attributes\":{\"icon\":\"user\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/user/personal\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"139\",\"name\":\"基本资料\",\"parentId\":\"138\",\"spread\":true,\"text\":\"基本资料\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/user/resetPwd\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"140\",\"name\":\"修改密码\",\"parentId\":\"138\",\"spread\":true,\"text\":\"修改密码\"}],\"hasChildren\":true,\"hasParent\":true,\"id\":\"138\",\"name\":\"我的设置\",\"parentId\":\"3\",\"spread\":true,\"text\":\"我的设置\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/user\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"6\",\"name\":\"用户管理\",\"parentId\":\"3\",\"spread\":true,\"text\":\"用户管理\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/role\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"7\",\"name\":\"角色管理\",\"parentId\":\"3\",\"spread\":true,\"text\":\"角色管理\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/tree\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"2\",\"name\":\"系统菜单\",\"parentId\":\"3\",\"spread\":true,\"text\":\"系统菜单\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/system/sysDept/treeView\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"73\",\"name\":\"部门管理\",\"parentId\":\"3\",\"spread\":true,\"text\":\"部门管理\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/website\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"134\",\"name\":\"网站设置\",\"parentId\":\"3\",\"spread\":true,\"text\":\"网站设置\"},{\"attributes\":{\"icon\":\"app\",\"url\":\"/common/job\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"144\",\"name\":\"定时任务\",\"parentId\":\"3\",\"spread\":true,\"text\":\"定时任务\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"3\",\"name\":\"系统设置\",\"parentId\":\"0\",\"spread\":true,\"text\":\"系统设置\"},{\"attributes\":{\"icon\":\"senior\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/online\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"92\",\"name\":\"在线用户\",\"parentId\":\"91\",\"spread\":true,\"text\":\"在线用户\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/log\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"27\",\"name\":\"系统日志\",\"parentId\":\"91\",\"spread\":true,\"text\":\"系统日志\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/druid/index.html\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"57\",\"name\":\"运行监控\",\"parentId\":\"91\",\"spread\":true,\"text\":\"运行监控\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/system/message\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"141\",\"name\":\"信息中心\",\"parentId\":\"91\",\"spread\":true,\"text\":\"信息中心\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/websocket/topic\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"142\",\"name\":\"广播\",\"parentId\":\"91\",\"spread\":true,\"text\":\"广播\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/websocket/queue\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"143\",\"name\":\"点对点\",\"parentId\":\"91\",\"spread\":true,\"text\":\"点对点\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"91\",\"name\":\"系统监控\",\"parentId\":\"0\",\"spread\":true,\"text\":\"系统监控\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/dict\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"78\",\"name\":\"数据字典\",\"parentId\":\"1\",\"spread\":true,\"text\":\"数据字典\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/sysFile\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"71\",\"name\":\"文件管理\",\"parentId\":\"1\",\"spread\":true,\"text\":\"文件管理\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"1\",\"name\":\"基础管理\",\"parentId\":\"0\",\"spread\":true,\"text\":\"基础管理\"},{\"attributes\":{\"icon\":\"component\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/swagger-ui.html\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"104\",\"name\":\"swagger\",\"parentId\":\"77\",\"spread\":true,\"text\":\"swagger\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/chart/graph_echarts.html\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"98\",\"name\":\"百度chart\",\"parentId\":\"77\",\"spread\":true,\"text\":\"百度chart\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/generator\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"48\",\"name\":\"代码生成\",\"parentId\":\"77\",\"spread\":true,\"text\":\"代码生成\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/emailsite\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"72\",\"name\":\"邮件服务\",\"parentId\":\"77\",\"spread\":true,\"text\":\"邮件服务\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"77\",\"name\":\"系统工具\",\"parentId\":\"0\"', '192.168.1.199', '2019-09-20 15:40:03');
INSERT INTO `sys_log` VALUES (8380, 1, 'admin', '访问模板页面', 0, 'com.jimmy.framework.core.system.controller.LoginController.html()', NULL, '192.168.1.199', '2019-09-20 15:40:04');
INSERT INTO `sys_log` VALUES (8381, 1, 'admin', '登录', 15, 'com.jimmy.framework.core.system.controller.LoginController.ajaxLogin()', NULL, '192.168.1.199', '2019-09-20 17:29:00');
INSERT INTO `sys_log` VALUES (8382, 1, 'admin', '请求访问主页', 36, 'com.jimmy.framework.core.system.controller.LoginController.index()', '{\"menus\":[{\"attributes\":{\"icon\":\"template\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/system/message\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"90\",\"name\":\"我的通知\",\"parentId\":\"84\",\"spread\":true,\"text\":\"我的通知\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"84\",\"name\":\"通知公告\",\"parentId\":\"0\",\"spread\":true,\"text\":\"通知公告\"},{\"attributes\":{\"icon\":\"user\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/user/personal\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"139\",\"name\":\"基本资料\",\"parentId\":\"138\",\"spread\":true,\"text\":\"基本资料\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/user/resetPwd\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"140\",\"name\":\"修改密码\",\"parentId\":\"138\",\"spread\":true,\"text\":\"修改密码\"}],\"hasChildren\":true,\"hasParent\":true,\"id\":\"138\",\"name\":\"我的设置\",\"parentId\":\"3\",\"spread\":true,\"text\":\"我的设置\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/user\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"6\",\"name\":\"用户管理\",\"parentId\":\"3\",\"spread\":true,\"text\":\"用户管理\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/role\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"7\",\"name\":\"角色管理\",\"parentId\":\"3\",\"spread\":true,\"text\":\"角色管理\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/tree\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"2\",\"name\":\"系统菜单\",\"parentId\":\"3\",\"spread\":true,\"text\":\"系统菜单\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/system/sysDept/treeView\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"73\",\"name\":\"部门管理\",\"parentId\":\"3\",\"spread\":true,\"text\":\"部门管理\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/website\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"134\",\"name\":\"网站设置\",\"parentId\":\"3\",\"spread\":true,\"text\":\"网站设置\"},{\"attributes\":{\"icon\":\"app\",\"url\":\"/common/job\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"144\",\"name\":\"定时任务\",\"parentId\":\"3\",\"spread\":true,\"text\":\"定时任务\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"3\",\"name\":\"系统设置\",\"parentId\":\"0\",\"spread\":true,\"text\":\"系统设置\"},{\"attributes\":{\"icon\":\"senior\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/online\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"92\",\"name\":\"在线用户\",\"parentId\":\"91\",\"spread\":true,\"text\":\"在线用户\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/log\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"27\",\"name\":\"系统日志\",\"parentId\":\"91\",\"spread\":true,\"text\":\"系统日志\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/druid/index.html\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"57\",\"name\":\"运行监控\",\"parentId\":\"91\",\"spread\":true,\"text\":\"运行监控\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/system/message\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"141\",\"name\":\"信息中心\",\"parentId\":\"91\",\"spread\":true,\"text\":\"信息中心\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/websocket/topic\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"142\",\"name\":\"广播\",\"parentId\":\"91\",\"spread\":true,\"text\":\"广播\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/websocket/queue\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"143\",\"name\":\"点对点\",\"parentId\":\"91\",\"spread\":true,\"text\":\"点对点\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"91\",\"name\":\"系统监控\",\"parentId\":\"0\",\"spread\":true,\"text\":\"系统监控\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/dict\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"78\",\"name\":\"数据字典\",\"parentId\":\"1\",\"spread\":true,\"text\":\"数据字典\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/sysFile\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"71\",\"name\":\"文件管理\",\"parentId\":\"1\",\"spread\":true,\"text\":\"文件管理\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"1\",\"name\":\"基础管理\",\"parentId\":\"0\",\"spread\":true,\"text\":\"基础管理\"},{\"attributes\":{\"icon\":\"component\",\"url\":\"\"},\"checked\":false,\"children\":[{\"attributes\":{\"icon\":\"set\",\"url\":\"/swagger-ui.html\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"104\",\"name\":\"swagger\",\"parentId\":\"77\",\"spread\":true,\"text\":\"swagger\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/chart/graph_echarts.html\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"98\",\"name\":\"百度chart\",\"parentId\":\"77\",\"spread\":true,\"text\":\"百度chart\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/common/generator\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"48\",\"name\":\"代码生成\",\"parentId\":\"77\",\"spread\":true,\"text\":\"代码生成\"},{\"attributes\":{\"icon\":\"set\",\"url\":\"/sys/emailsite\"},\"checked\":false,\"children\":[],\"hasChildren\":false,\"hasParent\":true,\"id\":\"72\",\"name\":\"邮件服务\",\"parentId\":\"77\",\"spread\":true,\"text\":\"邮件服务\"}],\"hasChildren\":true,\"hasParent\":false,\"id\":\"77\",\"name\":\"系统工具\",\"parentId\":\"0\"', '192.168.1.199', '2019-09-20 17:29:02');
INSERT INTO `sys_log` VALUES (8383, 1, 'admin', '访问模板页面', 0, 'com.jimmy.framework.core.system.controller.LoginController.html()', NULL, '192.168.1.199', '2019-09-20 17:29:02');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '基础管理', '', '', 0, 'set', 31, '2017-08-09 22:49:47', NULL);
INSERT INTO `sys_menu` VALUES (2, 3, '系统菜单', '/sys/tree', 'sys:menu:menu', 1, 'set', 2, '2017-08-09 22:55:15', NULL);
INSERT INTO `sys_menu` VALUES (3, 0, '系统设置', '', '', 0, 'user', 8, '2017-08-09 23:06:55', '2017-08-14 14:13:43');
INSERT INTO `sys_menu` VALUES (6, 3, '用户管理', '/sys/user', 'sys:user:user', 1, 'set', 0, '2017-08-10 14:12:11', NULL);
INSERT INTO `sys_menu` VALUES (7, 3, '角色管理', '/sys/role', 'sys:role:edit', 1, 'set', 1, '2017-08-10 14:13:19', NULL);
INSERT INTO `sys_menu` VALUES (27, 91, '系统日志', '/common/log', 'common:log', 1, 'set', 0, '2017-08-14 22:11:53', NULL);
INSERT INTO `sys_menu` VALUES (48, 77, '代码生成', '/common/generator', 'common:generator', 1, 'set', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (57, 91, '运行监控', '/druid/index.html', '', 1, 'set', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (71, 1, '文件管理', '/common/sysFile', 'common:sysFile:sysFile', 1, 'set', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (72, 77, '邮件服务', '/sys/emailsite', 'common:taskScheduleJob', 1, 'set', 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (73, 3, '部门管理', '/system/sysDept/treeView', 'system:sysDept:sysDept', 1, 'set', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (77, 0, '系统工具', '', '', 0, 'component', 33, NULL, NULL);
INSERT INTO `sys_menu` VALUES (78, 1, '数据字典', '/common/dict', 'common:dict:dict', 1, 'set', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (84, 0, '通知公告', '', '', 0, 'template', 5, NULL, NULL);
INSERT INTO `sys_menu` VALUES (90, 84, '我的通知', '/system/message', '', 1, 'set', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (91, 0, '系统监控', '', '', 0, 'senior', 30, NULL, NULL);
INSERT INTO `sys_menu` VALUES (92, 91, '在线用户', '/sys/online', '', 1, 'set', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (98, 77, '百度chart', '/chart/graph_echarts.html', '', 1, 'set', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (104, 77, 'swagger', '/swagger-ui.html', '', 1, 'set', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (134, 3, '网站设置', '/sys/website', NULL, 1, 'set', 6, NULL, NULL);
INSERT INTO `sys_menu` VALUES (138, 3, '我的设置', NULL, NULL, 0, 'set', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (139, 138, '基本资料', '/sys/user/personal', NULL, 1, 'set', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (140, 138, '修改密码', '/sys/user/resetPwd', NULL, 1, 'set', 7, NULL, NULL);
INSERT INTO `sys_menu` VALUES (141, 91, '信息中心', '/system/message', NULL, 1, 'set', 5, NULL, NULL);
INSERT INTO `sys_menu` VALUES (142, 91, '广播', '/common/websocket/topic', NULL, 1, 'set', 10, NULL, NULL);
INSERT INTO `sys_menu` VALUES (143, 91, '点对点', '/common/websocket/queue', NULL, 1, 'set', 11, NULL, NULL);
INSERT INTO `sys_menu` VALUES (144, 3, '定时任务', '/common/job', NULL, 1, 'app', 12, NULL, NULL);

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message`  (
  `mid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `msg_title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题内容',
  `msg_type` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息类型',
  `ready` int(11) NULL DEFAULT 0 COMMENT '标记读取',
  `msg_time` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  `from_user` bigint(20) NULL DEFAULT NULL COMMENT '发送人',
  `to_user` bigint(20) NULL DEFAULT NULL COMMENT '接收人',
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_message
-- ----------------------------
INSERT INTO `sys_message` VALUES (1, '测试通知', 'notice', 1, '2019-09-16 16:44:06', 0, 1);
INSERT INTO `sys_message` VALUES (2, '测试私人信息', 'direct', 0, '2019-09-16 16:44:09', 0, 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) NULL DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级用户角色', 'admin', '拥有最高权限', 2, '2017-08-12 00:43:52', '2017-08-12 19:14:59');
INSERT INTO `sys_role` VALUES (59, '普通用户', NULL, '基本用户权限', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (63, '测试', 'test', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5176 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (367, 44, 1);
INSERT INTO `sys_role_menu` VALUES (368, 44, 32);
INSERT INTO `sys_role_menu` VALUES (369, 44, 33);
INSERT INTO `sys_role_menu` VALUES (370, 44, 34);
INSERT INTO `sys_role_menu` VALUES (371, 44, 35);
INSERT INTO `sys_role_menu` VALUES (372, 44, 28);
INSERT INTO `sys_role_menu` VALUES (373, 44, 29);
INSERT INTO `sys_role_menu` VALUES (374, 44, 30);
INSERT INTO `sys_role_menu` VALUES (375, 44, 38);
INSERT INTO `sys_role_menu` VALUES (376, 44, 4);
INSERT INTO `sys_role_menu` VALUES (377, 44, 27);
INSERT INTO `sys_role_menu` VALUES (378, 45, 38);
INSERT INTO `sys_role_menu` VALUES (379, 46, 3);
INSERT INTO `sys_role_menu` VALUES (380, 46, 20);
INSERT INTO `sys_role_menu` VALUES (381, 46, 21);
INSERT INTO `sys_role_menu` VALUES (382, 46, 22);
INSERT INTO `sys_role_menu` VALUES (383, 46, 23);
INSERT INTO `sys_role_menu` VALUES (384, 46, 11);
INSERT INTO `sys_role_menu` VALUES (385, 46, 12);
INSERT INTO `sys_role_menu` VALUES (386, 46, 13);
INSERT INTO `sys_role_menu` VALUES (387, 46, 14);
INSERT INTO `sys_role_menu` VALUES (388, 46, 24);
INSERT INTO `sys_role_menu` VALUES (389, 46, 25);
INSERT INTO `sys_role_menu` VALUES (390, 46, 26);
INSERT INTO `sys_role_menu` VALUES (391, 46, 15);
INSERT INTO `sys_role_menu` VALUES (392, 46, 2);
INSERT INTO `sys_role_menu` VALUES (393, 46, 6);
INSERT INTO `sys_role_menu` VALUES (394, 46, 7);
INSERT INTO `sys_role_menu` VALUES (598, 50, 38);
INSERT INTO `sys_role_menu` VALUES (632, 38, 42);
INSERT INTO `sys_role_menu` VALUES (737, 51, 38);
INSERT INTO `sys_role_menu` VALUES (738, 51, 39);
INSERT INTO `sys_role_menu` VALUES (739, 51, 40);
INSERT INTO `sys_role_menu` VALUES (740, 51, 41);
INSERT INTO `sys_role_menu` VALUES (741, 51, 4);
INSERT INTO `sys_role_menu` VALUES (742, 51, 32);
INSERT INTO `sys_role_menu` VALUES (743, 51, 33);
INSERT INTO `sys_role_menu` VALUES (744, 51, 34);
INSERT INTO `sys_role_menu` VALUES (745, 51, 35);
INSERT INTO `sys_role_menu` VALUES (746, 51, 27);
INSERT INTO `sys_role_menu` VALUES (747, 51, 28);
INSERT INTO `sys_role_menu` VALUES (748, 51, 29);
INSERT INTO `sys_role_menu` VALUES (749, 51, 30);
INSERT INTO `sys_role_menu` VALUES (750, 51, 1);
INSERT INTO `sys_role_menu` VALUES (1064, 54, 53);
INSERT INTO `sys_role_menu` VALUES (1095, 55, 2);
INSERT INTO `sys_role_menu` VALUES (1096, 55, 6);
INSERT INTO `sys_role_menu` VALUES (1097, 55, 7);
INSERT INTO `sys_role_menu` VALUES (1098, 55, 3);
INSERT INTO `sys_role_menu` VALUES (1099, 55, 50);
INSERT INTO `sys_role_menu` VALUES (1100, 55, 49);
INSERT INTO `sys_role_menu` VALUES (1101, 55, 1);
INSERT INTO `sys_role_menu` VALUES (1856, 53, 28);
INSERT INTO `sys_role_menu` VALUES (1857, 53, 29);
INSERT INTO `sys_role_menu` VALUES (1858, 53, 30);
INSERT INTO `sys_role_menu` VALUES (1859, 53, 27);
INSERT INTO `sys_role_menu` VALUES (1860, 53, 57);
INSERT INTO `sys_role_menu` VALUES (1861, 53, 71);
INSERT INTO `sys_role_menu` VALUES (1862, 53, 48);
INSERT INTO `sys_role_menu` VALUES (1863, 53, 72);
INSERT INTO `sys_role_menu` VALUES (1864, 53, 1);
INSERT INTO `sys_role_menu` VALUES (1865, 53, 7);
INSERT INTO `sys_role_menu` VALUES (1866, 53, 55);
INSERT INTO `sys_role_menu` VALUES (1867, 53, 56);
INSERT INTO `sys_role_menu` VALUES (1868, 53, 62);
INSERT INTO `sys_role_menu` VALUES (1869, 53, 15);
INSERT INTO `sys_role_menu` VALUES (1870, 53, 2);
INSERT INTO `sys_role_menu` VALUES (1871, 53, 61);
INSERT INTO `sys_role_menu` VALUES (1872, 53, 20);
INSERT INTO `sys_role_menu` VALUES (1873, 53, 21);
INSERT INTO `sys_role_menu` VALUES (1874, 53, 22);
INSERT INTO `sys_role_menu` VALUES (2084, 56, 68);
INSERT INTO `sys_role_menu` VALUES (2085, 56, 60);
INSERT INTO `sys_role_menu` VALUES (2086, 56, 59);
INSERT INTO `sys_role_menu` VALUES (2087, 56, 58);
INSERT INTO `sys_role_menu` VALUES (2088, 56, 51);
INSERT INTO `sys_role_menu` VALUES (2089, 56, 50);
INSERT INTO `sys_role_menu` VALUES (2090, 56, 49);
INSERT INTO `sys_role_menu` VALUES (2243, 48, 72);
INSERT INTO `sys_role_menu` VALUES (2262, 67, 48);
INSERT INTO `sys_role_menu` VALUES (2263, 68, 88);
INSERT INTO `sys_role_menu` VALUES (2264, 68, 87);
INSERT INTO `sys_role_menu` VALUES (2265, 69, 89);
INSERT INTO `sys_role_menu` VALUES (2266, 69, 88);
INSERT INTO `sys_role_menu` VALUES (2267, 69, 86);
INSERT INTO `sys_role_menu` VALUES (2268, 69, 87);
INSERT INTO `sys_role_menu` VALUES (2269, 69, 85);
INSERT INTO `sys_role_menu` VALUES (2270, 69, 84);
INSERT INTO `sys_role_menu` VALUES (2271, 70, 85);
INSERT INTO `sys_role_menu` VALUES (2272, 70, 89);
INSERT INTO `sys_role_menu` VALUES (2273, 70, 88);
INSERT INTO `sys_role_menu` VALUES (2274, 70, 87);
INSERT INTO `sys_role_menu` VALUES (2275, 70, 86);
INSERT INTO `sys_role_menu` VALUES (2276, 70, 84);
INSERT INTO `sys_role_menu` VALUES (2277, 71, 87);
INSERT INTO `sys_role_menu` VALUES (2278, 72, 59);
INSERT INTO `sys_role_menu` VALUES (2279, 73, 48);
INSERT INTO `sys_role_menu` VALUES (2280, 74, 88);
INSERT INTO `sys_role_menu` VALUES (2281, 74, 87);
INSERT INTO `sys_role_menu` VALUES (2282, 75, 88);
INSERT INTO `sys_role_menu` VALUES (2283, 75, 87);
INSERT INTO `sys_role_menu` VALUES (2284, 76, 85);
INSERT INTO `sys_role_menu` VALUES (2285, 76, 89);
INSERT INTO `sys_role_menu` VALUES (2286, 76, 88);
INSERT INTO `sys_role_menu` VALUES (2287, 76, 87);
INSERT INTO `sys_role_menu` VALUES (2288, 76, 86);
INSERT INTO `sys_role_menu` VALUES (2289, 76, 84);
INSERT INTO `sys_role_menu` VALUES (2292, 78, 88);
INSERT INTO `sys_role_menu` VALUES (2293, 78, 87);
INSERT INTO `sys_role_menu` VALUES (2294, 78, NULL);
INSERT INTO `sys_role_menu` VALUES (2295, 78, NULL);
INSERT INTO `sys_role_menu` VALUES (2296, 78, NULL);
INSERT INTO `sys_role_menu` VALUES (2308, 80, 87);
INSERT INTO `sys_role_menu` VALUES (2309, 80, 86);
INSERT INTO `sys_role_menu` VALUES (2310, 80, -1);
INSERT INTO `sys_role_menu` VALUES (2311, 80, 84);
INSERT INTO `sys_role_menu` VALUES (2312, 80, 85);
INSERT INTO `sys_role_menu` VALUES (2328, 79, 72);
INSERT INTO `sys_role_menu` VALUES (2329, 79, 48);
INSERT INTO `sys_role_menu` VALUES (2330, 79, 77);
INSERT INTO `sys_role_menu` VALUES (2331, 79, 84);
INSERT INTO `sys_role_menu` VALUES (2332, 79, 89);
INSERT INTO `sys_role_menu` VALUES (2333, 79, 88);
INSERT INTO `sys_role_menu` VALUES (2334, 79, 87);
INSERT INTO `sys_role_menu` VALUES (2335, 79, 86);
INSERT INTO `sys_role_menu` VALUES (2336, 79, 85);
INSERT INTO `sys_role_menu` VALUES (2337, 79, -1);
INSERT INTO `sys_role_menu` VALUES (2338, 77, 89);
INSERT INTO `sys_role_menu` VALUES (2339, 77, 88);
INSERT INTO `sys_role_menu` VALUES (2340, 77, 87);
INSERT INTO `sys_role_menu` VALUES (2341, 77, 86);
INSERT INTO `sys_role_menu` VALUES (2342, 77, 85);
INSERT INTO `sys_role_menu` VALUES (2343, 77, 84);
INSERT INTO `sys_role_menu` VALUES (2344, 77, 72);
INSERT INTO `sys_role_menu` VALUES (2345, 77, -1);
INSERT INTO `sys_role_menu` VALUES (2346, 77, 77);
INSERT INTO `sys_role_menu` VALUES (2974, 57, 93);
INSERT INTO `sys_role_menu` VALUES (2975, 57, 99);
INSERT INTO `sys_role_menu` VALUES (2976, 57, 95);
INSERT INTO `sys_role_menu` VALUES (2977, 57, 101);
INSERT INTO `sys_role_menu` VALUES (2978, 57, 96);
INSERT INTO `sys_role_menu` VALUES (2979, 57, 94);
INSERT INTO `sys_role_menu` VALUES (2980, 57, -1);
INSERT INTO `sys_role_menu` VALUES (2981, 58, 93);
INSERT INTO `sys_role_menu` VALUES (2982, 58, 99);
INSERT INTO `sys_role_menu` VALUES (2983, 58, 95);
INSERT INTO `sys_role_menu` VALUES (2984, 58, 101);
INSERT INTO `sys_role_menu` VALUES (2985, 58, 96);
INSERT INTO `sys_role_menu` VALUES (2986, 58, 94);
INSERT INTO `sys_role_menu` VALUES (2987, 58, -1);
INSERT INTO `sys_role_menu` VALUES (5022, 59, 144);
INSERT INTO `sys_role_menu` VALUES (5023, 59, 124);
INSERT INTO `sys_role_menu` VALUES (5024, 59, 127);
INSERT INTO `sys_role_menu` VALUES (5025, 59, 126);
INSERT INTO `sys_role_menu` VALUES (5026, 59, 118);
INSERT INTO `sys_role_menu` VALUES (5027, 59, 117);
INSERT INTO `sys_role_menu` VALUES (5028, 59, 116);
INSERT INTO `sys_role_menu` VALUES (5029, 59, 115);
INSERT INTO `sys_role_menu` VALUES (5030, 59, 138);
INSERT INTO `sys_role_menu` VALUES (5031, 59, 122);
INSERT INTO `sys_role_menu` VALUES (5032, 59, 121);
INSERT INTO `sys_role_menu` VALUES (5033, 59, 140);
INSERT INTO `sys_role_menu` VALUES (5034, 59, 137);
INSERT INTO `sys_role_menu` VALUES (5035, 59, 114);
INSERT INTO `sys_role_menu` VALUES (5036, 59, 113);
INSERT INTO `sys_role_menu` VALUES (5037, 59, 142);
INSERT INTO `sys_role_menu` VALUES (5038, 59, 112);
INSERT INTO `sys_role_menu` VALUES (5039, 59, 111);
INSERT INTO `sys_role_menu` VALUES (5040, 59, 109);
INSERT INTO `sys_role_menu` VALUES (5041, 59, 108);
INSERT INTO `sys_role_menu` VALUES (5042, 59, 107);
INSERT INTO `sys_role_menu` VALUES (5043, 59, 106);
INSERT INTO `sys_role_menu` VALUES (5044, 59, 105);
INSERT INTO `sys_role_menu` VALUES (5045, 59, 146);
INSERT INTO `sys_role_menu` VALUES (5046, 59, -1);
INSERT INTO `sys_role_menu` VALUES (5047, 59, 145);
INSERT INTO `sys_role_menu` VALUES (5079, 63, 91);
INSERT INTO `sys_role_menu` VALUES (5080, 63, 92);
INSERT INTO `sys_role_menu` VALUES (5081, 63, 57);
INSERT INTO `sys_role_menu` VALUES (5082, 63, 27);
INSERT INTO `sys_role_menu` VALUES (5083, 63, 30);
INSERT INTO `sys_role_menu` VALUES (5084, 63, 29);
INSERT INTO `sys_role_menu` VALUES (5085, 63, 28);
INSERT INTO `sys_role_menu` VALUES (5086, 63, 84);
INSERT INTO `sys_role_menu` VALUES (5087, 63, 90);
INSERT INTO `sys_role_menu` VALUES (5088, 63, 85);
INSERT INTO `sys_role_menu` VALUES (5089, 63, 89);
INSERT INTO `sys_role_menu` VALUES (5090, 63, 88);
INSERT INTO `sys_role_menu` VALUES (5091, 63, 87);
INSERT INTO `sys_role_menu` VALUES (5092, 63, 86);
INSERT INTO `sys_role_menu` VALUES (5149, 1, 91);
INSERT INTO `sys_role_menu` VALUES (5150, 1, 143);
INSERT INTO `sys_role_menu` VALUES (5151, 1, 142);
INSERT INTO `sys_role_menu` VALUES (5152, 1, 141);
INSERT INTO `sys_role_menu` VALUES (5153, 1, 92);
INSERT INTO `sys_role_menu` VALUES (5154, 1, 57);
INSERT INTO `sys_role_menu` VALUES (5155, 1, 27);
INSERT INTO `sys_role_menu` VALUES (5156, 1, 84);
INSERT INTO `sys_role_menu` VALUES (5157, 1, 90);
INSERT INTO `sys_role_menu` VALUES (5158, 1, 77);
INSERT INTO `sys_role_menu` VALUES (5159, 1, 104);
INSERT INTO `sys_role_menu` VALUES (5160, 1, 98);
INSERT INTO `sys_role_menu` VALUES (5161, 1, 72);
INSERT INTO `sys_role_menu` VALUES (5162, 1, 48);
INSERT INTO `sys_role_menu` VALUES (5163, 1, 3);
INSERT INTO `sys_role_menu` VALUES (5164, 1, 144);
INSERT INTO `sys_role_menu` VALUES (5165, 1, 138);
INSERT INTO `sys_role_menu` VALUES (5166, 1, 140);
INSERT INTO `sys_role_menu` VALUES (5167, 1, 139);
INSERT INTO `sys_role_menu` VALUES (5168, 1, 134);
INSERT INTO `sys_role_menu` VALUES (5169, 1, 73);
INSERT INTO `sys_role_menu` VALUES (5170, 1, 7);
INSERT INTO `sys_role_menu` VALUES (5171, 1, 6);
INSERT INTO `sys_role_menu` VALUES (5172, 1, 2);
INSERT INTO `sys_role_menu` VALUES (5173, 1, 1);
INSERT INTO `sys_role_menu` VALUES (5174, 1, 78);
INSERT INTO `sys_role_menu` VALUES (5175, 1, 71);

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务调用的方法名',
  `is_concurrent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `bean_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `job_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态',
  `job_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务分组',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `spring_bean` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Spring bean',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES (2, '0/10 * * * * ?', 'run1', '1', '', '4028ea815a3d2a8c015a3d2f8d2a0002', 'com.jimmy.framework.core.common.task.WelcomeJob', '2017-05-19 18:30:56', '1', 'group1', '2017-05-19 18:31:07', NULL, '', 'welcomJob');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) NULL DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint(255) NULL DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `sex` bigint(32) NULL DEFAULT NULL COMMENT '性别',
  `birth` datetime(0) NULL DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint(32) NULL DEFAULT NULL,
  `live_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地区',
  `station` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位',
  `jobnumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工工号',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 252 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '超级管理员', '27bd386e70f280e24c2f4f2a549b82cf', 1002, 'yyjcf1986@163.com', '13825160872', 1, 1, '2017-08-15 21:40:39', '2017-08-15 21:41:00', 0, '2017-12-14 00:00:00', 138, 'ccc', '122;121;', '北京市', '北京市市辖区', '东城区', '管理员', NULL);
INSERT INTO `sys_user` VALUES (211, 'liaob', '廖彬', '217a13bc9716997eaf8a5550478b6280', 1001, 'liaob@anfawuliu.com', '18845456457', 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CEO', NULL);
INSERT INTO `sys_user` VALUES (212, 'longp', '龙鹏', '21d97ccc9e556b4ee1f81453cd935d24', 1001, 'longp@anfawuliu.com', '18854546547', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '总经理', NULL);
INSERT INTO `sys_user` VALUES (213, 'guoyh', '郭业华', 'db8e7110c2d67d0d790df9a4b00c96f5', 1001, 'guoyh@anfawuliu.com', '13622229100', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '副总经理', NULL);
INSERT INTO `sys_user` VALUES (214, 'dengp', '邓鹏', '5ebb99bbf8c5621bc1d6044150137c87', 1002, 'dengp@anfawuliu.com', '18028693660', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '项目副总监', NULL);
INSERT INTO `sys_user` VALUES (215, 'fangj', '方坚', '6ddd37a95012d24a7ccbfc40b0bbae6f', 1002, 'fangj@anfawuliu.com', '13825160872', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '高级技术经理', NULL);
INSERT INTO `sys_user` VALUES (216, 'dingf', '丁飞', '60eb8db3c4d2b640984f472d2255430f', 1002, 'dingf@anfawuliu.com', '15821847411', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JAVA开发', NULL);
INSERT INTO `sys_user` VALUES (217, 'lingzy', '凌梓颖', '94a42866847b81314d54a7f13e64b7fb', 1002, 'lingzy@anfawuliu.com', '15521280481', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JAVA实习生', NULL);
INSERT INTO `sys_user` VALUES (218, 'huangyw', '黄宇文', '9deb05f13376fa167d18cc9c2d1ff62c', 1002, 'huangyw@anfawuliu.com', '13422164092', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JAVA开发', NULL);
INSERT INTO `sys_user` VALUES (219, 'huangym', '黄衍沐', 'd82ae25c4f26a3d5256be1e4de5e6da5', 1002, 'huangym@anfawuliu.com', '15218866809', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JAVA开发', NULL);
INSERT INTO `sys_user` VALUES (220, 'wukz', '吴坤智', '4a3b9d777c5d384dfe9ca9bbf769b257', 1002, 'wukz@anfawuliu.com', '18898956895', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JAVA开发', NULL);
INSERT INTO `sys_user` VALUES (221, 'chengrt', '程荣涛', '81f09cbae528898188e7d5105de6ef28', 1002, 'chengrt@anfawuliu.com', '13535017726', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JAVA开发', NULL);
INSERT INTO `sys_user` VALUES (222, 'heyq', '何永青', 'f5bbe342994c3a4f385bb2b117255833', 1002, 'heyq@anfawuliu.com', '13428809316', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Web前端开发', NULL);
INSERT INTO `sys_user` VALUES (223, 'linrl', '林瑞莲', 'ff2abaa214d7cfb345cb4dd9504422dd', 1002, 'linrl@anfawuliu.com', '18529297502', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Web前端开发', NULL);
INSERT INTO `sys_user` VALUES (224, 'luoyy', '骆焱妍', '1a9be4b304abca434f1ac8392ac22bbc', 1002, 'luoyy@anfawuliu.com', '13242824870', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Web前端开发', NULL);
INSERT INTO `sys_user` VALUES (225, 'weizl', '韦职丽', 'd962ef34038dcf73eaa1b66020c46e0e', 1002, 'weizl@anfawuliu.com', '18177297437', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Web前端开发', NULL);
INSERT INTO `sys_user` VALUES (226, 'huangjx', '黄锦新', 'e76ad2942b98f211cd4b48695ef8dd89', 1002, 'huangjx@anfawuliu.cn', '18988636120', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Web前端开发', NULL);
INSERT INTO `sys_user` VALUES (227, 'zhongb', '钟波', 'a5a850a0f299d9736c9052c4bf0cbb88', 1002, 'zhongb@anfawuliu.cn', '13660420098', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试经理', NULL);
INSERT INTO `sys_user` VALUES (228, 'keln', '柯莉恩', '71818b7c52b0e0e4b103a9774335670e', 1002, 'keln@anfawuliu.com', '13924201019', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试主管', NULL);
INSERT INTO `sys_user` VALUES (229, 'ligj', '李国江', '38a6434130078af58db5e406d8772d64', 1002, 'ligj@anfawuliu.com', '18719103631', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '产品测试工程师', NULL);
INSERT INTO `sys_user` VALUES (231, 'ougm', '欧观明', '9a10bf32751c1f4cb00652de88ab5725', 1002, 'ougm@anfawuliu.cn', '13570370304', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '产品测试实习生', NULL);
INSERT INTO `sys_user` VALUES (232, 'liangjx', '梁嘉星', '9437e97acdb3630dd1e40e47bab2621c', 1002, 'liangjx@anfawuliu.cn', '13418196045', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '产品测试实习生', NULL);
INSERT INTO `sys_user` VALUES (233, 'zhouwx', '周为旭', 'ded91a2dcaf27986944ff844671ca132', 1002, 'zhouwx@anfawuliu.cn', '15976288709', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '产品测试实习生', NULL);
INSERT INTO `sys_user` VALUES (234, 'yanb', '晏彪', 'aac48a733b53c6bf3afcfb13cecb1a4d', 1002, 'yanb@anfawuliu.com', '13416233760', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '网站开发兼运维', NULL);
INSERT INTO `sys_user` VALUES (235, 'dengl', '邓凌', '45166cf01f2fe4afe847cd20efc60eeb', 1002, 'dengl@anfawuliu.com', '13928971107', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '高级技术经理', NULL);
INSERT INTO `sys_user` VALUES (238, 'xuemy', '薛明粤', 'd2d706f131c9be5b96e68bdd50509557', 1002, 'xuemy@anfawuliu.com', '13008812528', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JAVA开发', NULL);
INSERT INTO `sys_user` VALUES (239, 'wangtc', '王腾聪', 'e83fcc425014ead92eaae786adad5d6f', 1002, 'wangtc@anfawuliu.com', '18565325696', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JAVA开发', NULL);
INSERT INTO `sys_user` VALUES (240, 'zhougf', '周高锋', 'b02cb6c02d6f2030e07c74ea3b511a8b', 1002, 'zhougf@anfawuliu.com', '18613191443', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Web前端开发', NULL);
INSERT INTO `sys_user` VALUES (242, 'lincy', '林创游', '0bce795084c834fed65259aa35075f9c', 1002, 'lincy@anfawuliu.com', '13650961701', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Android工程师', NULL);
INSERT INTO `sys_user` VALUES (244, 'luch', '吕超', '4809553b2b06a1a5765b0cc81b524d21', 1002, 'luch@anfawuliu.com', '18521358579', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ios工程师', NULL);
INSERT INTO `sys_user` VALUES (246, 'xiezy', '谢志勇', '890aac9c9de232c60815e2a2c3a744d1', 1003, 'xiezy@anfawuliu.com', '13718806913', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '产品总监', NULL);
INSERT INTO `sys_user` VALUES (248, 'chenhh', '陈浩皇', '07be21e0563433808d1d674d9635989a', 1003, 'chenhh@anfawuliu.com', '13630153737', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '产品经理', NULL);
INSERT INTO `sys_user` VALUES (249, 'luozc', '罗志超', 'e0c9a23bd3d2203ab5741a99b3384ec0', 1003, 'luozc@anfawuliu.com', '18565567772', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '产品经理', NULL);
INSERT INTO `sys_user` VALUES (251, 'chenxm', '陈先明', '9349b2d378d9e7ebdde9a61b08ad6167', 1003, 'chenxm@anfawuliu.com', '18825181609', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '产品运营', NULL);

-- ----------------------------
-- Table structure for sys_user_plus
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_plus`;
CREATE TABLE `sys_user_plus`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `payment` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 217 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (73, 30, 48);
INSERT INTO `sys_user_role` VALUES (74, 30, 49);
INSERT INTO `sys_user_role` VALUES (75, 30, 50);
INSERT INTO `sys_user_role` VALUES (76, 31, 48);
INSERT INTO `sys_user_role` VALUES (77, 31, 49);
INSERT INTO `sys_user_role` VALUES (78, 31, 52);
INSERT INTO `sys_user_role` VALUES (79, 32, 48);
INSERT INTO `sys_user_role` VALUES (80, 32, 49);
INSERT INTO `sys_user_role` VALUES (81, 32, 50);
INSERT INTO `sys_user_role` VALUES (82, 32, 51);
INSERT INTO `sys_user_role` VALUES (83, 32, 52);
INSERT INTO `sys_user_role` VALUES (84, 33, 38);
INSERT INTO `sys_user_role` VALUES (85, 33, 49);
INSERT INTO `sys_user_role` VALUES (86, 33, 52);
INSERT INTO `sys_user_role` VALUES (87, 34, 50);
INSERT INTO `sys_user_role` VALUES (88, 34, 51);
INSERT INTO `sys_user_role` VALUES (89, 34, 52);
INSERT INTO `sys_user_role` VALUES (124, NULL, 48);
INSERT INTO `sys_user_role` VALUES (140, 141, 1);
INSERT INTO `sys_user_role` VALUES (141, 142, 1);
INSERT INTO `sys_user_role` VALUES (142, 143, 1);
INSERT INTO `sys_user_role` VALUES (143, 144, 1);
INSERT INTO `sys_user_role` VALUES (144, 145, 1);
INSERT INTO `sys_user_role` VALUES (146, 216, 1);
INSERT INTO `sys_user_role` VALUES (161, 251, 59);
INSERT INTO `sys_user_role` VALUES (163, 249, 59);
INSERT INTO `sys_user_role` VALUES (164, 248, 59);
INSERT INTO `sys_user_role` VALUES (168, 244, 59);
INSERT INTO `sys_user_role` VALUES (170, 242, 59);
INSERT INTO `sys_user_role` VALUES (172, 240, 59);
INSERT INTO `sys_user_role` VALUES (173, 239, 59);
INSERT INTO `sys_user_role` VALUES (174, 238, 59);
INSERT INTO `sys_user_role` VALUES (177, 246, 59);
INSERT INTO `sys_user_role` VALUES (179, 235, 59);
INSERT INTO `sys_user_role` VALUES (180, 234, 59);
INSERT INTO `sys_user_role` VALUES (181, 233, 59);
INSERT INTO `sys_user_role` VALUES (182, 232, 59);
INSERT INTO `sys_user_role` VALUES (183, 231, 59);
INSERT INTO `sys_user_role` VALUES (185, 229, 59);
INSERT INTO `sys_user_role` VALUES (186, 228, 59);
INSERT INTO `sys_user_role` VALUES (187, 227, 59);
INSERT INTO `sys_user_role` VALUES (188, 226, 59);
INSERT INTO `sys_user_role` VALUES (189, 225, 59);
INSERT INTO `sys_user_role` VALUES (190, 224, 59);
INSERT INTO `sys_user_role` VALUES (191, 223, 59);
INSERT INTO `sys_user_role` VALUES (192, 222, 59);
INSERT INTO `sys_user_role` VALUES (193, 221, 59);
INSERT INTO `sys_user_role` VALUES (198, 218, 59);
INSERT INTO `sys_user_role` VALUES (199, 217, 59);
INSERT INTO `sys_user_role` VALUES (204, 219, 1);
INSERT INTO `sys_user_role` VALUES (205, 220, 1);
INSERT INTO `sys_user_role` VALUES (206, 215, 1);
INSERT INTO `sys_user_role` VALUES (207, 214, 59);
INSERT INTO `sys_user_role` VALUES (213, 1, 1);
INSERT INTO `sys_user_role` VALUES (214, 213, 1);
INSERT INTO `sys_user_role` VALUES (215, 212, 1);
INSERT INTO `sys_user_role` VALUES (216, 211, 1);

-- ----------------------------
-- Table structure for sys_website
-- ----------------------------
DROP TABLE IF EXISTS `sys_website`;
CREATE TABLE `sys_website`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站名称',
  `site_wwwname` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名',
  `cache_time` bigint(20) NULL DEFAULT NULL COMMENT '缓存时间',
  `max_filekb` bigint(20) NULL DEFAULT NULL COMMENT '文件最大上传大小',
  `file_uploadtype` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件上传类型',
  `index_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `meta_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'META关键字',
  `meta_info` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'META描述',
  `site_version` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版权信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_website
-- ----------------------------
INSERT INTO `sys_website` VALUES (1, 'bootAdmin后台管理系统', 'https://github.com/fangjianzy', 0, 520, 'png|gif|jpg|jpeg|zip|rar', 'bootAdmin后台管理系统', 'bootAdmin', 'bootAdmin后台管理系统', '基于代码生成器+layui的最佳实践');

SET FOREIGN_KEY_CHECKS = 1;

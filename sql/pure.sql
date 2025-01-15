-- ----------------------------
-- Chat2DB export data , export time: 2025-01-15 19:25:36
-- ----------------------------
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for table gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表名称',
  `table_comment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `entity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '实体类名称',
  `gen_category` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成类别（crud单表操作 tree树表操作）',
  `maven_module_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'maven模块',
  `gen_module_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成模块类型（single、multiple）',
  `package_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '包路径（模块名结尾）',
  `module_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '模块名',
  `business_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务名（接口路径&前端文件夹）',
  `business_name_zh` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务名（中文）',
  `menu_parent_id` bigint DEFAULT NULL COMMENT '上级菜单ID',
  `author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作者',
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其它生成选项',
  `remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`table_id`),
  UNIQUE KEY `gen_table_table_name` (`table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` (`table_id`,`table_name`,`table_comment`,`sub_table_name`,`sub_table_fk_name`,`entity_name`,`gen_category`,`maven_module_name`,`gen_module_type`,`package_name`,`module_name`,`business_name`,`business_name_zh`,`menu_parent_id`,`author`,`options`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1','sys_user','用户表',NULL,NULL,'SysUser','crud','pure-emp','multiple','com.yongoe.pure.emp','emp','sysUser','用户表','1','pure','s',NULL,NULL,'2024-11-13 16:04:08','',NULL,'0');
-- ----------------------------
-- Table structure for table gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `java_import` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'java包导入路径',
  `is_pk` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'EQ' COMMENT '查询方式',
  `html_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '显示类型',
  `dict_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典编码',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1','1','user_id','用户ID','BIGINT(19)','Long','userId',NULL,'1','1','0','0','0','0','0','=','文本框',NULL,'1',NULL,'2024-11-13 16:04:11',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('2','1','dept_id','部门ID','BIGINT(19)','Long','deptId',NULL,'0','0','1','1','1','1','1','=','文本框',NULL,'1',NULL,'2024-11-13 16:04:11',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('3','1','username','账号','VARCHAR(64)','String','username',NULL,'0','0','1','1','1','1','1','LIKE','文本框',NULL,'1',NULL,'2024-11-13 16:04:11',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('4','1','password','密码','VARCHAR(255)','String','password',NULL,'0','0','1','1','1','1','1','LIKE','文本框',NULL,'1',NULL,'2024-11-13 16:04:11',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('5','1','nickname','昵称','VARCHAR(64)','String','nickname',NULL,'0','0','1','1','1','1','1','LIKE','文本框',NULL,'1',NULL,'2024-11-13 16:04:11',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('6','1','name','姓名','VARCHAR(64)','String','name',NULL,'0','0','1','1','1','1','1','LIKE','文本框',NULL,'1',NULL,'2024-11-13 16:04:11',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('7','1','email','邮箱','VARCHAR(64)','String','email',NULL,'0','0','1','1','1','1','1','LIKE','文本框',NULL,'1',NULL,'2024-11-13 16:04:11',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('8','1','phone','电话号码','VARCHAR(32)','String','phone',NULL,'0','0','1','1','1','1','1','LIKE','文本框',NULL,'1',NULL,'2024-11-13 16:04:11',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('9','1','sex','用户性别（0男 1女 2未知）','CHAR(1)','String','sex',NULL,'0','0','1','1','1','1','1','LIKE','文本框',NULL,'1',NULL,'2024-11-13 16:04:11',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('10','1','avatar','头像','VARCHAR(255)','String','avatar',NULL,'0','0','1','1','1','1','1','LIKE','文本框',NULL,'1',NULL,'2024-11-13 16:04:11',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('11','1','status','帐号状态（1正常 0停用）','CHAR(1)','String','status',NULL,'0','0','1','1','1','1','1','LIKE','文本框',NULL,'1',NULL,'2024-11-13 16:04:11',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('12','1','remark','备注','VARCHAR(64)','String','remark',NULL,'0','0','0','1','1','1','1','=','文本框',NULL,'1',NULL,'2024-11-13 16:04:11',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('13','1','user_extra_data','用户额外数据','JSON(1073741824)','String','userExtraData',NULL,'0','0','1','1','1','1','1','LIKE','文本框',NULL,'1',NULL,'2024-11-13 16:04:11',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('14','1','create_by','创建人','VARCHAR(64)','String','createBy',NULL,'0','0','0','0','0','0','0','=','文本框',NULL,'1',NULL,'2024-11-13 16:04:11',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('15','1','create_time','创建时间','DATETIME(19)','LocalDateTime','createTime','java.time.LocalDateTime','0','0','0','0','0','0','0','=','文本框',NULL,'1',NULL,'2024-11-13 16:04:11',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('16','1','update_by','修改人','VARCHAR(64)','String','updateBy',NULL,'0','0','0','0','0','0','0','=','文本框',NULL,'1',NULL,'2024-11-13 16:04:11',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('17','1','update_time','修改时间','DATETIME(19)','LocalDateTime','updateTime','java.time.LocalDateTime','0','0','0','0','0','0','0','=','文本框',NULL,'1',NULL,'2024-11-13 16:04:11',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('18','1','del_flag','删除标记','CHAR(1)','String','delFlag',NULL,'0','0','0','0','0','0','0','=','文本框',NULL,'1',NULL,'2024-11-13 16:04:11',NULL,NULL,'0');
-- ----------------------------
-- Table structure for table sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` bigint NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `config_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '参数名称',
  `config_key` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '参数键名',
  `config_value` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '系统内置（1是 0否）',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `sys_config_config_key` (`config_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` (`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1','默认注册角色','sys.account.defaultRoleCode','admin',NULL,NULL,NULL,NULL,NULL,NULL,'0');
INSERT INTO `sys_config` (`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('2','zhuce','sys.account.register','true',NULL,NULL,NULL,NULL,NULL,NULL,'0');
-- ----------------------------
-- Table structure for table sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT NULL COMMENT '父部门id',
  `dept_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门名称',
  `order_num` int DEFAULT NULL COMMENT '显示顺序',
  `ancestors` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '祖级列表',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` (`dept_id`,`parent_id`,`dept_name`,`order_num`,`ancestors`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1','0','dept',NULL,NULL,NULL,NULL,NULL,NULL,'0');
INSERT INTO `sys_dept` (`dept_id`,`parent_id`,`dept_name`,`order_num`,`ancestors`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('2','1','2',NULL,'1,2',NULL,NULL,NULL,NULL,'0');
INSERT INTO `sys_dept` (`dept_id`,`parent_id`,`dept_name`,`order_num`,`ancestors`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('3','1','3',NULL,'1,3',NULL,NULL,NULL,NULL,'0');
INSERT INTO `sys_dept` (`dept_id`,`parent_id`,`dept_name`,`order_num`,`ancestors`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('4','2','4',NULL,'1,2,4',NULL,NULL,NULL,NULL,'0');
-- ----------------------------
-- Table structure for table sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典名称',
  `dict_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典类型',
  `remark` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `sys_dict_dict_code` (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` (`dict_id`,`dict_name`,`dict_code`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('100','aaaa','name',NULL,NULL,NULL,NULL,NULL,'0');
-- ----------------------------
-- Table structure for table sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `dict_id` bigint DEFAULT NULL COMMENT '字典ID',
  `dict_label` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典标签',
  `dict_value` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典键值',
  `style` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回显样式',
  `order_num` int DEFAULT NULL COMMENT '字典排序',
  `remark` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典项';

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` (`id`,`dict_id`,`dict_label`,`dict_value`,`style`,`order_num`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('129','100','你好','aaa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0');
-- ----------------------------
-- Table structure for table sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `log_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志类型(0正常 1异常)',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志标题',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP地址',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作地址',
  `os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求方法',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '请求参数',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求人',
  `time` bigint DEFAULT NULL COMMENT '执行时间(ms)',
  `exception` text COLLATE utf8mb4_unicode_ci COMMENT '异常信息',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT ' ' COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT ' ' COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_log_log_type` (`log_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('15','0','用户登录','0:0:0:0:0:0:0:1','内网IP','https://apifox.com','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginBody(username=admin是, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}',NULL,'392',NULL,NULL,'2024-07-29 18:09:24',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('16','0','用户登录','0:0:0:0:0:0:0:1','内网IP','https://apifox.com','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginBody(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}',NULL,'77',NULL,NULL,'2024-07-29 18:10:27',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('17','0','用户登录','0:0:0:0:0:0:0:1','内网IP','https://apifox.com','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginBody(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}',NULL,'52',NULL,NULL,'2024-07-29 18:17:24',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('18','0','用户登录','0:0:0:0:0:0:0:1','内网IP','https://apifox.com','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginBody(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}',NULL,'6',NULL,NULL,'2024-07-29 18:17:32',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('19','0','用户登录','0:0:0:0:0:0:0:1','内网IP','https://apifox.com','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginBody(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}',NULL,'13219',NULL,NULL,'2024-07-29 18:18:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('20','0','用户登录','0:0:0:0:0:0:0:1','内网IP','https://apifox.com','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginBody(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}','admin','707',NULL,NULL,'2024-07-29 19:22:48',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('21','0','用户登录','0:0:0:0:0:0:0:1','内网IP','https://apifox.com','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginBody(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}','admin','651',NULL,NULL,'2024-07-29 19:28:15',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('22','0','用户登录','0:0:0:0:0:0:0:1','内网IP','https://apifox.com','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginBody(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}','admin','83',NULL,NULL,'2024-07-29 19:29:27',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('23','0','用户登录','0:0:0:0:0:0:0:1','内网IP','https://apifox.com','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginBody(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}','admin','307',NULL,NULL,'2024-07-29 23:21:11',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('24','0','用户登录','0:0:0:0:0:0:0:1','内网IP','https://apifox.com','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginBody(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}','admin','297',NULL,NULL,'2024-07-29 23:22:45',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('25',NULL,'用户登录','0:0:0:0:0:0:0:1','内网IP','https://apifox.com','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginBody(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}','admin','57463',NULL,NULL,'2024-07-29 23:24:00',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('26','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Unknown','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginBody(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}','admin','17853',NULL,NULL,'2024-08-12 01:27:09',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('27','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Unknown','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginBody(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}','admin','195',NULL,NULL,'2024-08-12 01:27:38',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('28','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Unknown','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginBody(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}','admin','9284',NULL,NULL,'2024-08-12 01:47:22',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('29','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Unknown','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginBody(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}','admin','154',NULL,NULL,'2024-08-12 10:29:37',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('30','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Unknown','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginBody(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}','admin','167',NULL,NULL,'2024-08-12 10:31:30',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('31','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Unknown','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}',NULL,'44',NULL,NULL,'2024-11-13 15:22:52',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('32','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=111111)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'4',NULL,NULL,'2024-11-13 15:23:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('33','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=111111)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'5',NULL,NULL,'2024-11-13 15:23:08',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('34','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=111111)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'4',NULL,NULL,'2024-11-13 15:23:32',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('35','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=111111)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'6',NULL,NULL,'2024-11-13 15:24:18',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('36','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60004','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('37','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('38','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60004','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('39','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('40','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60005','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('41','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60007','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('42','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('43','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('44','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60004','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('45','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60006','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('46','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('47','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('48','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('49','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('50','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60008','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('51','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60023','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('52','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60012','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('53','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60019','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('54','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60013','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('55','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60017','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('56','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60012','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('57','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60018','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('58','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60018','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('59','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60026','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('60','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60018','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('61','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60018','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('62','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60022','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('63','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60017','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('64','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60035','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('65','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60032','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('66','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60018','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('67','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60036','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('68','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60006','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('69','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60033','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('70','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60035','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('71','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60033','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('72','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60036','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('73','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60008','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('74','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60041','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('75','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60032','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('76','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60061','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('77','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60057','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('78','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60065','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('79','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60009','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('80','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60071','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('81','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60078','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('82','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60050','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('83','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60044','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('84','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60059','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('85','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60063','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('86','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60050','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('87','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60063','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('88','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60072','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('89','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60055','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('90','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60083','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('91','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60068','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('92','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60098','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('93','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60082','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('94','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60106','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('95','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60109','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('96','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60097','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('97','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60113','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('98','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60092','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:31:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('99','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('100','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('101','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('102','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('103','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('104','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('105','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('106','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('107','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('108','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('109','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('110','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60004','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('111','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('112','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('113','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60006','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('114','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('115','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('116','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60007','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('117','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60008','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('118','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('119','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('120','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('121','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('122','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('123','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('124','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('125','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('126','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('127','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('128','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('129','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('130','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60009','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('131','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60011','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('132','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60018','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('133','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60018','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('134','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60020','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('135','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60018','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('136','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60021','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('137','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60041','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('138','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60020','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('139','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60023','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('140','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60021','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('141','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60006','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('142','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60019','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('143','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60025','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('144','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60029','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('145','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60019','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('146','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60029','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('147','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60035','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('148','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60042','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('149','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60021','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('150','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60029','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('151','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60027','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('152','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60045','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('153','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60026','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('154','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60028','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('155','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60026','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('156','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60033','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('157','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60031','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('158','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60054','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('159','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60028','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('160','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60055','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('161','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60060','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:37:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('162','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('163','1','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Unknown','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}',NULL,'60026','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('164','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60005','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('165','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('166','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('167','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('168','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('169','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('170','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('171','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('172','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('173','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('174','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('175','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('176','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('177','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('178','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('179','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('180','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('181','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('182','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60004','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('183','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('184','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('185','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('186','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60008','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('187','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('188','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('189','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('190','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('191','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('192','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('193','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60004','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('194','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('195','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('196','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60005','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('197','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('198','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('199','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('200','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('201','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('202','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('203','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('204','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('205','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('206','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('207','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('208','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('209','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('210','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('211','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('212','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('213','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('214','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('215','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('216','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('217','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('218','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('219','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('220','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60004','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('221','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('222','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60007','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('223','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('224','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60008','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('225','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('226','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:38:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('227','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('228','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('229','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('230','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('231','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('232','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('233','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('234','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('235','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('236','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('237','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('238','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('239','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('240','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('241','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('242','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('243','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('244','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('245','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('246','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('247','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('248','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('249','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('250','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('251','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('252','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('253','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('254','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('255','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('256','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('257','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('258','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('259','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('260','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('261','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('262','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('263','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('264','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('265','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('266','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('267','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('268','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('269','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('270','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('271','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('272','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('273','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('274','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('275','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('276','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('277','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('278','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('279','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('280','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('281','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('282','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('283','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('284','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('285','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('286','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('287','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60007','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('288','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60022','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('289','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60016','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('290','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60017','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:39:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('291','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('292','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('293','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('294','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('295','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('296','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('297','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('298','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('299','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('300','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('301','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('302','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('303','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('304','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('305','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('306','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('307','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('308','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('309','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('310','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('311','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('312','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('313','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('314','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('315','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('316','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('317','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('318','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('319','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('320','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('321','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('322','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('323','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('324','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('325','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('326','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('327','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('328','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('329','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('330','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('331','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('332','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('333','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('334','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('335','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('336','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('337','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('338','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('339','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('340','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('341','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('342','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('343','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('344','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('345','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('346','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('347','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('348','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('349','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('350','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('351','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60004','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('352','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('353','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('354','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:40:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('355','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('356','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('357','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('358','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('359','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('360','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60004','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('361','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('362','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('363','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('364','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('365','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('366','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('367','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('368','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('369','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('370','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('371','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('372','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('373','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('374','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('375','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60004','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('376','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('377','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('378','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('379','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('380','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('381','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('382','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('383','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('384','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('385','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('386','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('387','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('388','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('389','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('390','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('391','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('392','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('393','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('394','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('395','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('396','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('397','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('398','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('399','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('400','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('401','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('402','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('403','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('404','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('405','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('406','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('407','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('408','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('409','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('410','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('411','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('412','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('413','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('414','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('415','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('416','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('417','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:41:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('418','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('419','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60004','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('420','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('421','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('422','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('423','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('424','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('425','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('426','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('427','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('428','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('429','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('430','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('431','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('432','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('433','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('434','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('435','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('436','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60004','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('437','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('438','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('439','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('440','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('441','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('442','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('443','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('444','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('445','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('446','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('447','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('448','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('449','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('450','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('451','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('452','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('453','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('454','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('455','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('456','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('457','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('458','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('459','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('460','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('461','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('462','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('463','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('464','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('465','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('466','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('467','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('468','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('469','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('470','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('471','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('472','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('473','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('474','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('475','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('476','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('477','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('478','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('479','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('480','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('481','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:42:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('482','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('483','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('484','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('485','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('486','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('487','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('488','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('489','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('490','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('491','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('492','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('493','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('494','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('495','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('496','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('497','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('498','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('499','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('500','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('501','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('502','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('503','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('504','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('505','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('506','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('507','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('508','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('509','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('510','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('511','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('512','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('513','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('514','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('515','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('516','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('517','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('518','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('519','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('520','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('521','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('522','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('523','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('524','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('525','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('526','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('527','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('528','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('529','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60004','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('530','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('531','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('532','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('533','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('534','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('535','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('536','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('537','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('538','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('539','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('540','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('541','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('542','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('543','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('544','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('545','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('546','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('547','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('548','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('549','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('550','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('551','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('552','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('553','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('554','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('555','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('556','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('557','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('558','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('559','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('560','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('561','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('562','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('563','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('564','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('565','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('566','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('567','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('568','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('569','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('570','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('571','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('572','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('573','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('574','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60004','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('575','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('576','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('577','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('578','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('579','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('580','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('581','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('582','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('583','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('584','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('585','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('586','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('587','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('588','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('589','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('590','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('591','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('592','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('593','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('594','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('595','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('596','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('597','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('598','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('599','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('600','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('601','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('602','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('603','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('604','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('605','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('606','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('607','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('608','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('609','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:44:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('610','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('611','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('612','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('613','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('614','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('615','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('616','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('617','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('618','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('619','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('620','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('621','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('622','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('623','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('624','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('625','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('626','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('627','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('628','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('629','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('630','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('631','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('632','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('633','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('634','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('635','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('636','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('637','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('638','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('639','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('640','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('641','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('642','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('643','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('644','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('645','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('646','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('647','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('648','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('649','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('650','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('651','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('652','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('653','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('654','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('655','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('656','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('657','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('658','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('659','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('660','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('661','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('662','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('663','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('664','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('665','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('666','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('667','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('668','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('669','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('670','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('671','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('672','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('673','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:45:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('674','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('675','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('676','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('677','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('678','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('679','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('680','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('681','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('682','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('683','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('684','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('685','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('686','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('687','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('688','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('689','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('690','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('691','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('692','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('693','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('694','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('695','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('696','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('697','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('698','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('699','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('700','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('701','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('702','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('703','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('704','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('705','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('706','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('707','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('708','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('709','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('710','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('711','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('712','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('713','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('714','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('715','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('716','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('717','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('718','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('719','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('720','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('721','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('722','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('723','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('724','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('725','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('726','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('727','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('728','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('729','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('730','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('731','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('732','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('733','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('734','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('735','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('736','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('737','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:46:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('738','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('739','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59982','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('740','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59983','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('741','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('742','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('743','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59980','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('744','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59982','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('745','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59980','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('746','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59982','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('747','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59984','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('748','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59984','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('749','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59980','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('750','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('751','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('752','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59982','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('753','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('754','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59982','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('755','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59982','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('756','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('757','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59980','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('758','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59980','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('759','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59980','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('760','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('761','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59980','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('762','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('763','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59982','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('764','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('765','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('766','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('767','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59982','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('768','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59982','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('769','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('770','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59980','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('771','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59982','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('772','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59980','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('773','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('774','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('775','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59982','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('776','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('777','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('778','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('779','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('780','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59980','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('781','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59980','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('782','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('783','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59982','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('784','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('785','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59980','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('786','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59982','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('787','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('788','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('789','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59980','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('790','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('791','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59980','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('792','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('793','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59980','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('794','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('795','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59982','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('796','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('797','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('798','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59982','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('799','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59980','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('800','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59981','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('801','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59982','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:47:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('802','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'59982','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('803','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('804','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('805','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('806','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('807','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('808','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('809','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('810','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('811','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('812','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('813','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('814','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('815','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('816','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('817','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('818','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('819','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('820','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('821','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('822','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('823','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('824','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('825','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('826','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('827','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('828','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('829','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('830','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('831','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('832','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('833','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('834','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('835','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('836','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('837','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('838','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('839','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('840','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('841','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('842','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('843','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('844','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('845','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('846','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('847','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('848','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('849','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('850','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('851','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('852','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('853','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('854','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('855','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('856','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('857','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('858','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('859','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('860','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('861','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('862','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('863','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('864','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('865','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('866','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('867','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('868','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('869','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('870','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('871','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('872','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('873','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('874','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('875','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60004','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('876','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('877','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('878','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('879','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('880','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('881','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('882','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('883','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('884','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('885','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('886','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('887','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('888','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('889','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('890','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('891','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('892','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('893','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('894','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('895','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('896','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('897','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('898','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('899','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('900','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('901','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('902','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('903','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('904','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('905','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('906','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('907','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('908','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('909','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('910','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('911','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('912','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('913','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('914','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('915','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('916','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('917','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('918','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('919','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('920','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('921','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('922','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('923','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('924','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('925','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('926','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('927','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('928','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('929','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:49:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('930','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('931','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('932','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('933','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('934','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('935','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('936','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('937','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('938','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('939','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('940','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('941','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('942','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('943','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('944','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('945','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('946','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('947','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60003','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('948','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('949','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('950','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('951','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('952','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('953','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('954','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('955','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('956','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('957','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('958','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('959','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('960','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('961','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('962','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('963','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('964','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('965','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('966','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('967','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('968','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('969','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('970','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('971','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('972','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('973','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('974','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('975','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('976','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('977','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('978','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('979','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('980','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('981','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('982','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('983','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('984','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('985','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('986','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('987','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('988','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('989','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60000','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('990','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60002','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('991','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('992','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('993','1','登录admin','127.0.0.1','内网IP','Robot/Spider','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/login",
  "浏览器" : "Java/17.0.6"
}',NULL,'60001','Read timed out executing POST http://127.0.0.1:8080/login',NULL,'2024-11-13 15:50:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('994','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Unknown','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}',NULL,'46',NULL,NULL,'2024-11-13 16:33:16',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('995','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Unknown','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}',NULL,'44',NULL,NULL,'2024-11-13 16:36:07',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('996','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Unknown','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}',NULL,'5',NULL,NULL,'2024-11-13 16:37:54',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('997','0','注册admin1','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Unknown','com.yongoe.pure.auth.controller.LoginController.register','{
  "请求参数" : "[RegisterDto(username=admin1, password=123456, nickname=aa)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/register",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}',NULL,'104',NULL,NULL,'2024-11-13 16:38:13',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('998','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Unknown','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}',NULL,'7',NULL,NULL,'2024-11-13 16:39:15',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('999','0','注册admin1','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Unknown','com.yongoe.pure.auth.controller.LoginController.register','{
  "请求参数" : "[RegisterDto(username=admin1, password=123456, nickname=aa)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/register",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}',NULL,'80',NULL,NULL,'2024-11-13 16:40:43',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1000','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Unknown','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}',NULL,'11',NULL,NULL,'2024-11-13 16:40:45',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1001','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Unknown','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}',NULL,'169',NULL,NULL,'2024-11-13 16:51:02',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1002','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=111111)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'32',NULL,NULL,'2024-11-13 16:53:58',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1003','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'65',NULL,NULL,'2024-11-13 16:54:05',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1004','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'108',NULL,NULL,'2024-11-13 17:09:47',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1005','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'152',NULL,NULL,'2024-11-13 17:23:14',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1006','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'74',NULL,NULL,'2024-11-13 18:12:50',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1007','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'45',NULL,NULL,'2024-11-13 18:15:35',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1008','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'44',NULL,NULL,'2024-11-13 18:16:27',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1009','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'46',NULL,NULL,'2024-11-13 18:27:23',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1010','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'137',NULL,NULL,'2024-11-13 18:51:07',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1011','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'104',NULL,NULL,'2024-11-13 18:51:26',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1012','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'72',NULL,NULL,'2024-11-13 20:11:10',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1013','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'86',NULL,NULL,'2024-11-13 20:11:11',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1014','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'102',NULL,NULL,'2024-11-13 20:17:05',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1015','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'52',NULL,NULL,'2024-11-13 20:17:06',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1016','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'36',NULL,NULL,'2024-11-13 20:19:21',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1017','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'69',NULL,NULL,'2024-11-13 20:20:46',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1018','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'41',NULL,NULL,'2024-11-13 20:25:24',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1019','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'44',NULL,NULL,'2024-11-13 20:26:25',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1020','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'34',NULL,NULL,'2024-11-13 20:26:32',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1021','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'32',NULL,NULL,'2024-11-13 20:28:22',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1022','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'58',NULL,NULL,'2024-11-13 20:28:39',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1023','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'50',NULL,NULL,'2024-11-13 20:39:01',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1024','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'74',NULL,NULL,'2024-11-13 20:42:33',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1025','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'36',NULL,NULL,'2024-11-13 20:42:37',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1026','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'35',NULL,NULL,'2024-11-13 20:42:40',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1027','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'50',NULL,NULL,'2024-11-13 20:43:07',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1028','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'65',NULL,NULL,'2024-11-13 20:43:29',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1029','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'96',NULL,NULL,'2024-11-13 20:43:31',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1030','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'44',NULL,NULL,'2024-11-13 20:43:43',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1031','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'35',NULL,NULL,'2024-11-13 20:44:08',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1032','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'31',NULL,NULL,'2024-11-13 20:44:12',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1033','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'50',NULL,NULL,'2024-11-13 20:45:24',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1034','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'43',NULL,NULL,'2024-11-13 20:46:00',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1035','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'26',NULL,NULL,'2024-11-13 20:47:27',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1036','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'111',NULL,NULL,'2024-11-13 20:47:29',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1037','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'35',NULL,NULL,'2024-11-13 20:47:59',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1038','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'65',NULL,NULL,'2024-11-13 20:48:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1039','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'33',NULL,NULL,'2024-11-13 20:48:27',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1040','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'26',NULL,NULL,'2024-11-13 20:49:39',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1041','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'39',NULL,NULL,'2024-11-13 20:49:42',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1042','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'34',NULL,NULL,'2024-11-13 20:50:19',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1043','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'53',NULL,NULL,'2024-11-13 20:51:16',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1044','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'41',NULL,NULL,'2024-11-13 20:51:17',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1045','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'64',NULL,NULL,'2024-11-13 20:55:26',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1046','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'48',NULL,NULL,'2024-11-13 20:57:37',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1047','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'51',NULL,NULL,'2024-11-13 21:03:22',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1048','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'43',NULL,NULL,'2024-11-13 21:06:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1049','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'154',NULL,NULL,'2024-11-13 21:09:38',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1050','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'44',NULL,NULL,'2024-11-13 21:10:16',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1051','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'62',NULL,NULL,'2024-11-13 21:11:39',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1052','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'94',NULL,NULL,'2024-11-13 21:16:14',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1053','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'179',NULL,NULL,'2024-11-13 21:17:48',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1054','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'112',NULL,NULL,'2024-11-13 21:20:00',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1055','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'54',NULL,NULL,'2024-11-13 21:26:09',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1056','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'52',NULL,NULL,'2024-11-13 21:26:23',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1057','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'96',NULL,NULL,'2024-11-13 21:26:40',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1058','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'71',NULL,NULL,'2024-11-13 21:31:51',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1059','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'47',NULL,NULL,'2024-11-13 21:33:46',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1060','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'70',NULL,NULL,'2024-11-13 21:34:18',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1061','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'1184',NULL,NULL,'2024-11-13 21:36:39',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1062','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'51',NULL,NULL,'2024-11-13 21:39:21',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1063','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'72',NULL,NULL,'2024-11-13 21:42:45',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1064','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'171',NULL,NULL,'2024-11-13 21:55:01',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1065','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'144',NULL,NULL,'2024-11-13 21:55:12',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1066','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'68',NULL,NULL,'2024-11-13 21:58:13',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1067','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'51',NULL,NULL,'2024-11-13 21:58:14',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1068','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'101',NULL,NULL,'2024-11-13 21:58:22',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1069','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'42',NULL,NULL,'2024-11-13 21:58:26',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1070','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'70',NULL,NULL,'2024-11-13 22:03:11',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1071','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'28',NULL,NULL,'2024-11-13 22:03:12',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1072','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'366',NULL,NULL,'2024-11-13 22:05:47',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1073','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'56',NULL,NULL,'2024-11-13 22:06:16',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1074','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'126',NULL,NULL,'2024-11-13 22:06:44',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1075','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'47',NULL,NULL,'2024-11-13 22:07:16',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1076','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'25',NULL,NULL,'2024-11-13 22:07:16',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1077','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'53',NULL,NULL,'2024-11-13 22:08:09',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1078','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'47',NULL,NULL,'2024-11-13 22:08:11',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1079','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'174',NULL,NULL,'2024-11-13 22:08:40',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1080','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'58',NULL,NULL,'2024-11-13 22:08:53',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1081','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'50',NULL,NULL,'2024-11-13 22:08:56',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1082','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'29',NULL,NULL,'2024-11-13 22:09:16',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1083','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'177',NULL,NULL,'2024-11-13 22:09:35',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1084','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'47',NULL,NULL,'2024-11-13 22:09:43',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1085','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'38',NULL,NULL,'2024-11-13 22:09:45',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1086','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'67',NULL,NULL,'2024-11-13 22:11:16',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1087','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'46',NULL,NULL,'2024-11-13 22:12:55',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1088','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'50',NULL,NULL,'2024-11-13 22:13:23',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1089','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'57',NULL,NULL,'2024-11-13 22:13:49',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1090','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'195',NULL,NULL,'2024-11-13 22:16:25',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1091','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'28',NULL,NULL,'2024-11-13 22:16:27',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1092','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'54',NULL,NULL,'2024-11-13 22:16:55',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1093','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'30',NULL,NULL,'2024-11-13 22:17:02',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1094','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'70',NULL,NULL,'2024-11-13 22:20:44',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1095','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'51',NULL,NULL,'2024-11-13 22:30:32',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1096','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'47',NULL,NULL,'2024-11-13 22:34:32',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1097','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'58',NULL,NULL,'2024-11-13 22:41:46',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1098','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'133',NULL,NULL,'2024-11-14 11:45:14',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1099','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'47',NULL,NULL,'2024-11-14 11:48:16',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1100','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'49',NULL,NULL,'2024-11-14 11:49:28',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1101','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'60',NULL,NULL,'2024-11-14 15:14:36',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1102','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'61',NULL,NULL,'2024-11-14 15:43:41',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1103','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'40',NULL,NULL,'2024-11-14 15:44:53',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1104','0','登录ss','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=ss, password=ss)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}','admin','12',NULL,NULL,'2024-11-14 15:45:14',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1105','0','登录ss','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=ss, password=ss)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}','admin','34',NULL,NULL,'2024-11-14 15:54:40',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1106','0','登录ss','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=ss, password=ss)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}','admin','8',NULL,NULL,'2024-11-14 15:54:41',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1107','0','登录ss','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=ss, password=ss)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}','admin','21',NULL,NULL,'2024-11-14 16:03:22',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1108','0','登录ss','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=ss, password=ss)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}','admin','7',NULL,NULL,'2024-11-14 16:03:31',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1109','0','登录ss','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=ss, password=ss)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}','admin','18',NULL,NULL,'2024-11-14 16:16:23',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1110','0','登录ss','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=ss, password=ss)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}','admin','19',NULL,NULL,'2024-11-14 16:21:24',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1111','0','登录ss','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=ss, password=ss)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}','admin','8',NULL,NULL,'2024-11-14 16:24:17',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1112','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'36',NULL,NULL,'2024-11-14 16:24:20',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1113','0','登录ss','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=ss, password=ss)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}','admin','20',NULL,NULL,'2024-11-14 16:29:43',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1114','0','登录ss','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=ss, password=ss)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}','admin','12',NULL,NULL,'2024-11-14 16:29:44',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1115','0','登录ss','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=ss, password=ss)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}','admin','9',NULL,NULL,'2024-11-14 16:30:13',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1116','0','登录ss','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=ss, password=ss)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}','admin','7',NULL,NULL,'2024-11-14 16:30:25',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1117','0','登录g','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=g, password=g)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}','admin','7',NULL,NULL,'2024-11-14 16:31:47',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1118','0','登录ssadmin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=ssadmin, password=ss)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}','admin','14',NULL,NULL,'2024-11-14 16:40:55',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1119','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=1)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}','admin','20',NULL,NULL,'2024-11-14 16:40:58',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1120','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'28',NULL,NULL,'2024-11-14 16:41:00',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1121','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'32',NULL,NULL,'2024-11-14 16:42:36',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1122','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'37',NULL,NULL,'2024-11-14 16:45:40',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1123','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Unknown','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}',NULL,'77',NULL,NULL,'2024-11-15 00:45:47',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1124','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'123',NULL,NULL,'2024-11-15 01:07:58',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1125','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Unknown','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Apifox/1.0.0 (https://apifox.com)"
}',NULL,'146',NULL,NULL,'2024-11-15 10:45:23',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1126','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'127',NULL,NULL,'2024-11-15 13:33:37',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1127','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'128',NULL,NULL,'2024-11-15 14:36:08',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1128','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'45',NULL,NULL,'2024-11-15 14:36:55',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1129','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'131',NULL,NULL,'2024-11-15 14:43:04',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1130','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'44',NULL,NULL,'2024-11-15 14:46:59',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1131','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'88',NULL,NULL,'2024-11-15 23:08:38',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1132','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'38',NULL,NULL,'2024-11-15 23:10:11',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1133','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'38',NULL,NULL,'2024-11-15 23:10:49',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1134','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'44',NULL,NULL,'2024-11-15 23:14:23',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1135','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'28',NULL,NULL,'2024-11-15 23:15:31',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1136','1','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'65818','Read timed out executing POST http://127.0.0.1:8080/system/login',NULL,'2024-11-15 23:27:52',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1137','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'5822',NULL,NULL,'2024-11-15 23:28:01',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1138','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'2835',NULL,NULL,'2024-11-15 23:29:11',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1139','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'4294',NULL,NULL,'2024-11-15 23:30:37',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1140','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'35',NULL,NULL,'2024-11-16 00:01:15',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1141','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'35',NULL,NULL,'2024-11-16 00:06:41',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1142','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'33',NULL,NULL,'2024-11-16 00:07:25',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1143','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'32',NULL,NULL,'2024-11-16 00:09:36',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1144','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'36',NULL,NULL,'2024-11-16 00:28:21',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1145','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'94',NULL,NULL,'2024-11-16 14:13:01',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1146','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'30',NULL,NULL,'2024-11-16 14:14:57',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1147','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'34',NULL,NULL,'2024-11-16 14:16:21',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1148','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'44',NULL,NULL,'2024-11-16 14:27:34',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1149','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'66',NULL,NULL,'2024-11-16 14:40:27',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1150','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'28',NULL,NULL,'2024-11-16 14:41:27',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1151','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'43',NULL,NULL,'2024-11-16 15:00:41',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1152','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'77',NULL,NULL,'2024-11-16 20:42:01',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1153','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'49',NULL,NULL,'2024-11-16 20:44:57',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1154','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'35',NULL,NULL,'2024-11-16 20:45:14',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1155','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0"
}',NULL,'27',NULL,NULL,'2024-11-16 20:45:30',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1156','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0"
}',NULL,'136',NULL,NULL,'2024-11-19 14:42:24',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1157','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0"
}',NULL,'168',NULL,NULL,'2024-12-19 13:44:13',' ',NULL,'0');
INSERT INTO `sys_log` (`id`,`log_type`,`title`,`ip`,`address`,`os`,`method`,`params`,`username`,`time`,`exception`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1158','0','登录admin','0:0:0:0:0:0:0:1','����ʡ ��ԭ��','Chrome 13','com.yongoe.pure.auth.controller.LoginController.loginPC','{
  "请求参数" : "[LoginDto(username=admin, password=123456)]",
  "请求类型" : "POST",
  "请求地址" : "/auth/login",
  "浏览器" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0"
}',NULL,'58',NULL,NULL,'2024-12-19 13:56:07',' ',NULL,'0');
-- ----------------------------
-- Table structure for table sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `parent_id` bigint DEFAULT NULL COMMENT '父菜单ID',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单名称',
  `permission` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权限标识',
  `path` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路由地址',
  `component` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路由参数',
  `embedded` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否内嵌（0否 1是）',
  `keep_alive` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否缓存（0否 1是）',
  `menu_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单类型（0目录，1菜单，2按钮）',
  `visible` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否可见（0否 1是）',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单状态（0禁用 1可用）',
  `icon` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单图标',
  `order_num` int DEFAULT NULL COMMENT '显示顺序',
  `remark` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` (`menu_id`,`parent_id`,`name`,`permission`,`path`,`component`,`query`,`embedded`,`keep_alive`,`menu_type`,`visible`,`status`,`icon`,`order_num`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1','0','第一个','system:add','/aaa','','','1','0','1','1','1','AlertFilled','1',NULL,NULL,NULL,NULL,NULL,'0');
INSERT INTO `sys_menu` (`menu_id`,`parent_id`,`name`,`permission`,`path`,`component`,`query`,`embedded`,`keep_alive`,`menu_type`,`visible`,`status`,`icon`,`order_num`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('2','1','bbb','admin','/sss','/system/aaa','','1','0','2','1','1','','1',NULL,NULL,NULL,NULL,NULL,'0');
INSERT INTO `sys_menu` (`menu_id`,`parent_id`,`name`,`permission`,`path`,`component`,`query`,`embedded`,`keep_alive`,`menu_type`,`visible`,`status`,`icon`,`order_num`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('3','2','ccc','bbb',NULL,NULL,NULL,'1','0','3','1','1',NULL,'0',NULL,NULL,NULL,NULL,NULL,'0');
INSERT INTO `sys_menu` (`menu_id`,`parent_id`,`name`,`permission`,`path`,`component`,`query`,`embedded`,`keep_alive`,`menu_type`,`visible`,`status`,`icon`,`order_num`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('2000','1','ddd','ddd','/homes','/home',NULL,'1','0','2','1','1',NULL,'1',NULL,NULL,NULL,NULL,NULL,'0');
-- ----------------------------
-- Table structure for table sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `post_sort` int DEFAULT NULL COMMENT '岗位排序',
  `remark` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` (`post_id`,`post_name`,`post_sort`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1','post',NULL,NULL,NULL,NULL,NULL,NULL,'0');
INSERT INTO `sys_post` (`post_id`,`post_name`,`post_sort`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('2','22',NULL,NULL,NULL,NULL,NULL,NULL,'0');
INSERT INTO `sys_post` (`post_id`,`post_name`,`post_sort`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('3','33',NULL,NULL,NULL,NULL,NULL,NULL,'0');
-- ----------------------------
-- Table structure for table sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色权限字符',
  `data_scope` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据范围(默认0 全部数据)',
  `remark` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `sys_role_code` (`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` (`role_id`,`role_name`,`role_code`,`data_scope`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1','admin','admin','0',NULL,NULL,NULL,NULL,NULL,'0');
-- ----------------------------
-- Table structure for table sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` (`role_id`,`dept_id`)  VALUES ('1','1');
INSERT INTO `sys_role_dept` (`role_id`,`dept_id`)  VALUES ('1','2');
INSERT INTO `sys_role_dept` (`role_id`,`dept_id`)  VALUES ('1','3');
-- ----------------------------
-- Table structure for table sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` (`role_id`,`menu_id`)  VALUES ('1','1');
INSERT INTO `sys_role_menu` (`role_id`,`menu_id`)  VALUES ('1','2');
INSERT INTO `sys_role_menu` (`role_id`,`menu_id`)  VALUES ('1','3');
-- ----------------------------
-- Table structure for table sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话号码',
  `sex` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '帐号状态（1正常 0停用）',
  `remark` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `user_extra_data` json DEFAULT NULL COMMENT '用户额外数据',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `sys_user_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` (`user_id`,`dept_id`,`username`,`password`,`nickname`,`name`,`email`,`phone`,`sex`,`avatar`,`status`,`remark`,`user_extra_data`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1','1','admin','7c4a8d09ca3762af61e59520943dc26494f8941b','aa','你你你你你你','aa','aa','a','https://tse1-mm.cn.bing.net/th/id/OIP-C.rAzIUHScvAJZYEnsOYB3oAHaNK?rs=1&pid=ImgDetMain','1',NULL,'{}',NULL,'2024-07-06 21:52:40',NULL,NULL,'0');
INSERT INTO `sys_user` (`user_id`,`dept_id`,`username`,`password`,`nickname`,`name`,`email`,`phone`,`sex`,`avatar`,`status`,`remark`,`user_extra_data`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('4',NULL,'admin1','7c4a8d09ca3762af61e59520943dc26494f8941b','aa',NULL,NULL,NULL,NULL,NULL,'1',NULL,'{}',NULL,'2024-11-13 16:38:12',NULL,NULL,'0');
-- ----------------------------
-- Table structure for table sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` (`user_id`,`post_id`)  VALUES ('1','1');
INSERT INTO `sys_user_post` (`user_id`,`post_id`)  VALUES ('1','2');
-- ----------------------------
-- Table structure for table sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` (`user_id`,`role_id`)  VALUES ('1','1');
INSERT INTO `sys_user_role` (`user_id`,`role_id`)  VALUES ('4','1');
-- ----------------------------
-- Table structure for table xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_group`;
CREATE TABLE `xxl_job_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) NOT NULL COMMENT '执行器名称',
  `address_type` tinyint NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
INSERT INTO `xxl_job_group` (`id`,`app_name`,`title`,`address_type`,`address_list`,`update_time`)  VALUES ('1','xxl-job-executor-sample','示例执行器',0,NULL,'2025-01-15 19:25:24');
INSERT INTO `xxl_job_group` (`id`,`app_name`,`title`,`address_type`,`address_list`,`update_time`)  VALUES ('2','pure-job','pure-job',0,NULL,'2025-01-15 19:25:24');
-- ----------------------------
-- Table structure for table xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_info`;
CREATE TABLE `xxl_job_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `glue_type` varchar(50) NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint NOT NULL DEFAULT '0' COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint NOT NULL DEFAULT '0' COMMENT '上次调度时间',
  `trigger_next_time` bigint NOT NULL DEFAULT '0' COMMENT '下次调度时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
INSERT INTO `xxl_job_info` (`id`,`job_group`,`job_desc`,`add_time`,`update_time`,`author`,`alarm_email`,`schedule_type`,`schedule_conf`,`misfire_strategy`,`executor_route_strategy`,`executor_handler`,`executor_param`,`executor_block_strategy`,`executor_timeout`,`executor_fail_retry_count`,`glue_type`,`glue_source`,`glue_remark`,`glue_updatetime`,`child_jobid`,`trigger_status`,`trigger_last_time`,`trigger_next_time`)  VALUES ('1','1','测试任务1','2018-11-03 22:21:31','2018-11-03 22:21:31','XXL','','CRON','0 0 0 * * ? *','DO_NOTHING','FIRST','demoJobHandler','','SERIAL_EXECUTION','0','0','BEAN','','GLUE代码初始化','2018-11-03 22:21:31','',0,'0','0');
INSERT INTO `xxl_job_info` (`id`,`job_group`,`job_desc`,`add_time`,`update_time`,`author`,`alarm_email`,`schedule_type`,`schedule_conf`,`misfire_strategy`,`executor_route_strategy`,`executor_handler`,`executor_param`,`executor_block_strategy`,`executor_timeout`,`executor_fail_retry_count`,`glue_type`,`glue_source`,`glue_remark`,`glue_updatetime`,`child_jobid`,`trigger_status`,`trigger_last_time`,`trigger_next_time`)  VALUES ('2','2','啥啥','2024-07-30 14:30:41','2024-07-30 14:30:41','啥啥','','CRON','* * * * * ?','DO_NOTHING','FIRST','demoJobHandler','','SERIAL_EXECUTION','0','0','BEAN','','GLUE代码初始化','2024-07-30 14:30:41','',0,'0','0');
-- ----------------------------
-- Table structure for table xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_lock`;
CREATE TABLE `xxl_job_lock` (
  `lock_name` varchar(50) NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
INSERT INTO `xxl_job_lock` (`lock_name`)  VALUES ('schedule_lock');
-- ----------------------------
-- Table structure for table xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log`;
CREATE TABLE `xxl_job_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `trigger_time` datetime DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int NOT NULL COMMENT '调度-结果',
  `trigger_msg` text COMMENT '调度-日志',
  `handle_time` datetime DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int NOT NULL COMMENT '执行-状态',
  `handle_msg` text COMMENT '执行-日志',
  `alarm_status` tinyint NOT NULL DEFAULT '0' COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`),
  KEY `I_trigger_time` (`trigger_time`),
  KEY `I_handle_code` (`handle_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------
-- ----------------------------
-- Table structure for table xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log_report`;
CREATE TABLE `xxl_job_log_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime DEFAULT NULL COMMENT '调度-时间',
  `running_count` int NOT NULL DEFAULT '0' COMMENT '运行中-日志数量',
  `suc_count` int NOT NULL DEFAULT '0' COMMENT '执行成功-日志数量',
  `fail_count` int NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_trigger_day` (`trigger_day`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
INSERT INTO `xxl_job_log_report` (`id`,`trigger_day`,`running_count`,`suc_count`,`fail_count`,`update_time`)  VALUES ('1','2024-07-30 00:00:00','0','2','1',NULL);
INSERT INTO `xxl_job_log_report` (`id`,`trigger_day`,`running_count`,`suc_count`,`fail_count`,`update_time`)  VALUES ('2','2024-07-29 00:00:00','0','0','0',NULL);
INSERT INTO `xxl_job_log_report` (`id`,`trigger_day`,`running_count`,`suc_count`,`fail_count`,`update_time`)  VALUES ('3','2024-07-28 00:00:00','0','0','0',NULL);
INSERT INTO `xxl_job_log_report` (`id`,`trigger_day`,`running_count`,`suc_count`,`fail_count`,`update_time`)  VALUES ('4','2024-07-31 00:00:00','0','3','2',NULL);
INSERT INTO `xxl_job_log_report` (`id`,`trigger_day`,`running_count`,`suc_count`,`fail_count`,`update_time`)  VALUES ('5','2025-01-15 00:00:00','0','0','0',NULL);
INSERT INTO `xxl_job_log_report` (`id`,`trigger_day`,`running_count`,`suc_count`,`fail_count`,`update_time`)  VALUES ('6','2025-01-14 00:00:00','0','0','0',NULL);
INSERT INTO `xxl_job_log_report` (`id`,`trigger_day`,`running_count`,`suc_count`,`fail_count`,`update_time`)  VALUES ('7','2025-01-13 00:00:00','0','0','0',NULL);
-- ----------------------------
-- Table structure for table xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_logglue`;
CREATE TABLE `xxl_job_logglue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------
-- ----------------------------
-- Table structure for table xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_registry`;
CREATE TABLE `xxl_job_registry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) NOT NULL,
  `registry_key` varchar(255) NOT NULL,
  `registry_value` varchar(255) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_g_k_v` (`registry_group`,`registry_key`,`registry_value`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------
-- ----------------------------
-- Table structure for table xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_user`;
CREATE TABLE `xxl_job_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
INSERT INTO `xxl_job_user` (`id`,`username`,`password`,`role`,`permission`)  VALUES ('1','admin','e10adc3949ba59abbe56e057f20f883e',1,NULL);
SET FOREIGN_KEY_CHECKS=1;

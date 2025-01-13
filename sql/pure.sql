-- ----------------------------
-- Chat2DB export data , export time: 2024-08-26 17:36:30
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
  `gen_type` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成代码方式（自动到项目里）',
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
INSERT INTO `gen_table` (`table_id`,`table_name`,`table_comment`,`sub_table_name`,`sub_table_fk_name`,`entity_name`,`gen_category`,`maven_module_name`,`gen_module_type`,`package_name`,`module_name`,`business_name`,`business_name_zh`,`menu_parent_id`,`author`,`gen_type`,`options`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1','sys_user','用户表',NULL,NULL,'SysUser','crud','pure-emp','simple','com.yongoe.pure.emp','emp','sysUser','用户表','1','pure','auto',NULL,NULL,NULL,'2024-08-02 17:30:50','',NULL,'0');
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
  `java_import` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'java导入路径',
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1','1','user_id','用户ID','BIGINT(19)','Long','userId',NULL,'1','1','0','0','0','0','0','=','input',NULL,NULL,NULL,'2024-08-02 17:30:50',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('2','1','dept_id','部门ID','BIGINT(19)','Long','deptId',NULL,'0','0','1','1','1','1','1','=','input',NULL,NULL,NULL,'2024-08-02 17:30:50',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('3','1','username','账号','VARCHAR(64)','String','username',NULL,'0','0','1','1','1','1','1','LIKE','input',NULL,NULL,NULL,'2024-08-02 17:30:50',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('4','1','password','密码','VARCHAR(255)','String','password',NULL,'0','0','1','1','1','1','1','LIKE','input',NULL,NULL,NULL,'2024-08-02 17:30:50',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('5','1','nickname','昵称','VARCHAR(64)','String','nickname',NULL,'0','0','1','1','1','1','1','LIKE','input',NULL,NULL,NULL,'2024-08-02 17:30:50',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('6','1','name','姓名','VARCHAR(64)','String','name',NULL,'0','0','1','1','1','1','1','LIKE','input',NULL,NULL,NULL,'2024-08-02 17:30:50',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('7','1','email','邮箱','VARCHAR(128)','String','email',NULL,'0','0','1','1','1','1','1','LIKE','input',NULL,NULL,NULL,'2024-08-02 17:30:50',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('8','1','phone','电话号码','VARCHAR(32)','String','phone',NULL,'0','0','1','1','1','1','1','LIKE','input',NULL,NULL,NULL,'2024-08-02 17:30:50',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('9','1','sex','用户性别（0男 1女 2未知）','CHAR(1)','String','sex',NULL,'0','0','1','1','1','1','1','LIKE','input',NULL,NULL,NULL,'2024-08-02 17:30:50',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('10','1','avatar','头像','VARCHAR(255)','String','avatar',NULL,'0','0','1','1','1','1','1','LIKE','input',NULL,NULL,NULL,'2024-08-02 17:30:50',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('11','1','status','帐号状态（1正常 0停用）','CHAR(1)','String','status',NULL,'0','0','1','1','1','1','1','LIKE','input',NULL,NULL,NULL,'2024-08-02 17:30:50',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('12','1','remark','备注','VARCHAR(64)','String','remark',NULL,'0','0','0','1','1','1','1','=','input',NULL,NULL,NULL,'2024-08-02 17:30:50',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('13','1','create_by','创建人','VARCHAR(64)','String','createBy',NULL,'0','0','0','0','0','0','0','=','input',NULL,NULL,NULL,'2024-08-02 17:30:50',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('14','1','create_time','创建时间','DATETIME(19)','LocalDateTime','createTime','java.time.LocalDateTime','0','0','0','0','0','0','0','=','input',NULL,NULL,NULL,'2024-08-02 17:30:50',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('15','1','update_by','修改人','VARCHAR(64)','String','updateBy',NULL,'0','0','0','0','0','0','0','=','input',NULL,NULL,NULL,'2024-08-02 17:30:50',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('16','1','update_time','修改时间','DATETIME(19)','LocalDateTime','updateTime','java.time.LocalDateTime','0','0','0','0','0','0','0','=','input',NULL,NULL,NULL,'2024-08-02 17:30:50',NULL,NULL,'0');
INSERT INTO `gen_table_column` (`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`java_import`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_code`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('17','1','del_flag','删除标记','CHAR(1)','String','delFlag',NULL,'0','0','0','0','0','0','0','=','input',NULL,NULL,NULL,'2024-08-02 17:30:50',NULL,NULL,'0');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='日志表';

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
  `is_frame` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否为外链（0否 1是）',
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
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` (`menu_id`,`parent_id`,`name`,`permission`,`path`,`component`,`query`,`is_frame`,`keep_alive`,`menu_type`,`visible`,`status`,`icon`,`order_num`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1','0','aaa','per',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0');
INSERT INTO `sys_menu` (`menu_id`,`parent_id`,`name`,`permission`,`path`,`component`,`query`,`is_frame`,`keep_alive`,`menu_type`,`visible`,`status`,`icon`,`order_num`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('2','1','bbb','ppp',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0');
INSERT INTO `sys_menu` (`menu_id`,`parent_id`,`name`,`permission`,`path`,`component`,`query`,`is_frame`,`keep_alive`,`menu_type`,`visible`,`status`,`icon`,`order_num`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('3','2','ccc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0');
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
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `sys_user_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` (`user_id`,`dept_id`,`username`,`password`,`nickname`,`name`,`email`,`phone`,`sex`,`avatar`,`status`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`)  VALUES ('1','1','admin','7c4a8d09ca3762af61e59520943dc26494f8941b','aa','aa','aa','aa','a',NULL,'1',NULL,NULL,'2024-07-06 21:52:40',NULL,NULL,'0');
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
INSERT INTO `xxl_job_group` (`id`,`app_name`,`title`,`address_type`,`address_list`,`update_time`)  VALUES ('1','xxl-job-executor-sample','示例执行器','0',NULL,'2024-07-31 16:05:52');
INSERT INTO `xxl_job_group` (`id`,`app_name`,`title`,`address_type`,`address_list`,`update_time`)  VALUES ('2','pure-job','pure-job','0','http://192.168.0.102:9999/','2024-07-31 16:05:52');
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
INSERT INTO `xxl_job_info` (`id`,`job_group`,`job_desc`,`add_time`,`update_time`,`author`,`alarm_email`,`schedule_type`,`schedule_conf`,`misfire_strategy`,`executor_route_strategy`,`executor_handler`,`executor_param`,`executor_block_strategy`,`executor_timeout`,`executor_fail_retry_count`,`glue_type`,`glue_source`,`glue_remark`,`glue_updatetime`,`child_jobid`,`trigger_status`,`trigger_last_time`,`trigger_next_time`)  VALUES ('1','1','测试任务1','2018-11-03 22:21:31','2018-11-03 22:21:31','XXL','','CRON','0 0 0 * * ? *','DO_NOTHING','FIRST','demoJobHandler','','SERIAL_EXECUTION','0','0','BEAN','','GLUE代码初始化','2018-11-03 22:21:31','','0','0','0');
INSERT INTO `xxl_job_info` (`id`,`job_group`,`job_desc`,`add_time`,`update_time`,`author`,`alarm_email`,`schedule_type`,`schedule_conf`,`misfire_strategy`,`executor_route_strategy`,`executor_handler`,`executor_param`,`executor_block_strategy`,`executor_timeout`,`executor_fail_retry_count`,`glue_type`,`glue_source`,`glue_remark`,`glue_updatetime`,`child_jobid`,`trigger_status`,`trigger_last_time`,`trigger_next_time`)  VALUES ('2','2','啥啥','2024-07-30 14:30:41','2024-07-30 14:30:41','啥啥','','CRON','* * * * * ?','DO_NOTHING','FIRST','demoJobHandler','','SERIAL_EXECUTION','0','0','BEAN','','GLUE代码初始化','2024-07-30 14:30:41','','0','0','0');
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
INSERT INTO `xxl_job_log` (`id`,`job_group`,`job_id`,`executor_address`,`executor_handler`,`executor_param`,`executor_sharding_param`,`executor_fail_retry_count`,`trigger_time`,`trigger_code`,`trigger_msg`,`handle_time`,`handle_code`,`handle_msg`,`alarm_status`)  VALUES ('1','2','2','http://192.168.0.102:9999/','demoJobHandler','',NULL,'0','2024-07-30 14:30:48','200','任务触发类型：手动触发<br>调度机器：192.168.0.102<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.0.102:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.102:9999/<br>code：200<br>msg：null','2024-07-30 14:30:58','200','','0');
INSERT INTO `xxl_job_log` (`id`,`job_group`,`job_id`,`executor_address`,`executor_handler`,`executor_param`,`executor_sharding_param`,`executor_fail_retry_count`,`trigger_time`,`trigger_code`,`trigger_msg`,`handle_time`,`handle_code`,`handle_msg`,`alarm_status`)  VALUES ('2','2','2',NULL,'demoJobHandler','',NULL,'0','2024-07-30 15:45:39','500','任务触发类型：手动触发<br>调度机器：192.168.0.102<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,'0',NULL,'2');
INSERT INTO `xxl_job_log` (`id`,`job_group`,`job_id`,`executor_address`,`executor_handler`,`executor_param`,`executor_sharding_param`,`executor_fail_retry_count`,`trigger_time`,`trigger_code`,`trigger_msg`,`handle_time`,`handle_code`,`handle_msg`,`alarm_status`)  VALUES ('3','2','2','http://192.168.0.102:9999/','demoJobHandler','',NULL,'0','2024-07-30 15:47:39','200','任务触发类型：手动触发<br>调度机器：192.168.0.102<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.0.102:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.102:9999/<br>code：200<br>msg：null','2024-07-30 15:47:49','200','','0');
INSERT INTO `xxl_job_log` (`id`,`job_group`,`job_id`,`executor_address`,`executor_handler`,`executor_param`,`executor_sharding_param`,`executor_fail_retry_count`,`trigger_time`,`trigger_code`,`trigger_msg`,`handle_time`,`handle_code`,`handle_msg`,`alarm_status`)  VALUES ('4','2','2',NULL,'demoJobHandler','',NULL,'0','2024-07-31 14:20:33','500','任务触发类型：手动触发<br>调度机器：192.168.0.102<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,'0',NULL,'2');
INSERT INTO `xxl_job_log` (`id`,`job_group`,`job_id`,`executor_address`,`executor_handler`,`executor_param`,`executor_sharding_param`,`executor_fail_retry_count`,`trigger_time`,`trigger_code`,`trigger_msg`,`handle_time`,`handle_code`,`handle_msg`,`alarm_status`)  VALUES ('5','2','2','http://192.168.0.102:9999/','demoJobHandler','',NULL,'0','2024-07-31 14:22:46','200','任务触发类型：手动触发<br>调度机器：192.168.0.102<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.0.102:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.102:9999/<br>code：200<br>msg：null','2024-07-31 14:23:39','200','','0');
INSERT INTO `xxl_job_log` (`id`,`job_group`,`job_id`,`executor_address`,`executor_handler`,`executor_param`,`executor_sharding_param`,`executor_fail_retry_count`,`trigger_time`,`trigger_code`,`trigger_msg`,`handle_time`,`handle_code`,`handle_msg`,`alarm_status`)  VALUES ('6','2','2','http://192.168.0.102:9999/','demoJobHandler','',NULL,'0','2024-07-31 14:24:59','200','任务触发类型：手动触发<br>调度机器：192.168.0.102<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.0.102:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.102:9999/<br>code：200<br>msg：null','2024-07-31 14:25:25','200','','0');
INSERT INTO `xxl_job_log` (`id`,`job_group`,`job_id`,`executor_address`,`executor_handler`,`executor_param`,`executor_sharding_param`,`executor_fail_retry_count`,`trigger_time`,`trigger_code`,`trigger_msg`,`handle_time`,`handle_code`,`handle_msg`,`alarm_status`)  VALUES ('7','2','2','http://192.168.0.102:9999/','demoJobHandler','',NULL,'0','2024-07-31 14:26:09','200','任务触发类型：手动触发<br>调度机器：192.168.0.102<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.0.102:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.102:9999/<br>code：200<br>msg：null','2024-07-31 15:28:12','500','任务结果丢失，标记失败','2');
INSERT INTO `xxl_job_log` (`id`,`job_group`,`job_id`,`executor_address`,`executor_handler`,`executor_param`,`executor_sharding_param`,`executor_fail_retry_count`,`trigger_time`,`trigger_code`,`trigger_msg`,`handle_time`,`handle_code`,`handle_msg`,`alarm_status`)  VALUES ('8','2','2','http://192.168.0.102:9999/','demoJobHandler','',NULL,'0','2024-07-31 15:50:04','200','任务触发类型：手动触发<br>调度机器：192.168.0.102<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.0.102:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.102:9999/<br>code：200<br>msg：null','2024-07-31 15:50:14','200','','0');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
INSERT INTO `xxl_job_log_report` (`id`,`trigger_day`,`running_count`,`suc_count`,`fail_count`,`update_time`)  VALUES ('1','2024-07-30 00:00:00','0','2','1',NULL);
INSERT INTO `xxl_job_log_report` (`id`,`trigger_day`,`running_count`,`suc_count`,`fail_count`,`update_time`)  VALUES ('2','2024-07-29 00:00:00','0','0','0',NULL);
INSERT INTO `xxl_job_log_report` (`id`,`trigger_day`,`running_count`,`suc_count`,`fail_count`,`update_time`)  VALUES ('3','2024-07-28 00:00:00','0','0','0',NULL);
INSERT INTO `xxl_job_log_report` (`id`,`trigger_day`,`running_count`,`suc_count`,`fail_count`,`update_time`)  VALUES ('4','2024-07-31 00:00:00','0','3','2',NULL);
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
INSERT INTO `xxl_job_registry` (`id`,`registry_group`,`registry_key`,`registry_value`,`update_time`)  VALUES ('12','EXECUTOR','pure-job','http://192.168.0.102:9999/','2024-07-31 16:05:46');
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
INSERT INTO `xxl_job_user` (`id`,`username`,`password`,`role`,`permission`)  VALUES ('1','admin','e10adc3949ba59abbe56e057f20f883e','1',NULL);
SET FOREIGN_KEY_CHECKS=1;

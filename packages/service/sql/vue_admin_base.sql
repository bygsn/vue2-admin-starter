/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : vue_admin

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 26/06/2023 22:43:51
*/

CREATE DATABASE /*!32312 IF NOT EXISTS*/`vue_admin_base` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `vue_admin_base`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `type` varchar(255) DEFAULT NULL COMMENT '类型字符',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of dict
-- ----------------------------
BEGIN;
INSERT INTO `dict` VALUES (1, '字典1', 'type1', '2023-03-27 17:35:34', '第一');
INSERT INTO `dict` VALUES (2, '字典2', 'type2', '2023-03-30 14:36:52', '第二');
COMMIT;

-- ----------------------------
-- Table structure for dict_item
-- ----------------------------
DROP TABLE IF EXISTS `dict_item`;
CREATE TABLE `dict_item` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `dict_id` int DEFAULT NULL COMMENT '字典父级id',
  `dict_label` varchar(255) DEFAULT '' COMMENT '标签',
  `dict_value` varchar(255) DEFAULT '' COMMENT '值',
  `dict_sort` int DEFAULT '0' COMMENT '排序',
  `dict_class` varchar(255) DEFAULT '' COMMENT '样式',
  `status` int DEFAULT '1' COMMENT '状态',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of dict_item
-- ----------------------------
BEGIN;
INSERT INTO `dict_item` VALUES (4, 1, '字典1第一', '1', 0, 'primary', 1, '字典1第一备注', '2023-03-30 15:44:00');
INSERT INTO `dict_item` VALUES (5, 1, '字典1第二', '2', 1, 'danger', 1, '字典1第二', '2023-03-30 15:44:34');
INSERT INTO `dict_item` VALUES (6, 2, '字典2第一', '1', 0, 'default', 1, '字典2第一备注', '2023-03-30 15:48:28');
INSERT INTO `dict_item` VALUES (7, 3, '第三个的', '234', 0, 'warning', 1, NULL, '2023-03-30 15:55:17');
COMMIT;

-- ----------------------------
-- Table structure for more
-- ----------------------------
DROP TABLE IF EXISTS `more`;
CREATE TABLE `more` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '账号昵称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of more
-- ----------------------------
BEGIN;
INSERT INTO `more` VALUES (8, '第二家店铺', '2', '2023-04-06 15:44:53');
INSERT INTO `more` VALUES (5, '第一家店铺', '1', '2023-04-06 15:44:53');
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(225) NOT NULL DEFAULT '' COMMENT '名称',
  `roles` varchar(225) NOT NULL DEFAULT '' COMMENT '权限标识',
  `checked_roles` varchar(255) NOT NULL DEFAULT '' COMMENT '权限默认选中标识',
  `role_key` varchar(255) DEFAULT '' COMMENT '权限字符',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES (1, 'admin', '8,9,10,2,5,11,17,1', '8,9,10,5,11,17', 'admin', '2023-04-06 15:39:40');
INSERT INTO `roles` VALUES (12, '中级管家', '49,30,43,31,32,44,65,68,113', '49,43,31,32,68', 'middle', '2023-04-06 15:39:40');
INSERT INTO `roles` VALUES (13, '初级管家', '30,43,31,32,44,65,66,68,113', '43,31,32,66,68', 'primary', '2023-04-06 15:39:40');
COMMIT;

-- ----------------------------
-- Table structure for router_menu
-- ----------------------------
DROP TABLE IF EXISTS `router_menu`;
CREATE TABLE `router_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT '父级id',
  `path` varchar(255) NOT NULL DEFAULT '/' COMMENT '路由地址',
  `hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 当设置 true 的时候该路由不会在侧边栏出现 如401，login等页面',
  `redirect` varchar(255) NOT NULL DEFAULT '' COMMENT '当设置 noRedirect 的时候该路由在面包屑导航中不可被点击',
  `always_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '你可以设置 alwaysShow: true，这样它就会忽略之前定义的规则，一直显示根路由',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '设定路由的名字，一定要填写不然使用<keep-alive>时会出现各种问题',
  `layout` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要含导航栏，只需一级才设置这个（默认为false）',
  `parent_view` tinyint(1) NOT NULL DEFAULT '0' COMMENT '如果第二级里面还需要套级，需在当前级设置为true',
  `meta` varchar(255) NOT NULL DEFAULT '' COMMENT '其他对象',
  `component` varchar(255) NOT NULL DEFAULT '/' COMMENT '对应的页面路径',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `alone` int NOT NULL DEFAULT '0' COMMENT '是否独立的（一级）',
  `role_key` varchar(255) DEFAULT '' COMMENT '权限字符',
  `menu_type` varchar(255) NOT NULL DEFAULT 'C' COMMENT '菜单类型区分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of router_menu
-- ----------------------------
BEGIN;
INSERT INTO `router_menu` VALUES (1, 0, '/menus', 0, '', 0, '', 1, 0, '{\"title\":\"系统设置\",\"icon\":\"menu\",\"noCache\":0}', '/', 9, '2023-03-30 11:10:08', 0, '', 'M');
INSERT INTO `router_menu` VALUES (26, 1, '/user', 0, '', 0, 'user', 0, 0, '{\"title\":\"用户管理\",\"icon\":\"user\",\"noCache\":1}', 'admin/user', 2, '2023-04-10 09:40:38', 0, '', 'C');
INSERT INTO `router_menu` VALUES (27, 1, '/more', 0, '', 0, 'more', 0, 0, '{\"title\":\"多账号管理\",\"icon\":\"peoples\",\"noCache\":1}', 'admin/more', 3, '2023-04-10 09:40:51', 0, '', 'C');
INSERT INTO `router_menu` VALUES (8, 1, '/role', 0, '', 0, 'Role', 0, 0, '{\"title\":\"角色管理\",\"icon\":\"role\",\"noCache\":1}', 'admin/role', 1, '2023-04-10 09:40:34', 0, '', 'C');
INSERT INTO `router_menu` VALUES (10, 1, '/menu', 0, '', 0, 'Menu', 0, 0, '{\"title\":\"菜单管理\",\"icon\":\"list\",\"noCache\":1}', 'admin/menu', 0, '2023-03-30 16:18:33', 0, '', 'C');
INSERT INTO `router_menu` VALUES (65, 44, '', 1, '', 0, '', 0, 0, '{\"title\":\"测试数据\",\"icon\":\"eye\",\"noCache\":0}', '/', 0, '2023-03-27 15:18:34', 0, NULL, 'F');
INSERT INTO `router_menu` VALUES (44, 0, '', 1, '', 0, '', 1, 0, '{\"title\":\"菜单权限字符\",\"icon\":\"eye\",\"noCache\":0}', '/', 100, '2023-04-11 11:24:29', 0, NULL, 'F');
INSERT INTO `router_menu` VALUES (66, 65, '', 1, '', 0, '', 0, 0, '{\"title\":\"权限测试1\",\"icon\":\"form\",\"noCache\":0}', '/', 0, '2023-04-04 14:43:28', 0, 'roleKey1', 'F');
INSERT INTO `router_menu` VALUES (68, 65, '', 1, '', 0, '', 0, 0, '{\"title\":\"权限测试2\",\"icon\":\"example\",\"noCache\":0}', '/', 1, '2023-03-27 15:23:59', 0, 'roleKey2', 'F');
INSERT INTO `router_menu` VALUES (69, 1, '/dict', 0, '', 0, 'Dict', 0, 0, '{\"title\":\"字典管理\",\"icon\":\"dashboard\",\"noCache\":1}', 'admin/dict', 4, '2023-03-30 16:58:47', 0, NULL, 'C');
INSERT INTO `router_menu` VALUES (97, 95, '/', 0, '', 0, '', 0, 0, '{\"title\":\"用户新增\",\"icon\":\"user\",\"noCache\":1}', '/', 0, '2023-04-03 16:47:22', 0, 'user_add', 'F');
INSERT INTO `router_menu` VALUES (85, 44, '/', 1, '', 0, '', 0, 0, '{\"title\":\"系统设置\",\"icon\":\"lock\",\"noCache\":1}', '/', 0, '2023-04-03 15:21:17', 0, '', 'F');
INSERT INTO `router_menu` VALUES (88, 85, '/', 0, '', 0, '', 0, 0, '{\"title\":\"菜单管理\",\"icon\":\"documentation\",\"noCache\":1}', '/', 0, '2023-04-03 15:21:49', 0, NULL, 'F');
INSERT INTO `router_menu` VALUES (89, 88, '/', 0, '', 0, '', 0, 0, '{\"title\":\"菜单查询\",\"icon\":\"example\",\"noCache\":1}', '/', 0, '2023-04-03 15:22:46', 0, 'menu_query', 'F');
INSERT INTO `router_menu` VALUES (90, 88, '/', 0, '', 0, '', 0, 0, '{\"title\":\"菜单新增\",\"icon\":\"example\",\"noCache\":1}', '/', 0, '2023-04-03 15:35:28', 0, 'menu_add', 'F');
INSERT INTO `router_menu` VALUES (91, 88, '/', 0, '', 0, '', 0, 0, '{\"title\":\"菜单修改\",\"icon\":\"example\",\"noCache\":1}', '/', 0, '2023-04-03 15:36:06', 0, 'menu_up', 'F');
INSERT INTO `router_menu` VALUES (92, 88, '/', 0, '', 0, '', 0, 0, '{\"title\":\"菜单删除\",\"icon\":\"example\",\"noCache\":1}', '/', 0, '2023-04-03 15:36:19', 0, 'menu_delete', 'F');
INSERT INTO `router_menu` VALUES (76, 69, '/dictItem', 0, '', 0, 'DictItem', 0, 0, '{\"title\":\"字典项目\",\"icon\":\"form\",\"noCache\":1}', 'admin/dictItem', 0, '2023-03-30 15:55:52', 0, '', 'C');
INSERT INTO `router_menu` VALUES (95, 85, '/', 0, '', 0, '', 0, 0, '{\"title\":\"用户管理\",\"icon\":\"user\",\"noCache\":1}', '/', 0, '2023-04-03 16:46:18', 0, NULL, 'F');
INSERT INTO `router_menu` VALUES (96, 95, '/', 0, '', 0, '', 0, 0, '{\"title\":\"用户查询\",\"icon\":\"user\",\"noCache\":1}', '/', 0, '2023-04-03 16:46:56', 0, 'user_query', 'F');
INSERT INTO `router_menu` VALUES (98, 95, '/', 0, '', 0, '', 0, 0, '{\"title\":\"用户修改\",\"icon\":\"user\",\"noCache\":1}', '/', 0, '2023-04-03 16:52:31', 0, 'user_up', 'F');
INSERT INTO `router_menu` VALUES (99, 95, '/', 0, '', 0, '', 0, 0, '{\"title\":\"用户删除\",\"icon\":\"user\",\"noCache\":1}', '/', 0, '2023-04-03 16:52:47', 0, 'user_delete', 'F');
INSERT INTO `router_menu` VALUES (100, 95, '/', 0, '', 0, '', 0, 0, '{\"title\":\"用户修改密码\",\"icon\":\"eye\",\"noCache\":1}', '/', 0, '2023-04-03 16:56:33', 0, 'user_pwd', 'F');
INSERT INTO `router_menu` VALUES (101, 85, '/', 0, '', 0, '', 0, 0, '{\"title\":\"角色管理\",\"icon\":\"peoples\",\"noCache\":1}', '/', 0, '2023-04-03 16:59:20', 0, NULL, 'F');
INSERT INTO `router_menu` VALUES (102, 101, '/', 0, '', 0, '', 0, 0, '{\"title\":\"角色查询\",\"icon\":\"peoples\",\"noCache\":1}', '/', 0, '2023-04-03 16:59:33', 0, 'role_query', 'F');
INSERT INTO `router_menu` VALUES (103, 101, '/', 0, '', 0, '', 0, 0, '{\"title\":\"角色新增\",\"icon\":\"peoples\",\"noCache\":1}', '/', 0, '2023-04-03 16:59:46', 0, 'role_add', 'F');
INSERT INTO `router_menu` VALUES (104, 101, '/', 0, '', 0, '', 0, 0, '{\"title\":\"角色修改\",\"icon\":\"peoples\",\"noCache\":1}', '/', 0, '2023-04-03 17:00:04', 0, 'role_up', 'F');
INSERT INTO `router_menu` VALUES (105, 101, '/', 0, '', 0, '', 0, 0, '{\"title\":\"角色删除\",\"icon\":\"peoples\",\"noCache\":1}', '/', 0, '2023-04-03 17:00:24', 0, 'role_delete', 'F');
INSERT INTO `router_menu` VALUES (106, 85, '/', 0, '', 0, '', 0, 0, '{\"title\":\"多账户管理\",\"icon\":\"nested\",\"noCache\":1}', '/', 0, '2023-04-03 17:12:25', 0, NULL, 'F');
INSERT INTO `router_menu` VALUES (107, 106, '/', 0, '', 0, '', 0, 0, '{\"title\":\"多账户查询\",\"icon\":\"people\",\"noCache\":1}', '/', 0, '2023-04-03 17:31:07', 0, 'more_query', 'F');
INSERT INTO `router_menu` VALUES (108, 106, '/', 0, '', 0, '', 0, 0, '{\"title\":\"多账户新增\",\"icon\":\"people\",\"noCache\":1}', '/', 0, '2023-04-03 17:31:30', 0, 'more_add', 'F');
INSERT INTO `router_menu` VALUES (109, 106, '/', 0, '', 0, '', 0, 0, '{\"title\":\"多账户修改\",\"icon\":\"people\",\"noCache\":1}', '/', 0, '2023-04-03 17:31:47', 0, 'more_up', 'F');
INSERT INTO `router_menu` VALUES (110, 106, '/', 0, '', 0, '', 0, 0, '{\"title\":\"多账户删除\",\"icon\":\"people\",\"noCache\":1}', '/', 0, '2023-04-03 17:32:07', 0, 'more_delete', 'F');
INSERT INTO `router_menu` VALUES (113, 0, 'https://github.com/MingMinter/vue_node', 0, '', 0, 'GitHub', 1, 0, '{\"title\":\"GitHub直达\",\"icon\":\"link\",\"noCache\":1}', '/', 16, '2023-04-11 11:24:24', 0, NULL, 'C');
COMMIT;

-- ----------------------------
-- Table structure for tests
-- ----------------------------
DROP TABLE IF EXISTS `tests`;
CREATE TABLE `tests` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `more_id` int DEFAULT NULL COMMENT '多账号编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tests
-- ----------------------------
BEGIN;
INSERT INTO `tests` VALUES (3, '第一家店铺的数据1', '第一', 5);
INSERT INTO `tests` VALUES (5, '第二家店铺的数据1', '第二', 8);
INSERT INTO `tests` VALUES (8, '第二家店铺的数据2', '第二', 8);
INSERT INTO `tests` VALUES (9, '第二家店铺的数据3', '第二', 8);
INSERT INTO `tests` VALUES (23, '第一家店铺的数据2', '第一', 5);
INSERT INTO `tests` VALUES (24, '第一家店铺的数据3', '第一', 5);
INSERT INTO `tests` VALUES (25, '第一家店铺的数据4', '第一', 5);
COMMIT;

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `menu_bg` varchar(255) DEFAULT '' COMMENT '默认背景',
  `menu_sub_bg` varchar(255) DEFAULT '' COMMENT '展开背景',
  `menu_text` varchar(255) DEFAULT '' COMMENT '默认文字',
  `menu_active_text` varchar(255) DEFAULT '' COMMENT '选中文字',
  `menu_sub_active_text` varchar(255) DEFAULT '' COMMENT '当前选中展开文字',
  `menu_hover_bg` varchar(255) DEFAULT '' COMMENT 'hover背景',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of theme
-- ----------------------------
BEGIN;
INSERT INTO `theme` VALUES (1, 1, '#304156', '#304156', '#bfcad5', '#409eff', '#fff', '#001528');
INSERT INTO `theme` VALUES (2, 25, '#84EB16', '#038293', '#1C1C1C', '#F3F359', '#1C1C1C', '#C7C7C7');
INSERT INTO `theme` VALUES (3, 18, '#304156', '#304156', '#bfcad5', '#409eff', '#fff', '#001528');
INSERT INTO `theme` VALUES (4, 30, '#304156', '#304156', '#bfcad5', '#409eff', '#fff', '#001528');
INSERT INTO `theme` VALUES (5, 31, '#304156', '#304156', '#bfcad5', '#409eff', '#fff', '#001528');
INSERT INTO `theme` VALUES (6, 32, '#304156', '#304156', '#bfcad5', '#409eff', '#fff', '#001528');
INSERT INTO `theme` VALUES (7, 33, '#304156', '#304156', '#bfcad5', '#409eff', '#fff', '#001528');
INSERT INTO `theme` VALUES (8, 34, '#304156', '#304156', '#bfcad5', '#409eff', '#fff', '#001528');
INSERT INTO `theme` VALUES (9, 35, '#304156', '#304156', '#bfcad5', '#409eff', '#fff', '#001528');
INSERT INTO `theme` VALUES (10, 36, '#304156', '#304156', '#bfcad5', '#409eff', '#fff', '#001528');
INSERT INTO `theme` VALUES (11, 37, '#304156', '#304156', '#bfcad5', '#409eff', '#fff', '#001528');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `status` int NOT NULL DEFAULT '1' COMMENT '状态',
  `roles_id` varchar(255) NOT NULL DEFAULT '' COMMENT '角色编号',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `admin` int NOT NULL DEFAULT '0' COMMENT '管理员',
  `pwd` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `more_id` int NOT NULL DEFAULT '0' COMMENT '账号编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'admin', 1, '1', '管理员', 1, 'f379eaf3c831b04de153469d1bec345e', 5, '2023-04-05 15:32:33');
INSERT INTO `user` VALUES (25, '店铺2', 1, '12', '中级管家', 0, 'f379eaf3c831b04de153469d1bec345e', 8, '2023-03-16 15:32:33');
INSERT INTO `user` VALUES (18, '店铺1', 1, '13', '初级管家', 0, 'f379eaf3c831b04de153469d1bec345e', 5, '2023-04-03 15:32:33');
INSERT INTO `user` VALUES (37, '禁用账号', 0, '13', '', 0, 'f379eaf3c831b04de153469d1bec345e', 5, '2023-04-23 14:24:07');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

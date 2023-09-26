/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80034 (8.0.34)
 Source Host           : 127.0.0.1:3306
 Source Schema         : system

 Target Server Type    : MySQL
 Target Server Version : 80034 (8.0.34)
 File Encoding         : 65001

 Date: 26/09/2023 08:16:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cross_permission
-- ----------------------------
DROP TABLE IF EXISTS `cross_permission`;
CREATE TABLE `cross_permission`  (
  `cross_id` int NOT NULL COMMENT '跨权限者的ID',
  `permission_id` int NOT NULL COMMENT '被跨越的权限ID',
  `cross_type` tinyint NOT NULL COMMENT '1：用户 2：用户组 3：职位 4：组织',
  `cross_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '跨越者名称',
  `permission_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '被跨越权限名称',
  `sys_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '系统编码',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：正常 1：删除）',
  `create_user` int NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` int NULL DEFAULT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`cross_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '跨权限映射表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cross_permission
-- ----------------------------

-- ----------------------------
-- Table structure for cross_role
-- ----------------------------
DROP TABLE IF EXISTS `cross_role`;
CREATE TABLE `cross_role`  (
  `cross_id` int NOT NULL COMMENT '跨角色者的ID',
  `role_id` int NOT NULL COMMENT '被跨越的角色ID',
  `cross_type` tinyint NOT NULL COMMENT '1：用户 2：用户组 3：职位 4：组织',
  `cross_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '跨角色者的名称',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '被跨越角色名称',
  `sys_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '系统编码',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：正常 1：删除）',
  `create_user` int NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` int NULL DEFAULT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`cross_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '跨角色映射表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cross_role
-- ----------------------------

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`  (
  `group_id` int NOT NULL AUTO_INCREMENT COMMENT '用户组ID',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户组名称',
  `group_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组编码',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：正常 1：删除）',
  `create_user` int NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` int NULL DEFAULT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户组（无上下级关系）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group
-- ----------------------------

-- ----------------------------
-- Table structure for mutex_roles
-- ----------------------------
DROP TABLE IF EXISTS `mutex_roles`;
CREATE TABLE `mutex_roles`  (
  `role_id` int NOT NULL COMMENT '角色Id',
  `mutex_role_id` int NOT NULL COMMENT '互斥角色Id',
  `sys_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '系统编码',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：正常 1：删除）',
  `create_user` int NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` int NULL DEFAULT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`role_id`, `mutex_role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '互斥角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mutex_roles
-- ----------------------------
INSERT INTO `mutex_roles` VALUES (1, 1, NULL, 0, NULL, NULL, '2023-09-25 07:25:35', '2023-09-25 08:26:01');

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization`  (
  `org_id` int NOT NULL COMMENT '组织ID',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组织名称',
  `org_type` tinyint NOT NULL COMMENT '组织类型（1：总公司 2：分公司 3：部门）',
  `org_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组织编码',
  `parent_id` int NOT NULL COMMENT '上级组织ID',
  `sort` int NULL DEFAULT NULL COMMENT '节点位置，越小越靠前',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字体图标',
  `is_super` int NULL DEFAULT 0 COMMENT '是否是超级管理员节点（1 是 0 不是）',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：正常 1：删除）',
  `create_user` int NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` int NULL DEFAULT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`org_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '组织表（有上下级关系）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES (1, '财务部', 3, '', 4, 0, 'layui-icon layui-icon-home', 0, 0, NULL, NULL, '2023-09-25 07:25:43', '2023-09-25 08:27:54');
INSERT INTO `organization` VALUES (2, '采购部', 3, '', 7, 0, 'layui-icon layui-icon-home', 0, 0, NULL, NULL, '2023-09-25 07:25:43', '2023-09-25 08:27:34');
INSERT INTO `organization` VALUES (3, '采购部', 3, '', 4, 0, 'layui-icon layui-icon-home', 0, 0, NULL, NULL, '2023-09-25 07:25:43', '2023-09-25 08:27:38');
INSERT INTO `organization` VALUES (4, '玉兔广州分公司', 2, '', 7, 5, 'layui-icon layui-icon-home', 0, 0, NULL, NULL, '2023-09-25 07:25:43', '2023-09-25 08:27:47');
INSERT INTO `organization` VALUES (5, '软件研发部', 3, '', 4, 0, 'layui-icon layui-icon-home', 0, 0, NULL, NULL, '2023-09-25 07:25:43', '2023-09-25 08:28:02');
INSERT INTO `organization` VALUES (6, '软件研发部', 3, '', 7, 0, 'layui-icon layui-icon-home', 0, 0, NULL, NULL, '2023-09-25 07:25:43', '2023-09-25 08:28:03');
INSERT INTO `organization` VALUES (7, '玉兔公司总部', 1, '', -1, 1, 'layui-icon layui-icon-home', 0, 0, NULL, NULL, '2023-09-25 07:25:43', '2023-09-25 08:27:17');
INSERT INTO `organization` VALUES (8, '销售部', 3, '', 4, 0, 'layui-icon layui-icon-home', 0, 0, NULL, NULL, '2023-09-25 07:25:43', '2023-09-25 08:28:07');
INSERT INTO `organization` VALUES (9, '销售部', 3, '', 7, 0, 'layui-icon layui-icon-home', 0, 0, NULL, NULL, '2023-09-25 07:25:43', '2023-09-25 08:28:08');
INSERT INTO `organization` VALUES (10, '超级管理员节点', 1, '', -1, 0, 'layui-icon layui-icon-set', 1, 0, NULL, NULL, '2023-09-25 07:25:43', '2023-09-25 08:27:21');
INSERT INTO `organization` VALUES (11, '财务部', 3, '', 7, 0, 'layui-icon layui-icon-home', 0, 0, NULL, NULL, '2023-09-25 07:25:43', '2023-09-25 08:28:12');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `permission_id` int NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `permission_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限名称',
  `permission_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限编码',
  `permission_type` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限类型（1 菜单 2按钮 3数据）',
  `parent_id` int NOT NULL COMMENT '父权限id（如果没有父ID，则为-1）',
  `sort` int NOT NULL COMMENT '节点位置，越小越靠前',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注信息',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '节点链接',
  `sys_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '系统编码',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字体图标',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：正常 1：删除）',
  `create_user` int NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` int NULL DEFAULT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, '权限管理', 'Menu:PERMS_MANAGE', '1', 1, 4, '权限管理菜单', '/permission/permission_list', '', 'layui-icon layui-icon-auz', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:12');
INSERT INTO `permissions` VALUES (2, '仪表盘', 'Menu:HOME_VIEW', '1', -1, 0, '仪表盘', '', '', 'layui-icon layui-icon-console', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:31:29');
INSERT INTO `permissions` VALUES (3, '角色管理', 'Menu:ROLE_MANAGE', '1', 1, 3, '角色管理菜单', '/role/role_list', '', 'layui-icon layui-icon-user', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:13');
INSERT INTO `permissions` VALUES (4, '系统管理', 'Menu:SYS_MANAGE', '1', -1, 2, '系统管理菜单', '', '', 'layui-icon layui-icon-set', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:31:30');
INSERT INTO `permissions` VALUES (5, '新增角色', 'Btn:ROLE_ADD', '2', 1, 1, '新增角色按钮', '', '', 'layui-icon layui-icon-add-1', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:14');
INSERT INTO `permissions` VALUES (6, '修改用户', 'Btn:USER_UPDATE', '2', 1, 2, '修改用户', '', '', 'layui-icon layui-icon-edit', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:15');
INSERT INTO `permissions` VALUES (7, '权限配置', 'Data:ROLE_PERMS_ASSIGN', '3', 1, 5, '角色管理-权限配置  Tab 权限数据查看与分配', '', '', 'layui-icon layui-icon-set', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:15');
INSERT INTO `permissions` VALUES (8, '互斥角色查看', 'Data:MUTEX_ROLE_VIEW', '2', 1, 5, '互斥角色查看-按钮', '', '', 'layui-icon layui-icon-form', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:16');
INSERT INTO `permissions` VALUES (9, '用户列表-用户详细信息', 'Btn:USER_DETAIL', '2', 1, 5, '用户列表-行内工具条-查看按钮（附带修改功能）', '', '', 'layui-icon layui-icon-form', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:16');
INSERT INTO `permissions` VALUES (10, '新增权限', 'Btn:PERMS_ADD', '2', 1, 0, '新增权限（非子权限）', '', '', 'layui-icon layui-icon-add-1', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:17');
INSERT INTO `permissions` VALUES (11, '重置密码', 'Btn:USER_RESET_PASSWORD', '2', 1, 3, '重置密码为：88888888', '', '', 'layui-icon layui-icon-set', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:17');
INSERT INTO `permissions` VALUES (12, '用户状态修改', 'Btn:USER_STATUS_UPD', '2', 1, 4, '用户列表-点击复选框修改用户状态', '', '', 'layui-icon layui-icon-set', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:17');
INSERT INTO `permissions` VALUES (13, '删除互斥角色', 'Btn:MUTEX_ROLE_DEL', '2', 1, 5, '删除互斥角色-按钮', '', '', 'layui-icon layui-icon-delete', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:18');
INSERT INTO `permissions` VALUES (14, '删除用户', 'Btn:USER_DEL', '2', 1, 2, '', '', '', 'layui-icon layui-icon-delete', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:18');
INSERT INTO `permissions` VALUES (15, '查看 | 修改权限', 'Btn:PERMS_VIEW_UPD', '2', 1, 3, '查看权限详情，并可以修改权限信息。', '', '', 'layui-icon layui-icon-search', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:19');
INSERT INTO `permissions` VALUES (16, '分组用户查看', 'Data:GROUP_USER_VIEWE', '3', 1, 4, '用户管理-分组用户 Tab 内容查看', '', '', 'layui-icon layui-icon-form', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:20');
INSERT INTO `permissions` VALUES (17, '个人设置', 'Menu:PERSONAL_SET', '1', -1, 1, '基础权限- 个人信息设置与密码修改。', '/user/user_setting', '', 'layui-icon layui-icon-set', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:31:47');
INSERT INTO `permissions` VALUES (18, '修改角色', 'Btn:ROLE_UPDATE', '2', 1, 0, '修改角色', '', '', 'layui-icon layui-icon-edit', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:21');
INSERT INTO `permissions` VALUES (19, '分配组织', 'Btn:USER_ASSIGN_ORG', '2', 1, 6, '用户管理-用户列表-分配组织按钮', '', '', 'layui-icon layui-icon-set', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:21');
INSERT INTO `permissions` VALUES (20, '新增用户', 'Btn:USER_ADD', '2', 1, 0, '新增用户按钮', '', '', 'layui-icon layui-icon-add-1', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:21');
INSERT INTO `permissions` VALUES (21, '删除权限', 'Btn:PERMS_DEL', '2', 1, 4, '删除权限', '', '', 'layui-icon layui-icon-delete', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:22');
INSERT INTO `permissions` VALUES (22, '新增子权限', 'Btn:PERMS_CHILD_ADD', '2', 1, 0, '新增子权限', '', '', 'layui-icon layui-icon-add-1', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:22');
INSERT INTO `permissions` VALUES (23, '新增互斥角色', 'Data:MUTEX_ROLE_ADD', '2', 1, 5, '新增互斥角色按钮', '', '', 'layui-icon layui-icon-add-1', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:22');
INSERT INTO `permissions` VALUES (24, '新增职位', 'Btn:USER_POST_ADD', '2', 1, 5, '用户管理-用户列表-头部【新增职位】按钮', '', '', 'layui-icon layui-icon-add-1', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:23');
INSERT INTO `permissions` VALUES (25, '用户管理', 'Menu:USER_MANAGE', '1', 1, 2, '用户管理菜单', '/user/user_list', '', 'layui-icon layui-icon-user', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:23');
INSERT INTO `permissions` VALUES (26, '角色分配（组织|职位）', 'Data:ROLE_ORG_POST_ASSIGN', '3', 1, 5, '角色管理中的Tab，将角色分配到组织和职位', '', '', 'layui-icon layui-icon-set', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:24');
INSERT INTO `permissions` VALUES (27, '删除角色', 'Btn:ROLE_DEL', '2', 1, 0, '删除角色按钮', '', '', 'layui-icon layui-icon-delete', 0, NULL, NULL, '2023-09-25 07:27:46', '2023-09-25 08:34:25');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `post_id` int NOT NULL COMMENT '职位ID',
  `post_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '职位名称',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职位编码',
  `parent_id` int NOT NULL COMMENT '上级职位ID',
  `org_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属组织ID',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字体图标',
  `sort` int NULL DEFAULT NULL COMMENT '节点位置，越小越靠前',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：正常 1：删除）',
  `create_user` int NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` int NULL DEFAULT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '职位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, '订单管理员', '', -1, '7', 'layui-icon layui-icon-user', 4, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:03');
INSERT INTO `post` VALUES (2, '会计', '', -1, '7', 'layui-icon layui-icon-user', 3, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:04');
INSERT INTO `post` VALUES (3, 'CEO', '', -1, '7', 'layui-icon layui-icon-user', 0, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:04');
INSERT INTO `post` VALUES (4, '会计', '', -1, '7', 'layui-icon layui-icon-user', 2, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:05');
INSERT INTO `post` VALUES (5, '采购部部长', '', -1, '7', 'layui-icon layui-icon-user', 0, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:06');
INSERT INTO `post` VALUES (6, '部门经理', '', -1, '7', 'layui-icon layui-icon-user', 0, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:06');
INSERT INTO `post` VALUES (7, '采购工程师', '', -1, '7', 'layui-icon layui-icon-user', 3, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:07');
INSERT INTO `post` VALUES (8, '财务经理', '', -1, '7', 'layui-icon layui-icon-user', 1, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:08');
INSERT INTO `post` VALUES (9, '软件测试', '', -1, '7', 'layui-icon layui-icon-user', 4, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:09');
INSERT INTO `post` VALUES (10, '出纳', '', -1, '7', 'layui-icon layui-icon-user', 4, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:12');
INSERT INTO `post` VALUES (11, '采购工程师', '', -1, '7', 'layui-icon layui-icon-user', 3, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:14');
INSERT INTO `post` VALUES (12, '软件工程师', '', -1, '7', 'layui-icon layui-icon-user', 3, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:15');
INSERT INTO `post` VALUES (13, '架构师', '', -1, '7', 'layui-icon layui-icon-user', 4, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:16');
INSERT INTO `post` VALUES (14, '运维', '', -1, '7', 'layui-icon layui-icon-user', 6, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:17');
INSERT INTO `post` VALUES (15, '软件销售推广', '', -1, '7', 'layui-icon layui-icon-user', 7, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:18');
INSERT INTO `post` VALUES (16, '采购部部长', '', -1, '7', 'layui-icon layui-icon-user', 0, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:19');
INSERT INTO `post` VALUES (17, '项目总监', '', -1, '7', 'layui-icon layui-icon-user', 2, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:20');
INSERT INTO `post` VALUES (18, '财务审核员', '', -1, '7', 'layui-icon layui-icon-user', 7, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:21');
INSERT INTO `post` VALUES (19, '部门副经理', '', -1, '7', 'layui-icon layui-icon-user', 1, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:23');
INSERT INTO `post` VALUES (20, '项目经理', '', -1, '7', 'layui-icon layui-icon-user', 1, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:25');
INSERT INTO `post` VALUES (21, '资金核算人员', '', -1, '7', 'layui-icon layui-icon-user', 4, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:26');
INSERT INTO `post` VALUES (22, '部门经理', '', -1, '7', 'layui-icon layui-icon-user', 0, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:27');
INSERT INTO `post` VALUES (23, '财务总监', '', -1, '7', 'layui-icon layui-icon-user', 0, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:28');
INSERT INTO `post` VALUES (24, '订单管理员', '', -1, '7', 'layui-icon layui-icon-user', 4, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:29');
INSERT INTO `post` VALUES (25, '项目总监', '', -1, '7', 'layui-icon layui-icon-user', 2, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:30');
INSERT INTO `post` VALUES (26, '采购主管', '', -1, '7', 'layui-icon layui-icon-user', 1, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:31');
INSERT INTO `post` VALUES (27, '运维', '', -1, '7', 'layui-icon layui-icon-user', 5, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:33');
INSERT INTO `post` VALUES (28, '软件测试', '', -1, '7', 'layui-icon layui-icon-user', 5, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:34');
INSERT INTO `post` VALUES (29, '采购经理', '', -1, '7', 'layui-icon layui-icon-user', 2, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:36');
INSERT INTO `post` VALUES (30, '项目经理', '', -1, '7', 'layui-icon layui-icon-user', 3, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:38');
INSERT INTO `post` VALUES (31, '采购主管', '', -1, '7', 'layui-icon layui-icon-user', 1, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:39');
INSERT INTO `post` VALUES (32, '出纳', '', -1, '7', 'layui-icon layui-icon-user', 3, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:41');
INSERT INTO `post` VALUES (33, '财务经理', '', -1, '7', 'layui-icon layui-icon-user', 1, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:42');
INSERT INTO `post` VALUES (34, '软件工程师', '', -1, '7', 'layui-icon layui-icon-user', 4, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:43');
INSERT INTO `post` VALUES (35, '财务总监', '', -1, '7', 'layui-icon layui-icon-user', 0, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:45');
INSERT INTO `post` VALUES (36, '销售经理', '', -1, '7', 'layui-icon layui-icon-user', 0, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:46');
INSERT INTO `post` VALUES (37, '采购经理', '', -1, '7', 'layui-icon layui-icon-user', 2, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:48');
INSERT INTO `post` VALUES (38, '销售经理', '', -1, '7', 'layui-icon layui-icon-user', 0, 0, NULL, NULL, '2023-09-25 07:27:54', '2023-09-25 08:47:49');

-- ----------------------------
-- Table structure for role_group
-- ----------------------------
DROP TABLE IF EXISTS `role_group`;
CREATE TABLE `role_group`  (
  `group_id` int NOT NULL COMMENT '用户组ID',
  `role_id` int NOT NULL COMMENT '角色ID',
  `sys_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '系统编码',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：正常 1：删除）',
  `create_user` int NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` int NULL DEFAULT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`group_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户组-角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_group
-- ----------------------------

-- ----------------------------
-- Table structure for role_organization
-- ----------------------------
DROP TABLE IF EXISTS `role_organization`;
CREATE TABLE `role_organization`  (
  `role_id` int NOT NULL COMMENT '角色ID',
  `org_id` int NOT NULL COMMENT '组织ID',
  `sys_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '系统编码',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：正常 1：删除）',
  `create_user` int NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` int NULL DEFAULT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`org_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '组织-角色-关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_organization
-- ----------------------------

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `role_id` int NOT NULL COMMENT '角色id',
  `permission_id` int NOT NULL COMMENT '权限id',
  `sys_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '系统编码',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：正常 1：删除）',
  `create_user` int NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` int NULL DEFAULT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色-权限-关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for role_post
-- ----------------------------
DROP TABLE IF EXISTS `role_post`;
CREATE TABLE `role_post`  (
  `post_id` int NOT NULL COMMENT '职位ID',
  `role_id` int NOT NULL COMMENT '角色ID',
  `sys_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '系统编码',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：正常 1：删除）',
  `create_user` int NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` int NULL DEFAULT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`post_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色-职位-关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_post
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色编码',
  `parent_id` int NOT NULL COMMENT '父角色id（如果没有父ID，则为-1）',
  `sort` int NOT NULL COMMENT '节点位置（超级管理员：0，其他角色最小为1）',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注信息',
  `sys_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '系统编码',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字体图标',
  `is_super` int NULL DEFAULT 0 COMMENT '是否是超级角色（1 是 0 不是 2 基础角色）',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：正常 1：删除）',
  `create_user` int NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` int NULL DEFAULT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '会计', 'kuaiji', -1, 3, '会计角色', '', 'layui-icon layui-icon-user', 0, 0, NULL, NULL, '2023-09-25 07:29:46', '2023-09-25 08:54:58');
INSERT INTO `roles` VALUES (2, '超级管理员', 'role_super', -1, 0, '这是超级管理员，默认分配所有角色和权限，禁止删除！', '', 'layui-icon layui-icon-user', 1, 0, NULL, NULL, '2023-09-25 07:29:46', '2023-09-25 08:54:58');
INSERT INTO `roles` VALUES (3, '基础角色', 'role_basic', -1, 1, '基础角色，禁止删除！该角色用于分配查看、修改个人信息，修改个人密码等基本权限，为该角色配置权限时请谨慎！', '', 'layui-icon layui-icon-user', 2, 0, NULL, NULL, '2023-09-25 07:29:46', '2023-09-25 08:54:59');
INSERT INTO `roles` VALUES (4, '会计助理', 'kuaiji_zhuli', 2, 1, '会计助理', '', 'layui-icon layui-icon-user', 0, 0, NULL, NULL, '2023-09-25 07:29:46', '2023-09-25 08:55:10');
INSERT INTO `roles` VALUES (5, '财务审核员', 'check_man', -1, 4, '财务审核员角色。', '', 'layui-icon layui-icon-user', 0, 0, NULL, NULL, '2023-09-25 07:29:46', '2023-09-25 08:55:00');
INSERT INTO `roles` VALUES (6, '普通管理员', 'common_manager', 2, 1, '普通管理员', '', 'layui-icon layui-icon-user', 0, 0, NULL, NULL, '2023-09-25 07:29:46', '2023-09-25 08:55:11');

-- ----------------------------
-- Table structure for system
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system`  (
  `sys_id` int NOT NULL AUTO_INCREMENT COMMENT '系统ID',
  `sys_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '系统名称',
  `sys_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '系统编码',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：正常 1：删除）',
  `create_user` int NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` int NULL DEFAULT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`sys_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system
-- ----------------------------

-- ----------------------------
-- Table structure for user_auths
-- ----------------------------
DROP TABLE IF EXISTS `user_auths`;
CREATE TABLE `user_auths`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户id',
  `identity_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录类型（手机号 邮箱 用户名）或第三方应用名称（微信 微博等）',
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标识（手机号 邮箱 用户名或第三方应用的唯一标识）',
  `credential` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码凭证（站内的保存密码，站外的不保存或保存token）',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UNI_AUTH_IDENTIFER`(`identifier` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户授权表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_auths
-- ----------------------------
INSERT INTO `user_auths` VALUES (1, 1, 'ID', 'admin', '123456', '2021-08-09 21:27:35', '2021-04-20 15:53:15');
INSERT INTO `user_auths` VALUES (2, 2, 'ID', 'usertest', '123456', '2021-08-09 21:27:40', '2021-04-20 16:03:07');
INSERT INTO `user_auths` VALUES (3, 1, 'EMAIL', '33256', '123456', NULL, '2022-03-27 21:14:35');
INSERT INTO `user_auths` VALUES (13, 19, 'EMAIL', '3325622872@qq.com', '123456', NULL, '2022-05-02 19:58:57');
INSERT INTO `user_auths` VALUES (14, 19, 'ID', 'ttt', '123456', NULL, '2022-05-02 19:58:57');

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group`  (
  `user_id` int NOT NULL COMMENT '用户ID',
  `group_id` int NOT NULL COMMENT '组织ID',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：正常 1：删除）',
  `create_user` int NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` int NULL DEFAULT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`, `group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户-用户组-关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_group
-- ----------------------------

-- ----------------------------
-- Table structure for user_organization
-- ----------------------------
DROP TABLE IF EXISTS `user_organization`;
CREATE TABLE `user_organization`  (
  `user_id` int NOT NULL COMMENT '用户ID',
  `org_id` int NOT NULL COMMENT '组织ID',
  `org_type` tinyint NULL DEFAULT NULL COMMENT '组织类型',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：正常 1：删除）',
  `create_user` int NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` int NULL DEFAULT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`, `org_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户-组织-关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_organization
-- ----------------------------

-- ----------------------------
-- Table structure for user_post
-- ----------------------------
DROP TABLE IF EXISTS `user_post`;
CREATE TABLE `user_post`  (
  `user_id` int NOT NULL COMMENT '用户ID',
  `post_id` int NOT NULL COMMENT '职位ID',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：正常 1：删除）',
  `create_user` int NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` int NULL DEFAULT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户-职位-关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_post
-- ----------------------------

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` int NOT NULL COMMENT '用户id',
  `role_id` int NOT NULL COMMENT '角色id',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：正常 1：删除）',
  `create_user` int NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` int NULL DEFAULT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户-角色-关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `user_alias` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户别名',
  `is_enable` int NOT NULL DEFAULT 1 COMMENT '账号是否可用（1：可用  0：禁用）',
  `sex` int NOT NULL DEFAULT 1 COMMENT '性别（0：女 1：男）',
  `cell_phone_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '住址',
  `entry_date` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录日期',
  `last_login` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上次登录日期',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `is_super` int NULL DEFAULT 0 COMMENT '是否超级管理员（0：否  1：是）',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注信息',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：正常 1：删除）',
  `create_user` int NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` int NULL DEFAULT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '司马光', 'd93ae65992caf6a8751e334d0a716ad8', '司马光', 1, 1, '15678905678', '广东省广州天河区棠下街18号', NULL, NULL, 'simaguang@qq.com', 0, '总部采购部经理。', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:02:56');
INSERT INTO `users` VALUES (2, '小王', 'd93ae65992caf6a8751e334d0a716ad8', '王老吉', 1, 1, '15678905678', '广东省广州天河区车陂路55号', '2023-03-31 14:19:07', '2023-03-31 14:18:37', 'xiaowang@qq.com', 0, '我是公司总部会计。', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:02:56');
INSERT INTO `users` VALUES (3, '成吉思汗', 'd93ae65992caf6a8751e334d0a716ad8', '可汗', 1, 1, '18976864732', '广东省广州天河区棠下街88号', NULL, NULL, 'kehan@qq.com', 0, '总部财务总监', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:02:57');
INSERT INTO `users` VALUES (4, '李白', 'd93ae65992caf6a8751e334d0a716ad8', '李诗人', 1, 1, '15678905678', '广东省广州天河区车陂路52号', NULL, NULL, 'libai@qq.com', 0, '总部采购部订单管理员。', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:02:58');
INSERT INTO `users` VALUES (5, 'admin', 'd93ae65992caf6a8751e334d0a716ad8', '超级管理员', 1, 1, '18976864700', '广东省广州天河区棠下街18号', '2023-03-31 14:18:16', '2023-03-31 13:38:33', 'admin@qq.com', 1, '我是超级管理员，拥有系统的所有角色与权限！对我温柔点，否则删库跑路，后果自负', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:02:59');
INSERT INTO `users` VALUES (6, '王昭君', 'd93ae65992caf6a8751e334d0a716ad8', '王昭君', 1, 0, '15678904567', '广东省广州天河区车陂路52号', NULL, NULL, 'wzj@qq.com', 0, '广州分公司财务部会计。', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:03:00');
INSERT INTO `users` VALUES (7, '陶行知', 'd93ae65992caf6a8751e334d0a716ad8', '陶行知', 1, 1, '15678905678', '广东省广州天河区车陂路55号', NULL, NULL, 'txz@qq.com', 0, '广州分公司财务部财务审核员。', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:03:00');
INSERT INTO `users` VALUES (8, '屈原', 'd93ae65992caf6a8751e334d0a716ad8', '屈原', 1, 1, '15678904567', '广东省广州天河区棠下街98号', '', '', 'qinshihuang@qq.com', 0, '总部采购部工程师。', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:03:01');
INSERT INTO `users` VALUES (9, '李时珍', 'd93ae65992caf6a8751e334d0a716ad8', '药神', 1, 1, '15678905678', '广东省广州天河区棠下街98号', NULL, NULL, 'lsz@qq.com', 0, '广州分公司研发部经理。', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:03:02');
INSERT INTO `users` VALUES (10, '诸葛亮', 'd93ae65992caf6a8751e334d0a716ad8', '亮亮', 1, 1, '18976864700', '广东省广州天河区车陂路52号', NULL, NULL, '', 0, '总部采购部主管。', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:03:03');
INSERT INTO `users` VALUES (11, '项羽', 'd93ae65992caf6a8751e334d0a716ad8', '项羽', 1, 1, '15689876543', '广东省广州天河区棠下街98号', NULL, NULL, 'xiangyu@qq.com', 0, '总部采购部部长。', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:03:04');
INSERT INTO `users` VALUES (12, '庄子', 'd93ae65992caf6a8751e334d0a716ad8', '老铁', 1, 1, '15678905678', '广东省广州天河区棠下街98号', NULL, NULL, 'zhuangzi@qq.com', 0, '总部软件研发部副经理。', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:03:04');
INSERT INTO `users` VALUES (13, '武则天', 'd93ae65992caf6a8751e334d0a716ad8', '武则天', 1, 0, '15678905678', '广东省广州天河区棠下街98号', NULL, NULL, 'zetian@qq.com', 0, '采购部长', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:03:06');
INSERT INTO `users` VALUES (14, '小李', 'd93ae65992caf6a8751e334d0a716ad8', '小李子', 1, 1, '18976864732', '广东省广州天河区棠下街98号', '2023-03-04 23:34:45', NULL, 'xiaolizi@qq.com', 0, '总部财务部资金核算人员', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:03:07');
INSERT INTO `users` VALUES (15, '孔子', 'd93ae65992caf6a8751e334d0a716ad8', '老铁', 1, 1, '15678905678', '广东省广州天河区棠下街98号', NULL, NULL, 'kongzi@qq.com', 0, '总部软件研发部经理。', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:03:08');
INSERT INTO `users` VALUES (16, '王羲之', 'd93ae65992caf6a8751e334d0a716ad8', '老铁', 1, 1, '15678905678', '广东省广州天河区车陂路55号', NULL, NULL, 'wangxizi@qq.com', 0, '总部软件研发部项目总监。', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:03:09');
INSERT INTO `users` VALUES (17, '张爱玲', 'd93ae65992caf6a8751e334d0a716ad8', '小玲', 1, 0, '18976864700', '广东省广州天河区棠下街18号', NULL, NULL, 'zhangailing@qq.com', 0, '总部财务部出纳。', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:03:10');
INSERT INTO `users` VALUES (18, '刘禅', 'd93ae65992caf6a8751e334d0a716ad8', '刘禅', 1, 1, '15678905678', '广东省广州天河区棠下街98号', NULL, NULL, 'lc@qq.com', 0, '广州分公司销售部经理。', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:03:12');
INSERT INTO `users` VALUES (19, '陶渊明', 'd93ae65992caf6a8751e334d0a716ad8', '陶雨那么', 1, 1, '18976864732', '广东省广州天河区棠下街98号', NULL, NULL, '', 0, '总部销售经理', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:03:13');
INSERT INTO `users` VALUES (20, '曹操', 'd93ae65992caf6a8751e334d0a716ad8', '曹曹', 1, 1, '18976864700', '广东省广州天河区车陂路55号', NULL, NULL, 'cc@qq.com', 0, '总部财务经理', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:03:15');
INSERT INTO `users` VALUES (21, '秦始皇', 'd93ae65992caf6a8751e334d0a716ad8', '秦始皇', 1, 1, '18976864732', '广东省广州天河区棠下街98号', NULL, NULL, 'qinshihuang@qq.com', 0, 'CEO', 0, NULL, NULL, '2023-09-25 07:31:50', '2023-09-25 09:03:17');

SET FOREIGN_KEY_CHECKS = 1;

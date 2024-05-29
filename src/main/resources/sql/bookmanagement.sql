/*
 Navicat Premium Data Transfer

 Source Server         : CY
 Source Server Type    : MySQL
 Source Server Version : 80300
 Source Host           : localhost:3306
 Source Schema         : bookmanagement

 Target Server Type    : MySQL
 Target Server Version : 80300
 File Encoding         : 65001

 Date: 30/05/2024 16:52:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `b_id` int(0) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '书名',
  `t_id` int(0) NOT NULL COMMENT '种类id',
  `cover` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '封面',
  `count` int(0) NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`b_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '三国演义', 1, NULL, 6);
INSERT INTO `book` VALUES (2, '走近科学', 2, 'https://profile-avatar.csdnimg.cn/a90ef3bb2e7d47deb9dabfe94000acc5_qq_74143974.jpg!1', 8);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `r_id` int(0) NOT NULL,
  `b_id` int(0) NULL DEFAULT NULL,
  `u_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (1, 1, 1);
INSERT INTO `record` VALUES (2, 1, 2);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `t_id` int(0) NOT NULL,
  `t_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '种类名称',
  PRIMARY KEY (`t_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '古典文学');
INSERT INTO `type` VALUES (2, '科学');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` int(0) NOT NULL COMMENT '自增主键',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `isAdmin` tinyint(0) NULL DEFAULT NULL COMMENT '1为管理员，0为普通用户',
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', '1', 1, 'https://profile-https://files.codelife.cc/icons/douyu.svg');
INSERT INTO `user` VALUES (2, 'admin', 'admin', 1, 'https://profile-https://files.codelife.cc/icons/douyu.svg');

SET FOREIGN_KEY_CHECKS = 1;

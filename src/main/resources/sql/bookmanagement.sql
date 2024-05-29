/*
 Navicat Premium Data Transfer

 Source Server         : yyy
 Source Server Type    : MySQL
 Source Server Version : 80400
 Source Host           : localhost:3306
 Source Schema         : bookmanagement

 Target Server Type    : MySQL
 Target Server Version : 80400
 File Encoding         : 65001

 Date: 29/05/2024 21:27:38
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
INSERT INTO `book` VALUES (2, '走近科学', 2, NULL, 8);

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
  `u_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `isAdmin` tinyint(0) NULL DEFAULT 0 COMMENT '1为管理员，0为普通用户',
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (0000000001, 'admin', '123456', 1, 'p1.jpg');
INSERT INTO `user` VALUES (0000000002, '1', '1', 1, 'p1.jpg');
INSERT INTO `user` VALUES (0000000017, 'shabi', 'shabi', 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;

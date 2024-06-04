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

 Date: 04/06/2024 08:05:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `bookId` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '书名',
  `typeId` int(0) NOT NULL COMMENT '种类id',
  `cover` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '封面',
  `count` int(0) NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`bookId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '三国演义', 1, 'https://img2.imgtp.com/2024/05/31/vL6Oc1V7.jpg', 4);
INSERT INTO `book` VALUES (2, '走近科学', 2, 'https://img2.imgtp.com/2024/05/31/n53uzKAm.png', 6);
INSERT INTO `book` VALUES (3, '明朝那些事', 4, 'https://t.tutu.to/img/XLpR', 4);
INSERT INTO `book` VALUES (4, '红楼梦', 2, 'https://t.tutu.to/img/XQU5', 16);
INSERT INTO `book` VALUES (5, '狂人日记', 6, 'https://t.tutu.to/img/XcMB', 5);
INSERT INTO `book` VALUES (6, '朝花夕拾', 4, 'https://t.tutu.to/img/XwoH', 4);
INSERT INTO `book` VALUES (7, '绿野仙踪', 2, 'https://t.tutu.to/img/Xb7d', 6);
INSERT INTO `book` VALUES (8, '读者', 6, 'https://t.tutu.to/img/Xzrr', 7);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `recordId` int(0) NOT NULL AUTO_INCREMENT,
  `bookId` int(0) NOT NULL,
  `userId` int(0) NOT NULL,
  `borrowDatetime` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `returnDatetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`recordId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (1, 1, 1, '2024-06-01 16:11:07', NULL);
INSERT INTO `record` VALUES (2, 1, 2, '2024-05-31 16:11:28', NULL);
INSERT INTO `record` VALUES (3, 2, 1, '2024-06-02 15:25:04', NULL);
INSERT INTO `record` VALUES (4, 2, 2, '2024-06-03 20:35:20', NULL);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `typeId` int(0) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '种类名称',
  PRIMARY KEY (`typeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '古典文学');
INSERT INTO `type` VALUES (2, '科学');
INSERT INTO `type` VALUES (3, '现代文学');
INSERT INTO `type` VALUES (4, '历史');
INSERT INTO `type` VALUES (5, '教育');
INSERT INTO `type` VALUES (6, '科技');
INSERT INTO `type` VALUES (7, '小说');
INSERT INTO `type` VALUES (8, '外国文学');
INSERT INTO `type` VALUES (9, '其他');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `isAdmin` tinyint(0) NULL DEFAULT NULL COMMENT '1为管理员，0为普通用户',
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', '1', 1, 'https://img2.imgtp.com/2024/05/31/5f5UdRjW.jpg');
INSERT INTO `user` VALUES (2, 'admin', 'admin', 1, 'https://t.tutu.to/img/Hns7');
INSERT INTO `user` VALUES (3, '123456', '1', 0, 'https://t.tutu.to/img/Hf7H');
INSERT INTO `user` VALUES (4, 'Why', '1', 1, 'https://img0.baidu.com/it/u=178612712,36487532&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500');
INSERT INTO `user` VALUES (5, '2', '2', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

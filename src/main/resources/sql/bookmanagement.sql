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

 Date: 06/06/2024 23:38:10
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
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '三国演义', 1, 'https://t.tutu.to/img/YqgG', 48);
INSERT INTO `book` VALUES (2, '走近科学', 2, 'https://img2.imgtp.com/2024/05/31/n53uzKAm.png', 15);
INSERT INTO `book` VALUES (3, '明朝那些事', 4, 'https://t.tutu.to/img/XLpR', 9);
INSERT INTO `book` VALUES (4, '红楼梦', 1, 'https://t.tutu.to/img/Y0eB', 15);
INSERT INTO `book` VALUES (8, '读者', 3, 'https://t.tutu.to/img/YBQr', 7);
INSERT INTO `book` VALUES (107, 'Web安全攻防', 5, 'https://t.tutu.to/img/Y8Sq', NULL);
INSERT INTO `book` VALUES (108, '朝花夕拾', 7, 'https://t.tutu.to/img/YmN6', NULL);
INSERT INTO `book` VALUES (109, '非暴力沟通', 5, 'https://t.tutu.to/img/Yk95', NULL);
INSERT INTO `book` VALUES (110, '史记', 4, 'https://t.tutu.to/img/Yand', NULL);
INSERT INTO `book` VALUES (111, '刑法学讲义', 5, 'https://t.tutu.to/img/YR8n', NULL);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `recordId` int(0) NOT NULL AUTO_INCREMENT,
  `bookId` int(0) NOT NULL,
  `userId` int(0) NOT NULL,
  `borrowDatetime` datetime(0) NOT NULL,
  `returnDatetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`recordId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (12, 1, 5, '2024-06-04 18:42:44', '2024-06-04 18:42:45');
INSERT INTO `record` VALUES (13, 1, 1, '2024-06-03 19:15:35', '2024-06-04 19:15:35');
INSERT INTO `record` VALUES (15, 1, 1, '2024-06-03 19:15:35', '2024-06-04 19:19:29');
INSERT INTO `record` VALUES (16, 4, 1, '2024-06-04 19:21:18', '2024-06-04 19:21:26');
INSERT INTO `record` VALUES (17, 4, 1, '2024-06-04 19:21:33', '2024-06-04 19:21:36');
INSERT INTO `record` VALUES (18, 2, 5, '2024-06-04 21:32:32', '2024-06-04 21:56:52');
INSERT INTO `record` VALUES (19, 1, 5, '2024-06-04 21:32:33', '2024-06-04 21:33:57');
INSERT INTO `record` VALUES (20, 3, 5, '2024-06-04 21:32:34', '2024-06-04 22:02:33');
INSERT INTO `record` VALUES (21, 4, 5, '2024-06-04 21:32:36', '2024-06-04 22:15:16');
INSERT INTO `record` VALUES (22, 8, 5, '2024-06-04 21:32:38', '2024-06-04 21:33:53');
INSERT INTO `record` VALUES (23, 4, 2, '2024-06-04 21:36:58', '2024-06-04 21:56:11');
INSERT INTO `record` VALUES (24, 100, 2, '2024-06-04 21:37:00', NULL);
INSERT INTO `record` VALUES (25, 1, 1, '2024-06-04 21:55:53', '2024-06-04 21:55:57');
INSERT INTO `record` VALUES (26, 100, 1, '2024-06-04 22:06:12', NULL);
INSERT INTO `record` VALUES (27, 2, 13, '2024-06-05 12:22:23', '2024-06-05 12:40:33');
INSERT INTO `record` VALUES (28, 3, 13, '2024-06-05 12:40:16', '2024-06-05 12:40:32');
INSERT INTO `record` VALUES (29, 5, 13, '2024-06-05 12:40:25', '2024-06-05 12:40:32');
INSERT INTO `record` VALUES (30, 5, 1, '2024-06-05 12:42:50', '2024-06-05 15:00:18');
INSERT INTO `record` VALUES (31, 1, 17, '2024-06-05 13:31:12', '2024-06-05 13:31:16');
INSERT INTO `record` VALUES (32, 8, 18, '2024-06-05 13:40:40', '2024-06-05 13:40:43');
INSERT INTO `record` VALUES (33, 102, 1, '2024-06-05 13:42:27', '2024-06-05 13:43:39');
INSERT INTO `record` VALUES (34, 2, 1, '2024-06-05 13:43:46', '2024-06-05 13:43:57');
INSERT INTO `record` VALUES (35, 103, 1, '2024-06-05 13:45:19', '2024-06-05 15:00:21');
INSERT INTO `record` VALUES (36, 101, 1, '2024-06-05 13:46:18', '2024-06-06 18:56:03');
INSERT INTO `record` VALUES (37, 105, 1, '2024-06-05 13:47:52', NULL);
INSERT INTO `record` VALUES (38, 3, 18, '2024-06-05 14:39:12', NULL);
INSERT INTO `record` VALUES (39, 3, 3, '2024-06-05 14:40:15', '2024-06-05 14:56:29');
INSERT INTO `record` VALUES (40, 2, 3, '2024-06-05 14:42:04', '2024-06-05 14:56:26');
INSERT INTO `record` VALUES (41, 4, 18, '2024-06-05 14:44:40', '2024-06-05 15:37:14');
INSERT INTO `record` VALUES (42, 1, 3, '2024-06-05 14:45:04', '2024-06-05 14:56:25');
INSERT INTO `record` VALUES (43, 1, 5, '2024-06-05 14:52:57', '2024-06-06 19:37:12');
INSERT INTO `record` VALUES (44, 6, 5, '2024-06-05 14:53:41', '2024-06-06 19:37:26');
INSERT INTO `record` VALUES (45, 4, 3, '2024-06-05 15:35:00', '2024-06-05 15:37:09');
INSERT INTO `record` VALUES (46, 1, 1, '2024-06-06 18:56:19', '2024-06-06 18:56:26');
INSERT INTO `record` VALUES (47, 2, 1, '2024-06-06 19:03:46', '2024-06-06 19:03:55');
INSERT INTO `record` VALUES (48, 1, 1, '2024-06-06 19:06:06', '2024-06-06 19:06:11');
INSERT INTO `record` VALUES (49, 1, 1, '2024-06-06 19:08:10', '2024-06-06 19:09:10');
INSERT INTO `record` VALUES (50, 4, 1, '2024-06-06 19:09:18', '2024-06-06 19:09:36');
INSERT INTO `record` VALUES (51, 2, 1, '2024-06-06 19:09:25', '2024-06-06 23:01:12');
INSERT INTO `record` VALUES (52, 1, 5, '2024-06-06 19:37:18', '2024-06-06 19:40:52');
INSERT INTO `record` VALUES (53, 1, 5, '2024-06-06 19:43:13', '2024-06-06 19:43:22');
INSERT INTO `record` VALUES (54, 1, 1, '2024-06-06 21:52:50', NULL);
INSERT INTO `record` VALUES (55, 1, 5, '2024-06-06 23:02:17', '2024-06-06 23:02:22');
INSERT INTO `record` VALUES (56, 1, 5, '2024-06-06 23:02:28', '2024-06-06 23:02:34');

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
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `isAdmin` tinyint(0) NULL DEFAULT NULL COMMENT '1为管理员，0为普通用户',
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', '1', 1, 'https://t.tutu.to/img/wdFi');
INSERT INTO `user` VALUES (2, 'admin', 'admin', 1, 'https://t.tutu.to/img/bxCI');
INSERT INTO `user` VALUES (3, '123456', 'sbsbjhn', 0, 'https://t.tutu.to/img/w80R');
INSERT INTO `user` VALUES (4, 'Why', '1', 1, 'https://t.tutu.to/img/wvzJ');
INSERT INTO `user` VALUES (5, '2', '2', 0, 'https://t.tutu.to/img/wBuz');
INSERT INTO `user` VALUES (18, '崇', '111', 1, 'https://t.tutu.to/img/wUGe');
INSERT INTO `user` VALUES (21, 'qqq', 'qqq', NULL, 'https://t.tutu.to/img/w0vk');
INSERT INTO `user` VALUES (22, 'www', 'www', NULL, 'https://t.tutu.to/img/w9AM');
INSERT INTO `user` VALUES (23, 'eee', 'rrr', NULL, 'https://t.tutu.to/img/wqDg');
INSERT INTO `user` VALUES (24, 'ttt', 'yyy', NULL, 'https://t.tutu.to/img/wRbm');
INSERT INTO `user` VALUES (25, 'sad', 'sasd', NULL, 'https://t.tutu.to/img/whCX');
INSERT INTO `user` VALUES (26, 'xxxa', 'asd', NULL, 'https://t.tutu.to/img/wCJK');
INSERT INTO `user` VALUES (27, 'asfag', 'safw', NULL, 'https://t.tutu.to/img/wIzj');
INSERT INTO `user` VALUES (28, 'saf', 'asfa', NULL, 'https://t.tutu.to/img/wP0A');
INSERT INTO `user` VALUES (29, 'safa', 'adva', NULL, 'https://t.tutu.to/img/w80R');
INSERT INTO `user` VALUES (30, 'qeffq', 'qefq', NULL, 'https://t.tutu.to/img/w9AM');
INSERT INTO `user` VALUES (31, 'qefq', 'ada', NULL, 'https://t.tutu.to/img/wBuz');
INSERT INTO `user` VALUES (32, 'wqcfq', 'sadvg', NULL, 'https://t.tutu.to/img/w80R');

SET FOREIGN_KEY_CHECKS = 1;

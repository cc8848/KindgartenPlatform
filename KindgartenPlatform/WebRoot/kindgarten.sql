/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : kindgarten

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-05-03 00:13:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender_id` bigint(20) NOT NULL COMMENT '对应user表id:发消息者的id',
  `class_id` bigint(20) NOT NULL COMMENT '班级id',
  `content` varchar(1000) DEFAULT NULL,
  `type` tinyint(4) NOT NULL COMMENT '1:文字 2：图片 3：语音',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chat
-- ----------------------------

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '班级人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '小班', '0');
INSERT INTO `class` VALUES ('2', '中班', '0');

-- ----------------------------
-- Table structure for class_user
-- ----------------------------
DROP TABLE IF EXISTS `class_user`;
CREATE TABLE `class_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='user与班级之间的关系表：一个班有哪些老师和学生';

-- ----------------------------
-- Records of class_user
-- ----------------------------
INSERT INTO `class_user` VALUES ('1', '1', '1');
INSERT INTO `class_user` VALUES ('2', '2', '1');
INSERT INTO `class_user` VALUES ('3', '1', '2');
INSERT INTO `class_user` VALUES ('4', '1', '3');
INSERT INTO `class_user` VALUES ('5', '2', '4');

-- ----------------------------
-- Table structure for cookbook
-- ----------------------------
DROP TABLE IF EXISTS `cookbook`;
CREATE TABLE `cookbook` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint(20) NOT NULL COMMENT '对应user表id，这里指老师id',
  `type` tinyint(4) NOT NULL COMMENT '1:早餐 2：中餐 3晚餐',
  `date` date DEFAULT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cookbook
-- ----------------------------

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `class_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of homework
-- ----------------------------
INSERT INTO `homework` VALUES ('2', '1', '和爸爸做个游戏', '2016-04-30', '2');
INSERT INTO `homework` VALUES ('3', '1', '学唱一首儿童歌', '2016-04-30', '1');
INSERT INTO `homework` VALUES ('4', '1', '学习数字', '2016-05-01', '1');
INSERT INTO `homework` VALUES ('5', '1', '认数字', '2016-04-29', '1');
INSERT INTO `homework` VALUES ('6', '1', '学习跳舞', '2016-04-28', '1');
INSERT INTO `homework` VALUES ('7', '1', '学习唱歌', '2016-04-27', '1');
INSERT INTO `homework` VALUES ('8', '1', '写数字', '2016-04-26', '1');
INSERT INTO `homework` VALUES ('9', '1', '读数字', '2016-04-25', '1');
INSERT INTO `homework` VALUES ('10', '1', '认字', '2016-04-24', '1');
INSERT INTO `homework` VALUES ('11', '1', '写字', '2016-04-23', '1');
INSERT INTO `homework` VALUES ('12', '1', '读拼音', '2016-04-22', '1');
INSERT INTO `homework` VALUES ('13', '1', '读课文', '2016-04-21', '1');
INSERT INTO `homework` VALUES ('14', '1', '读书', '2016-04-20', '1');

-- ----------------------------
-- Table structure for life
-- ----------------------------
DROP TABLE IF EXISTS `life`;
CREATE TABLE `life` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of life
-- ----------------------------

-- ----------------------------
-- Table structure for sign_in
-- ----------------------------
DROP TABLE IF EXISTS `sign_in`;
CREATE TABLE `sign_in` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL COMMENT '1:入园 2：出园',
  `teacher_id` bigint(20) NOT NULL COMMENT '对应user表的id，这里一般是指老师的id',
  `time` datetime DEFAULT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `child_id` bigint(20) NOT NULL COMMENT '对应user表id，对应家长id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sign_in
-- ----------------------------

-- ----------------------------
-- Table structure for study
-- ----------------------------
DROP TABLE IF EXISTS `study`;
CREATE TABLE `study` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint(20) NOT NULL COMMENT '对应user表id，指老师id',
  `content` varchar(1000) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of study
-- ----------------------------
INSERT INTO `study` VALUES ('1', '1', '一起做游戏', '2016-04-29', '1', '1');
INSERT INTO `study` VALUES ('2', '1', '学习英文之母歌', '2016-04-30', '3', '1');
INSERT INTO `study` VALUES ('3', '1', '学习写数字', '2016-04-30', '2', '1');
INSERT INTO `study` VALUES ('4', '1', '练握笔', '2016-04-30', '1', '2');
INSERT INTO `study` VALUES ('5', '1', '好好学习', '2016-05-02', '1', '1');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('1', '语文');
INSERT INTO `subject` VALUES ('2', '数学');
INSERT INTO `subject` VALUES ('3', '英语');

-- ----------------------------
-- Table structure for temperature
-- ----------------------------
DROP TABLE IF EXISTS `temperature`;
CREATE TABLE `temperature` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint(20) NOT NULL,
  `temperature` float(11,1) NOT NULL,
  `date` date DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `child_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of temperature
-- ----------------------------
INSERT INTO `temperature` VALUES ('2', '1', '37.0', '2016-04-27', '是多少', '3');
INSERT INTO `temperature` VALUES ('3', '1', '36.5', '2016-04-29', 'dfdfd', '4');
INSERT INTO `temperature` VALUES ('5', '1', '37.5', '2016-04-30', '身体棒棒哒哒', '3');
INSERT INTO `temperature` VALUES ('6', '1', '25.5', '2016-05-02', '133', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `type` tinyint(4) NOT NULL COMMENT '1：园长 2：老师 3：家长',
  `photo` varchar(500) DEFAULT NULL,
  `phone_number` bigint(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `class_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inx_phone_number` (`phone_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '郑宇翔', '2', null, '18380462530', '123456', null);
INSERT INTO `user` VALUES ('2', '小张', '3', null, '18380462531', '123456', null);
INSERT INTO `user` VALUES ('3', '小王', '3', null, '18380462532', '123456', null);
INSERT INTO `user` VALUES ('4', '小红', '3', null, '18380462533', '123456', null);
INSERT INTO `user` VALUES ('5', 'admin', '0', null, '12345678901', '123456', null);
INSERT INTO `user` VALUES ('6', '刘园长', '1', null, '18380462555', '123456', null);

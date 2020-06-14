/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : teache_pro

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2020-06-14 09:12:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for evaluate
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `par_phone` varchar(11) NOT NULL,
  `tea_phone` varchar(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluate
-- ----------------------------
INSERT INTO `evaluate` VALUES ('1', '15977523459', '111111', '撒撒发达', '0000-00-00', '数学');
INSERT INTO `evaluate` VALUES ('2', '15977523459', '222222', '啊啊啊啊啊啊', '0000-00-00', '数学');
INSERT INTO `evaluate` VALUES ('3', '15977523459', '222222', '啊啊啊啊啊啊', '2020\n    -06\n    -05\n       11:12:57', '数学');
INSERT INTO `evaluate` VALUES ('4', '15977523459', '110110', '完全完全完全完全', '2020\n    -06\n    -07\n       08:39:20', '数学');
INSERT INTO `evaluate` VALUES ('5', '15977523459', '110110', '栓时间啊按时间啊', '2020\n    -06\n    -07\n       09:06:23', '数学');
INSERT INTO `evaluate` VALUES ('6', '15977523459', '110', '撒撒撒山东省', '2020\n    -06\n    -07\n       18:11:13', '数学');
INSERT INTO `evaluate` VALUES ('7', '15977523459', '110', '点点滴滴的', '2020\n    -06\n    -07\n       18:14:15', '数学');
INSERT INTO `evaluate` VALUES ('8', '15977523459', '11098', '大户撒大家圣诞节啊', '2020\n    -06\n    -14\n       00:15:51', '数学');
INSERT INTO `evaluate` VALUES ('9', '15977523459', '110', '是否是否是否', '2020\n    -06\n    -14\n       00:55:14', '数学');
INSERT INTO `evaluate` VALUES ('10', '15977523459', '10086', '死发生撒', '2020\n    -06\n    -14\n       01:22:52', '数学');

-- ----------------------------
-- Table structure for parent
-- ----------------------------
DROP TABLE IF EXISTS `parent`;
CREATE TABLE `parent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phonenum` varchar(11) NOT NULL,
  `paswd` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parent
-- ----------------------------
INSERT INTO `parent` VALUES ('1', '12345678901', 'qwe', null, null);
INSERT INTO `parent` VALUES ('2', '110110', '123', null, null);
INSERT INTO `parent` VALUES ('5', '15977523459', '10086', null, null);
INSERT INTO `parent` VALUES ('6', '13477001125', '123', null, null);
INSERT INTO `parent` VALUES ('7', '13511096012', '1234567890', null, null);
INSERT INTO `parent` VALUES ('8', '13700119867', '123456789', null, null);
INSERT INTO `parent` VALUES ('9', '13200119321', '1006', null, null);
INSERT INTO `parent` VALUES ('10', '13245708881', '1234567890', null, null);
INSERT INTO `parent` VALUES ('11', '13723659845', '10086', null, null);
INSERT INTO `parent` VALUES ('12', '15977523458', '10086', null, null);

-- ----------------------------
-- Table structure for par_money
-- ----------------------------
DROP TABLE IF EXISTS `par_money`;
CREATE TABLE `par_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phonenum` varchar(11) NOT NULL,
  `par_balance` varchar(255) NOT NULL,
  `yue` varchar(11) NOT NULL,
  `jifen` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of par_money
-- ----------------------------
INSERT INTO `par_money` VALUES ('1', '15977523459', '1000', '90', '100');

-- ----------------------------
-- Table structure for par_order
-- ----------------------------
DROP TABLE IF EXISTS `par_order`;
CREATE TABLE `par_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `par_phone` varchar(11) NOT NULL,
  `bookname` varchar(255) NOT NULL,
  `count` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of par_order
-- ----------------------------
INSERT INTO `par_order` VALUES ('1', '15977523459', '大鱼吃小鱼', '2', '100', 'true');
INSERT INTO `par_order` VALUES ('2', '15977523459', '疯狂编码', '1', '98', 'false');

-- ----------------------------
-- Table structure for par_reward
-- ----------------------------
DROP TABLE IF EXISTS `par_reward`;
CREATE TABLE `par_reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phonenum` varchar(11) NOT NULL,
  `acount` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of par_reward
-- ----------------------------
INSERT INTO `par_reward` VALUES ('1', '15977523459', '100', '2020-06-21');
INSERT INTO `par_reward` VALUES ('2', '15977523459', '200', '2020-06-10');

-- ----------------------------
-- Table structure for plant
-- ----------------------------
DROP TABLE IF EXISTS `plant`;
CREATE TABLE `plant` (
  `id` int(11) NOT NULL,
  `plant_phonenum` varchar(11) NOT NULL,
  `plant_con` varchar(255) NOT NULL,
  `datetime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plant
-- ----------------------------

-- ----------------------------
-- Table structure for reserve
-- ----------------------------
DROP TABLE IF EXISTS `reserve`;
CREATE TABLE `reserve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paret_phone` varchar(255) NOT NULL,
  `teach_phone` varchar(255) NOT NULL,
  `teach_name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reserve
-- ----------------------------
INSERT INTO `reserve` VALUES ('14', '15977523459', '22211100033', '林俊杰', '数学', '2020-6-13');
INSERT INTO `reserve` VALUES ('15', '15977523459', '22211100033', '林俊杰', '数学', '2020-6-13');
INSERT INTO `reserve` VALUES ('16', '15977523459', '22211100033', '林俊杰', '数学', '2020-6-13');
INSERT INTO `reserve` VALUES ('17', '15977523459', '22211100033', '林俊杰', '数学', '2020-6-13');
INSERT INTO `reserve` VALUES ('18', '15977523459', '22222222222', '元芳', '语文', '2020-6-13');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teache_phonenum` varchar(255) NOT NULL,
  `teach_sex` varchar(11) NOT NULL,
  `teach_icon` varchar(255) NOT NULL,
  `teach_address` varchar(255) NOT NULL,
  `teach_exper` varchar(255) DEFAULT NULL,
  `teach_sub` varchar(10) NOT NULL,
  `grade` varchar(255) NOT NULL,
  `teache_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '11011011011', '男', '', '北京', 'qweeqq', '英语', '高一', '张大炮');
INSERT INTO `teacher` VALUES ('2', '22211100033', '女', '', '上海', '正在下载中心', '数学', '六年级', '林俊杰');
INSERT INTO `teacher` VALUES ('3', '44444444444', '男', '', '厦门', '哈佛三静安寺', '数学', '高二', '李芳');
INSERT INTO `teacher` VALUES ('4', '55555555555', '女', '', '广西', '撒大大大大', '物理', '一年级', '小芳');
INSERT INTO `teacher` VALUES ('5', '22222222222', '女', '', '云南', '飒飒新泽西州', '语文', '高三', '元芳');
INSERT INTO `teacher` VALUES ('6', '0000000000', '男', '', '福建', '你的技能附件内是', '政治', '初一', '小李');
INSERT INTO `teacher` VALUES ('7', '999999999', '男', '', '广东', '飒飒心中只想着', '化学', '初二', '周某人');
INSERT INTO `teacher` VALUES ('8', '1101192102', '女', '', '武汉', '的方式零九秒发刊词', '生物', '初三', '李靖');
INSERT INTO `teacher` VALUES ('9', '48347837482', '男', '', '新疆', '萨阿丹现在', '地理', '五年级', '周杰伦');

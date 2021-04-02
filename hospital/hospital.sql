/*
Navicat MySQL Data Transfer

Source Server         : lyl
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : hospital

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2021-03-18 08:58:14
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `h_admin`
-- ----------------------------
DROP TABLE IF EXISTS `h_admin`;
CREATE TABLE `h_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_pwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of h_admin
-- ----------------------------
INSERT INTO `h_admin` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for `h_dept`
-- ----------------------------
DROP TABLE IF EXISTS `h_dept`;
CREATE TABLE `h_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `dept_name` varchar(255) DEFAULT NULL COMMENT '部门性别',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of h_dept
-- ----------------------------
INSERT INTO `h_dept` VALUES ('1', '神经科');
INSERT INTO `h_dept` VALUES ('2', '内科');
INSERT INTO `h_dept` VALUES ('3', '骨科');
INSERT INTO `h_dept` VALUES ('4', '胸外科');
INSERT INTO `h_dept` VALUES ('5', '儿外科');
INSERT INTO `h_dept` VALUES ('6', '普外科');
INSERT INTO `h_dept` VALUES ('7', '妇科');
INSERT INTO `h_dept` VALUES ('8', '急诊科');
INSERT INTO `h_dept` VALUES ('9', '皮肤科');

-- ----------------------------
-- Table structure for `h_doctor`
-- ----------------------------
DROP TABLE IF EXISTS `h_doctor`;
CREATE TABLE `h_doctor` (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '医生的id',
  `doctor_pwd` varchar(255) DEFAULT NULL COMMENT '医生的密码',
  `doctor_name` varchar(255) DEFAULT NULL COMMENT '医生的姓名',
  `doctor_dept` int(11) DEFAULT NULL COMMENT '医生的部门',
  `doctor_phone` varchar(255) DEFAULT NULL COMMENT '医生的电话',
  `doctor_sex` int(11) DEFAULT NULL COMMENT '医生的性别',
  `doctor_img` varchar(255) DEFAULT NULL COMMENT '医生在头像地址',
  `doctor_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '医生账号创建的时间',
  `doctor_resume` text COMMENT '医生个人介绍，富文本',
  `doctor_rank` int(11) DEFAULT NULL COMMENT '医生的职称',
  `doctor_specialty` varchar(255) DEFAULT NULL COMMENT '业务专长',
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of h_doctor
-- ----------------------------
INSERT INTO `h_doctor` VALUES ('1', '123', '王阳明', '1', '12345678912', '1', 'upload/e4a058aefa7e43f2bb420512a85ab9cc.ico', '2021-03-06 15:48:14', '<p><strong>大家好，我是王阳明</strong></p><p><span style=\"text-decoration: underline;\"><em><strong><span style=\"text-decoration: underline; color: rgb(136, 136, 136); font-family: Poppins, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">擅长神经外科各类手术</span></strong></em></span></p><p><span style=\"text-decoration: underline;\"><em><strong><span style=\"text-decoration: underline; color: rgb(136, 136, 136); font-family: Poppins, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"><br/></span></strong></em></span></p>', '1', '擅长神经外科各类手术');
INSERT INTO `h_doctor` VALUES ('2', '123', '赵强', '2', '12345678913', '0', null, '2021-03-09 17:20:26', null, '2', null);
INSERT INTO `h_doctor` VALUES ('3', '123', '鲍遇海', '1', '12345678914', '0', null, '2021-03-10 08:54:30', null, '1', '擅长神经外科各类脑血管疾病、肿瘤疾病以及颅底疾病。');
INSERT INTO `h_doctor` VALUES ('4', '123', '江建东', '1', '12345678915', '0', null, '2021-03-10 08:56:49', null, '3', '从事神经外科临床工作25年，在颅脑外伤的救治、胶质瘤、脑膜瘤、脊柱脊髓肿瘤、垂体瘤等神经系统肿瘤的诊治方面经验丰富。研究方向：中枢神经系统肿瘤尤其颅底及中线部位肿瘤的显微外科治疗。 ');
INSERT INTO `h_doctor` VALUES ('5', '123', '姚一', '3', '12345678915', '1', null, '2021-03-10 08:57:52', '                                            \r\n                                        ', '2', '在癫痫、颅底肿瘤、椎管内肿瘤、脑血管畸形、动脉瘤、三叉神经痛、面肌痉挛等疾病的显微手术及颅脑损伤的微创救治具备丰富经验。其中在脑功能区定位、脑功能区癫痫外科手术方面处于国际先进水平，婴幼儿难治性癫痫、半球病灶性癫痫外科手术处于国内先进水平。');
INSERT INTO `h_doctor` VALUES ('6', '123', '张慜', '4', '12345678917', '1', null, '2021-03-10 08:58:54', null, '2', '神经免疫性疾病、脑血管疾病、脑部炎症、脊髓炎、帕金森病、癫痫、痴呆、三叉神经痛、坐骨神经病及重症肌无力的诊治。');
INSERT INTO `h_doctor` VALUES ('7', '123', '张荣春', '3', '12345678918', '1', null, '2021-03-10 09:57:46', null, '2', null);
INSERT INTO `h_doctor` VALUES ('8', '123456', '江', '9', '13576532207', '0', null, '2021-03-17 15:41:58', null, '5', null);

-- ----------------------------
-- Table structure for `h_order`
-- ----------------------------
DROP TABLE IF EXISTS `h_order`;
CREATE TABLE `h_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预约',
  `order_patient` int(11) DEFAULT NULL,
  `order_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '患者点击预约操作当前的时间',
  `order_state` int(11) DEFAULT NULL COMMENT '预约状态的id',
  `order_comment` varchar(255) DEFAULT NULL COMMENT '患者的病情描述',
  `order_date` datetime DEFAULT NULL COMMENT '预约看病的时间',
  `order_doctor` int(11) DEFAULT NULL COMMENT '预约的医生',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of h_order
-- ----------------------------
INSERT INTO `h_order` VALUES ('1', '1', '2021-03-16 15:28:33', '103', '', '2021-03-16 08:00:00', '4');
INSERT INTO `h_order` VALUES ('2', '1', '2021-03-16 09:37:54', '101', '皮肤过敏', '2021-03-16 08:00:00', '4');
INSERT INTO `h_order` VALUES ('3', '1', '2021-03-16 09:46:07', '101', '脚痛', '2021-03-16 08:00:00', '4');
INSERT INTO `h_order` VALUES ('4', '2', '2021-03-16 15:25:24', '101', '', '2021-03-16 08:00:00', '4');
INSERT INTO `h_order` VALUES ('5', '1', '2021-03-16 16:36:15', '101', '偷偷和', '2021-03-16 08:00:00', '4');
INSERT INTO `h_order` VALUES ('6', '2', '2021-03-17 10:15:11', '101', '', '2021-03-18 14:00:00', '1');
INSERT INTO `h_order` VALUES ('7', '2', '2021-03-17 14:15:40', '101', '', '2021-03-17 08:00:00', '1');
INSERT INTO `h_order` VALUES ('8', '1', '2021-03-17 14:48:20', '103', '', '2021-03-17 08:00:00', '1');
INSERT INTO `h_order` VALUES ('9', '1', '2021-03-17 14:55:52', '103', '', '2021-03-17 08:00:00', '6');
INSERT INTO `h_order` VALUES ('10', '1', '2021-03-17 14:56:14', '101', '', '2021-03-17 08:00:00', '6');
INSERT INTO `h_order` VALUES ('11', '1', '2021-03-17 17:15:09', '101', 'tou', '2021-02-18 14:00:00', '1');

-- ----------------------------
-- Table structure for `h_patient`
-- ----------------------------
DROP TABLE IF EXISTS `h_patient`;
CREATE TABLE `h_patient` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '患者的id',
  `patient_name` varchar(255) DEFAULT NULL COMMENT '患者姓名',
  `patient_phone` varchar(11) DEFAULT NULL COMMENT '患者电话',
  `patient_pwd` varchar(255) DEFAULT NULL COMMENT '患者密码',
  `patient_sex` int(11) DEFAULT NULL COMMENT '患者性别',
  `patient_birth` date DEFAULT NULL COMMENT '患者生日',
  `patient_idcard` varchar(255) DEFAULT NULL COMMENT '患者身份证',
  `patient_power` int(11) DEFAULT '0' COMMENT '患者的权限，待定',
  `patient_img` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `patient_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '患者注册的时间',
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of h_patient
-- ----------------------------
INSERT INTO `h_patient` VALUES ('1', '王小明', '13576895502', '123456', '0', '2009-06-01', null, '0', null, '2021-03-15 15:04:56');
INSERT INTO `h_patient` VALUES ('2', '理论力', '15779780466', '1234', '1', '2021-03-10', null, '0', 'upload/7aa689a629964521bb4ba8030d06b20c.ico', '2021-03-16 15:24:30');
INSERT INTO `h_patient` VALUES ('3', '哈哈哈', '13576532207', '123', '1', '2021-03-02', null, '0', 'upload/960c9977c3434d1d9f84e9219023456a.', '2021-03-17 10:34:50');
INSERT INTO `h_patient` VALUES ('4', '李丽丽', '15779780467', '123', '1', '2021-03-11', null, '0', 'upload/292798ea44ff4c4d977ca114f2225448.', '2021-03-17 10:39:15');

-- ----------------------------
-- Table structure for `h_rank`
-- ----------------------------
DROP TABLE IF EXISTS `h_rank`;
CREATE TABLE `h_rank` (
  `rank_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '医生职称的id',
  `rank_name` varchar(255) DEFAULT NULL COMMENT '医生职称名,例如主任，医师等',
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of h_rank
-- ----------------------------
INSERT INTO `h_rank` VALUES ('1', '主任医师');
INSERT INTO `h_rank` VALUES ('2', '副主任医师');
INSERT INTO `h_rank` VALUES ('3', '主治医师');
INSERT INTO `h_rank` VALUES ('4', '住院医师');
INSERT INTO `h_rank` VALUES ('5', '实习医生');

-- ----------------------------
-- Table structure for `h_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `h_schedule`;
CREATE TABLE `h_schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '排班表的id',
  `schedule_doctor` int(11) DEFAULT NULL COMMENT '医生的id',
  `schedule_mon` int(11) DEFAULT NULL COMMENT '周一的时间表，0上下午都没有空，1上午有空，2下午有空，3上下午都有空',
  `schedule_tue` int(11) DEFAULT NULL,
  `schedule_wed` int(11) DEFAULT NULL,
  `schedule_thu` int(11) DEFAULT NULL,
  `schedule_fri` int(11) DEFAULT NULL,
  `schedule_sat` int(11) DEFAULT NULL,
  `schedule_sun` int(11) DEFAULT NULL,
  `schedule_dept` int(11) DEFAULT NULL,
  `schedule_number` int(11) DEFAULT NULL COMMENT '每个时间段最多能容纳的人数',
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of h_schedule
-- ----------------------------
INSERT INTO `h_schedule` VALUES ('1', '1', '1', '2', '1', '2', '1', '3', '1', '1', '10');
INSERT INTO `h_schedule` VALUES ('2', '2', '0', '1', '1', '2', '1', '0', '1', '2', '10');
INSERT INTO `h_schedule` VALUES ('3', '3', '2', '1', '2', '1', '0', '2', '1', '1', '10');
INSERT INTO `h_schedule` VALUES ('4', '4', '3', '1', '2', '1', '2', '1', '2', '1', '10');
INSERT INTO `h_schedule` VALUES ('5', '5', '2', '2', '0', '2', '1', '2', '3', '3', '10');
INSERT INTO `h_schedule` VALUES ('6', '6', '0', '1', '3', '1', '2', '1', '1', '4', '10');
INSERT INTO `h_schedule` VALUES ('7', '7', '3', '0', '1', '3', '1', '1', '2', '3', '10');

-- ----------------------------
-- Table structure for `h_state`
-- ----------------------------
DROP TABLE IF EXISTS `h_state`;
CREATE TABLE `h_state` (
  `state_id` int(11) NOT NULL DEFAULT '0' COMMENT '状态代码',
  `state_comment` varchar(255) DEFAULT NULL COMMENT '状态描述',
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of h_state
-- ----------------------------
INSERT INTO `h_state` VALUES ('100', '未处理');
INSERT INTO `h_state` VALUES ('101', '已同意');
INSERT INTO `h_state` VALUES ('102', '已拒绝');
INSERT INTO `h_state` VALUES ('103', '已取消');
INSERT INTO `h_state` VALUES ('104', '其他');

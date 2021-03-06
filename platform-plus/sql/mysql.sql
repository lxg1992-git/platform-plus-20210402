/*
Navicat MySQL Data Transfer

Source Server         :
Source Server Version : 50722
Source Host           :
Source Database       : platform-plus

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-02-12 19:51:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `QRTZ_BLOB_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_IBFK_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_CALENDARS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_CRON_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_IBFK_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_FIRED_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_JOB_DETAILS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_LOCKS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_PAUSED_TRIGGER_GRPS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_SCHEDULER_STATE`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_SIMPLE_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_IBFK_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_SIMPROP_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_IBFK_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `QRTZ_TRIGGERS_IBFK_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for `SCHEDULE_JOB`
-- ----------------------------
DROP TABLE IF EXISTS `SCHEDULE_JOB`;
CREATE TABLE `SCHEDULE_JOB` (
  `JOB_ID` VARCHAR(32) NOT NULL COMMENT '??????id',
  `BEAN_NAME` VARCHAR(200) DEFAULT NULL COMMENT 'SPRING BEAN??????',
  `METHOD_NAME` VARCHAR(100) DEFAULT NULL COMMENT '?????????',
  `PARAMS` VARCHAR(2000) DEFAULT NULL COMMENT '??????',
  `CRON_EXPRESSION` VARCHAR(100) DEFAULT NULL COMMENT 'cron?????????',
  `STATUS` TINYINT(4) DEFAULT NULL COMMENT '????????????  0?????????  1?????????',
  `REMARK` VARCHAR(255) DEFAULT NULL COMMENT '??????',
  `CREATE_TIME` DATETIME DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`JOB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='????????????';

-- ----------------------------
-- Records of SCHEDULE_JOB
-- ----------------------------
INSERT INTO `SCHEDULE_JOB` VALUES ('f4330210e5664ebda4d56878236b572f', 'tokenTask', 'refreshToken', null, '0 0/30 * * * ?', '1', null, '2019-01-22 17:02:34');

-- ----------------------------
-- Table structure for `SCHEDULE_JOB_log`
-- ----------------------------
DROP TABLE IF EXISTS `SCHEDULE_JOB_log`;
CREATE TABLE `SCHEDULE_JOB_log` (
  `LOG_ID` VARCHAR(32) NOT NULL COMMENT '????????????id',
  `JOB_ID` VARCHAR(32) NOT NULL COMMENT '??????id',
  `BEAN_NAME` VARCHAR(200) DEFAULT NULL COMMENT 'spring bean??????',
  `METHOD_NAME` VARCHAR(100) DEFAULT NULL COMMENT '?????????',
  `PARAMS` VARCHAR(2000) DEFAULT NULL COMMENT '??????',
  `STATUS` TINYINT(4) NOT NULL COMMENT '????????????    0?????????    1?????????',
  `ERROR` VARCHAR(2000) DEFAULT NULL COMMENT '????????????',
  `TIMES` INT(11) NOT NULL COMMENT '??????(???????????????)',
  `CREATE_TIME` DATETIME DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`LOG_ID`),
  KEY `JOB_ID` (`JOB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='??????????????????';

-- ----------------------------
-- Records of SCHEDULE_JOB_log
-- ----------------------------

-- ----------------------------
-- Table structure for `SYS_CAPTCHA`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_CAPTCHA`;
CREATE TABLE `sys_captcha` (
  `UUID` CHAR(36) NOT NULL COMMENT 'uuid',
  `CODE` VARCHAR(6) NOT NULL COMMENT '?????????',
  `EXPIRE_TIME` DATETIME DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='???????????????';

-- ----------------------------
-- Records of SYS_CAPTCHA
-- ----------------------------

-- ----------------------------
-- Table structure for `SYS_CONFIG`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_CONFIG`;
CREATE TABLE `SYS_CONFIG` (
  `ID` VARCHAR(32) NOT NULL,
  `PARAM_KEY` VARCHAR(50) DEFAULT NULL COMMENT 'key',
  `PARAM_VALUE` VARCHAR(2000) DEFAULT NULL COMMENT 'value',
  `STATUS` TINYINT(4) DEFAULT '1' COMMENT '??????   0?????????   1?????????',
  `REMARK` VARCHAR(500) DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PARAM_KEY` (`PARAM_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='?????????????????????';

-- ----------------------------
-- Records of SYS_CONFIG
-- ----------------------------
INSERT INTO `SYS_CONFIG` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"type\":4,\"qiniuDomain\":\"\",\"qiniuPrefix\":\"\",\"qiniuAccessKey\":\"\",\"qiniuSecretKey\":\"\",\"qiniuBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"\",\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qcloudBucketName\":\"\",\"diskPath\":\"/usr/local/nginx/html/upload\",\"proxyServer\":\"http://132.232.89.47/upload\"}', '0', '?????????????????????');
INSERT INTO `SYS_CONFIG` VALUES ('2', 'SMS_CONFIG_KEY', '{\"domain\":\"http://web.cr6868.com/asmx/smsservice.aspx?\",\"name\":\"lipengjun\",\"pwd\":\"\",\"sign\":\"?????????????????????\",\"type\":1}', '0', '????????????');

-- ----------------------------
-- Table structure for `SYS_DICT`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_DICT`;
CREATE TABLE `SYS_DICT` (
  `ID` VARCHAR(32) NOT NULL,
  `GROUP_ID` VARCHAR(32) DEFAULT NULL COMMENT '????????????ID',
  `NAME` VARCHAR(100) DEFAULT NULL COMMENT '????????????',
  `VALUE` VARCHAR(64) DEFAULT NULL COMMENT '?????????',
  `SORT` INT(11) DEFAULT NULL COMMENT '?????????',
  `STATUS` INT(11) DEFAULT NULL COMMENT '?????????',
  `REMARK` TEXT COMMENT '??????',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='????????????';

-- ----------------------------
-- Records of SYS_DICT
-- ----------------------------
INSERT INTO `SYS_DICT` VALUES ('37f73ea6b07c40ab8baec7f58b10e69e', '0b5e3fc9c30a4839a881bef0f85fc8af', '???', '1', '1', '1', null);
INSERT INTO `SYS_DICT` VALUES ('979439be76954bc1852fdf2aeccf3cbc', '0b5e3fc9c30a4839a881bef0f85fc8af', '??????', '3', '3', '1', null);
INSERT INTO `SYS_DICT` VALUES ('fc982423addd41e3852c70f8396a0c6c', '0b5e3fc9c30a4839a881bef0f85fc8af', '???', '2', '2', '1', null);
INSERT INTO `SYS_DICT` VALUES ('7936bc509417490ba0df9d938ccd1ce4', '2bbfcb36f9414b71a5d65f497be93496', '???', '1', '1', '1', null);
INSERT INTO `SYS_DICT` VALUES ('f6cf775c5cea4c7b8858eb2ce0501177', '2bbfcb36f9414b71a5d65f497be93496', '???', '0', '2', '1', null);

-- ----------------------------
-- Table structure for `SYS_DICT_GROUP`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_DICT_GROUP`;
CREATE TABLE `SYS_DICT_GROUP` (
  `ID` VARCHAR(32) NOT NULL,
  `CODE` VARCHAR(64) NOT NULL COMMENT '????????????',
  `NAME` VARCHAR(100) DEFAULT NULL COMMENT '????????????',
  `CREATE_TIME` DATETIME DEFAULT NULL COMMENT '????????????',
  `REMARK` TEXT COMMENT '??????',
  PRIMARY KEY (`ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='??????????????????';

-- ----------------------------
-- Records of SYS_DICT_GROUP
-- ----------------------------
INSERT INTO `SYS_DICT_GROUP` VALUES ('0b5e3fc9c30a4839a881bef0f85fc8af', 'SEX', '??????', null, '?????????1?????? 2?????? 3?????????');
INSERT INTO `SYS_DICT_GROUP` VALUES ('2bbfcb36f9414b71a5d65f497be93496', 'IS_NOT', '??????', null, '1?????? 0??????');

-- ----------------------------
-- Table structure for `SYS_LOG`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_LOG`;
CREATE TABLE `SYS_LOG` (
  `ID` VARCHAR(32) NOT NULL,
  `USER_NAME` VARCHAR(50) DEFAULT NULL COMMENT '?????????',
  `OPERATION` VARCHAR(50) DEFAULT NULL COMMENT '????????????',
  `METHOD` VARCHAR(200) DEFAULT NULL COMMENT '????????????',
  `PARAMS` VARCHAR(5000) DEFAULT NULL COMMENT '????????????',
  `TIME` BIGINT(20) NOT NULL COMMENT '????????????(??????)',
  `IP` VARCHAR(64) DEFAULT NULL COMMENT 'IP??????',
  `CREATE_TIME` DATETIME DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='????????????';

-- ----------------------------
-- Records of SYS_LOG
-- ----------------------------

-- ----------------------------
-- Table structure for `SYS_MENU`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_MENU`;
CREATE TABLE `SYS_MENU` (
  `MENU_ID` VARCHAR(8) NOT NULL,
  `PARENT_ID` VARCHAR(8) DEFAULT NULL COMMENT '?????????ID??????????????????0',
  `NAME` VARCHAR(50) DEFAULT NULL COMMENT '????????????',
  `URL` VARCHAR(200) DEFAULT NULL COMMENT '??????URL',
  `PERMS` VARCHAR(500) DEFAULT NULL COMMENT '??????(??????????????????????????????user:list,user:create)',
  `TYPE` INT(11) DEFAULT NULL COMMENT '??????   0?????????   1?????????   2?????????',
  `ICON` VARCHAR(50) DEFAULT NULL COMMENT '????????????',
  `ORDER_NUM` INT(11) DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='????????????';

-- ----------------------------
-- Records of SYS_MENU
-- ----------------------------
INSERT INTO `SYS_MENU` VALUES ('10', '0', '????????????', null, null, 0, 'system', 0);
INSERT INTO `SYS_MENU` VALUES ('1001', '10', '????????????', 'sys/menu', 'sys:menu:list,sys:menu:info', 1, 'menu', 1);
INSERT INTO `SYS_MENU` VALUES ('100101', '1001', '??????', null, 'sys:menu:save,sys:menu:select', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('100102', '1001', '??????', null, 'sys:menu:update,sys:menu:select', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('100103', '1001', '??????', null, 'sys:menu:delete', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('1002', '10', '????????????', 'sys/org', 'sys:org:list,sys:org:info', 1, 'org', 2);
INSERT INTO `SYS_MENU` VALUES ('100201', '1002', '??????', null, 'sys:org:save', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('100202', '1002', '??????', null, 'sys:org:update', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('100203', '1002', '??????', null, 'sys:org:delete', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('1003', '10', '????????????', 'sys/config', 'sys:config:list,sys:config:info', 1, 'xitongpeizhi', 3);
INSERT INTO `SYS_MENU` VALUES ('100301', '1003', '??????', null, 'sys:config:save', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('100302', '1003', '??????', null, 'sys:config:update', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('100303', '1003', '??????', null, 'sys:config:delete', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('1004', '10', '????????????', 'sys/dictgroup', 'sys:dictgroup:list,sys:dictgroup:info,sys:dict:list,sys:dict:info', 1, 'dict', 4);
INSERT INTO `SYS_MENU` VALUES ('100401', '1004', '??????????????????', null, 'sys:dict:save', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('100402', '1004', '??????????????????', null, 'sys:dict:update', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('100403', '1004', '??????????????????', null, 'sys:dict:delete', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('100404', '1004', '????????????????????????', null, 'sys:dictgroup:save', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('100405', '1004', '????????????????????????', null, 'sys:dictgroup:update', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('100406', '1004', '????????????????????????', null, 'sys:dictgroup:delete', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('1005', '10', '????????????', 'oss/oss', 'sys:oss:list', 1, 'oss', 5);
INSERT INTO `SYS_MENU` VALUES ('100501', '1005', '???????????????', null, 'sys:oss:config', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('100502', '1005', '????????????', null, 'sys:oss:upload', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('100503', '1005', '??????', null, 'sys:oss:delete', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('1006', '10', '????????????', 'sys/log', 'sys:log:list', 1, 'log', 6);
INSERT INTO `SYS_MENU` VALUES ('11', '0', '????????????', null, null, 0, 'auth', 1);
INSERT INTO `SYS_MENU` VALUES ('1101', '11', '???????????????', 'sys/user', 'sys:user:list,sys:user:info', 1, 'admin', 1);
INSERT INTO `SYS_MENU` VALUES ('110101', '1101', '????????????', null, 'sys:user:resetPw', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('110102', '1101', '??????', null, 'sys:user:save,sys:role:select', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('110103', '1101', '??????', null, 'sys:user:update,sys:role:select', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('110104', '1101', '??????', null, 'sys:user:delete', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('1102', '11', '????????????', 'sys/role', 'sys:role:list,sys:role:info', 1, 'role', 2);
INSERT INTO `SYS_MENU` VALUES ('110201', '1102', '??????', null, 'sys:role:save,sys:menu:list', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('110202', '1102', '??????', null, 'sys:role:update,sys:menu:list', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('110203', '1102', '??????', null, 'sys:role:delete', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('12', '0', '????????????', null, null, 0, 'duanxinpingtai', 2);
INSERT INTO `SYS_MENU` VALUES ('1211', '12', '????????????', 'sys/smslog', 'sys:smslog:list', 1, 'duanxin', 1);
INSERT INTO `SYS_MENU` VALUES ('121101', '1211', '????????????', null, 'sys:smslog:config', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('121102', '1211', '??????', null, 'sys:smslog:delete', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('121103', '1211', '????????????', null, 'sys:smslog:send', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('13', '0', '????????????', null, null, 0, 'diaodu', 3);
INSERT INTO `SYS_MENU` VALUES ('1301', '13', '????????????', 'job/schedule', 'sys:schedule:list,sys:schedule:info', 1, 'job', 1);
INSERT INTO `SYS_MENU` VALUES ('130101', '1301', '??????', null, 'sys:schedule:delete', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('130102', '1301', '??????', null, 'sys:schedule:pause', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('130103', '1301', '??????', null, 'sys:schedule:resume', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('130104', '1301', '????????????', null, 'sys:schedule:run', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('130105', '1301', '????????????', null, 'sys:schedule:log', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('130106', '1301', '??????', null, 'sys:schedule:save', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('130107', '1301', '??????', null, 'sys:schedule:update', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('14', '0', '???????????????', null, null, 0, 'activiti', 4);
INSERT INTO `SYS_MENU` VALUES ('1401', '14', '????????????', 'act/reprocdef', 'act:reprocdef:list', 1, 'procdef', 1);
INSERT INTO `SYS_MENU` VALUES ('140101', '1401', '??????,??????', null, 'act:reprocdef:update', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('140102', '1401', '??????', null, 'act:reprocdef:delete', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('140103', '1401', '????????????', null, 'act:reprocdef:convertToModel', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('140104', '1401', '????????????', null, 'act:reprocdef:deploy', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('1402', '14', '????????????', 'act/remodel', 'act:remodel:list', 1, 'model', 2);
INSERT INTO `SYS_MENU` VALUES ('140201', '1402', '??????', null, 'act:remodel:save', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('140202', '1402', '??????', null, 'act:remodel:update', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('140203', '1402', '??????', null, 'act:remodel:deploy', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('140204', '1402', '??????', null, 'act:remodel:export', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('140205', '1402', '??????', null, 'act:remodel:delete', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('15', '0', '????????????', null, null, 0, 'dev', 5);
INSERT INTO `SYS_MENU` VALUES ('1501', '15', '??????????????????', 'sys/usertoken', 'sys:usertoken:list', 1, 'zaixian', 1);
INSERT INTO `SYS_MENU` VALUES ('150101', '1501', '????????????', null, 'sys:usertoken:offline', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('1502', '15', '????????????', 'sys/redis', 'sys:cache:queryAll', 1, 'redis', 2);
INSERT INTO `SYS_MENU` VALUES ('150201', '1502', '??????', null, 'sys:cache:deleteCache', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('1503', '15', 'SQL??????', 'http://localhost:8888/platform-plus/druid/sql.html', null, 1, 'sql', 3);
INSERT INTO `SYS_MENU` VALUES ('1504', '15', '????????????', 'http://localhost:8888/platform-plus/doc.html', null, 1, 'interface', 4);
INSERT INTO `SYS_MENU` VALUES ('1505', '15', '???????????????', 'gen/generator', 'sys:generator:list', 1, 'code', 5);
INSERT INTO `SYS_MENU` VALUES ('150501', '1505', '????????????', null, 'sys:generator:code', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('16', '0', '????????????', null, null, 0, 'email', 6);
INSERT INTO `SYS_MENU` VALUES ('1601', '16', '????????????', 'sys/maillog', 'sys:maillog:list,sys:maillog:info', 1, 'job', 1);
INSERT INTO `SYS_MENU` VALUES ('160101', '1601', '??????', null, 'sys:maillog:delete', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('160102', '1601', '????????????', null, 'sys:maillog:config', 2, null, 0);
INSERT INTO `SYS_MENU` VALUES ('17', '0', 'ELK??????', 'http://localhost:5601', null, '1', 'log', 7);

-- ----------------------------
-- Table structure for `SYS_ORG`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ORG`;
CREATE TABLE `SYS_ORG` (
  `ORG_NO` VARCHAR(10) NOT NULL COMMENT '????????????',
  `ORG_NAME` VARCHAR(50) DEFAULT NULL COMMENT '????????????',
  `PARENT_NO` VARCHAR(10) DEFAULT NULL COMMENT '????????????ID??????????????????0',
  `ORG_TYPE` INT(11) DEFAULT NULL COMMENT '??????',
  `STATUS` INT(11) DEFAULT '1' COMMENT '??????  0?????????   1?????????',
  `SORT` INT(11) DEFAULT NULL COMMENT '??????',
  `CREATE_USER_ID` VARCHAR(32) DEFAULT NULL COMMENT '?????????ID',
  `CREATE_TIME` DATETIME DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`ORG_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='????????????';

-- ----------------------------
-- Records of SYS_ORG
-- ----------------------------
INSERT INTO `SYS_ORG` VALUES ('01', '??????????????????????????????', '0', '1', '1', '0', '1', '2019-01-21 16:53:32');

-- ----------------------------
-- Table structure for `SYS_OSS`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_OSS`;
CREATE TABLE `SYS_OSS` (
  `ID` VARCHAR(32) NOT NULL,
  `URL` VARCHAR(200) DEFAULT NULL COMMENT 'URL??????',
  `CREATE_DATE` DATETIME DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='????????????';

-- ----------------------------
-- Records of SYS_OSS
-- ----------------------------

-- ----------------------------
-- Table structure for `SYS_ROLE`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ROLE`;
CREATE TABLE `SYS_ROLE` (
  `ROLE_ID` VARCHAR(32) NOT NULL,
  `ROLE_NAME` VARCHAR(100) DEFAULT NULL COMMENT '????????????',
  `REMARK` VARCHAR(100) DEFAULT NULL COMMENT '??????',
  `CREATE_USER_ID` VARCHAR(32) DEFAULT NULL COMMENT '?????????ID',
  `CREATE_USER_ORG_NO` VARCHAR(32) DEFAULT NULL COMMENT '?????????????????????',
  `CREATE_TIME` DATETIME DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='??????';

-- ----------------------------
-- Records of SYS_ROLE
-- ----------------------------

-- ----------------------------
-- Table structure for `SYS_ROLE_MENU`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ROLE_MENU`;
CREATE TABLE `SYS_ROLE_MENU` (
  `ID` VARCHAR(32) NOT NULL,
  `ROLE_ID` VARCHAR(32) DEFAULT NULL COMMENT '??????ID',
  `MENU_ID` VARCHAR(8) DEFAULT NULL COMMENT '??????ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='???????????????????????????';

-- ----------------------------
-- Records of SYS_ROLE_MENU
-- ----------------------------

-- ----------------------------
-- Table structure for `SYS_ROLE_ORG`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ROLE_ORG`;
CREATE TABLE `SYS_ROLE_ORG` (
  `ID` VARCHAR(32) NOT NULL,
  `ROLE_ID` VARCHAR(32) DEFAULT NULL COMMENT '??????ID',
  `ORG_NO` VARCHAR(32) DEFAULT NULL COMMENT '??????ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='???????????????????????????';

-- ----------------------------
-- Records of SYS_ROLE_ORG
-- ----------------------------

-- ----------------------------
-- Table structure for `SYS_SMS_LOG`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_SMS_LOG`;
CREATE TABLE `SYS_SMS_LOG` (
  `ID` VARCHAR(32) NOT NULL COMMENT '??????',
  `USER_ID` VARCHAR(32) DEFAULT NULL COMMENT '?????????ID',
  `CONTENT` TEXT COMMENT '??????????????????????????????1-500 ????????????UTF-8??????',
  `MOBILE` TEXT COMMENT '?????????????????????????????????????????????????????????',
  `STIME` DATETIME DEFAULT NULL COMMENT '????????????????????????????????????????????????????????????????????????????????????????????????',
  `SIGN` VARCHAR(32) DEFAULT NULL COMMENT '???????????????????????????',
  `TYPE` VARCHAR(32) DEFAULT NULL COMMENT '???????????????????????? PT',
  `EXTNO` VARCHAR(255) DEFAULT NULL COMMENT '??????????????????????????????????????????????????????????????????',
  `SEND_STATUS` INT(1) DEFAULT NULL COMMENT '1?????? 0??????',
  `SEND_ID` VARCHAR(32) DEFAULT NULL COMMENT '????????????',
  `INVALID_NUM` INT(11) DEFAULT NULL COMMENT '???????????????',
  `SUCCESS_NUM` INT(11) DEFAULT NULL COMMENT '???????????????',
  `BLACK_NUM` INT(11) DEFAULT NULL COMMENT '????????????',
  `RETURN_MSG` VARCHAR(50) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='??????????????????';

-- ----------------------------
-- Records of SYS_SMS_LOG
-- ----------------------------

-- ----------------------------
-- Table structure for `SYS_USER`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_USER`;
CREATE TABLE `SYS_USER` (
  `USER_ID` VARCHAR(32) NOT NULL,
  `USER_NAME` VARCHAR(50) NOT NULL COMMENT '?????????',
  `REAL_NAME` VARCHAR(64) NOT NULL,
  `SEX` TINYINT(4) NOT NULL,
  `ORG_NO` VARCHAR(32) DEFAULT NULL COMMENT '????????????',
  `SALT` VARCHAR(20) DEFAULT NULL COMMENT '???',
  `EMAIL_HOST` VARCHAR(32) DEFAULT NULL COMMENT '?????????????????????',
  `EMAIL` VARCHAR(100) DEFAULT NULL COMMENT '??????',
  `EMAIL_PW` VARCHAR(64) DEFAULT NULL COMMENT '??????????????????',
  `MOBILE` VARCHAR(100) DEFAULT NULL COMMENT '?????????',
  `STATUS` TINYINT(4) DEFAULT NULL COMMENT '??????  0?????????   1?????????',
  `PASSWORD` VARCHAR(100) DEFAULT NULL COMMENT '??????',
  `CREATE_USER_ID` VARCHAR(32) DEFAULT NULL COMMENT '?????????ID',
  `CREATE_USER_ORG_NO` VARCHAR(32) DEFAULT NULL COMMENT '?????????????????????',
  `CREATE_TIME` DATETIME DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USERNAME` (`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='????????????';

-- ----------------------------
-- Records of SYS_USER
-- ----------------------------
INSERT INTO `SYS_USER` VALUES ('1', 'admin', '?????????', 1, '01', 'YzcmCZNvbXocrsz9dm8e', 'smtp.qq.com', '939961241@qq.com', '', '15209831991', '1', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', null, null, '2016-11-11 11:11:11');

-- ----------------------------
-- Table structure for `SYS_USER_ROLE`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_USER_ROLE`;
CREATE TABLE `SYS_USER_ROLE` (
  `ID` VARCHAR(32) NOT NULL,
  `USER_ID` VARCHAR(32) DEFAULT NULL COMMENT '??????ID',
  `ROLE_ID` VARCHAR(32) DEFAULT NULL COMMENT '??????ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='???????????????????????????';

-- ----------------------------
-- Records of SYS_USER_ROLE
-- ----------------------------

-- ----------------------------
-- Table structure for `SYS_USER_TOKEN`
-- ----------------------------
DROP TABLE IF EXISTS `SYS_USER_TOKEN`;
CREATE TABLE `SYS_USER_TOKEN` (
  `USER_ID` VARCHAR(32) NOT NULL,
  `TOKEN` VARCHAR(100) NOT NULL COMMENT 'TOKEN',
  `EXPIRE_TIME` DATETIME DEFAULT NULL COMMENT '????????????',
  `UPDATE_TIME` DATETIME DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `TOKEN` (`TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='????????????Token';

-- ----------------------------
-- Records of SYS_USER_TOKEN
-- ----------------------------

-- ----------------------------
-- Table structure for `TB_USER`
-- ----------------------------
DROP TABLE IF EXISTS `TB_USER`;
CREATE TABLE `TB_USER` (
  `USER_ID` VARCHAR(32) NOT NULL,
  `USER_NAME` VARCHAR(50) NOT NULL COMMENT '?????????',
  `SUBSCRIBE` INT(1) COMMENT '???????????????1????????????0??????????????????????????????????????????????????????',
  `SUBSCRIBE_TIME` VARCHAR(50) COMMENT '??????????????????????????????????????????????????????????????????????????????????????????',
  `OPEN_ID` VARCHAR(100) COMMENT '???????????????',
  `NICKNAME` VARCHAR(200) COMMENT '????????????',
  `HEAD_IMG_URL` VARCHAR(200) COMMENT '????????????',
  `SEX` INT(1) COMMENT '??????????????????1????????????2????????????0????????????',
  `MOBILE` VARCHAR(20) NOT NULL COMMENT '?????????',
  `PASSWORD` VARCHAR(64) COMMENT '??????',
  `CREATE_TIME` DATETIME COMMENT '????????????',
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USER_NAME` (`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='??????';

-- ----------------------------
-- Records of TB_USER
-- ----------------------------
INSERT INTO `TB_USER` VALUES ('1', '?????????', 1, '1550742648', 'oxaA11ulr9134oBL9Xscon5at_Gc', 'Boy Genius', 'http://thirdwx.qlogo.cn/mmopen/PiajxSqBRaEI3eTLaf64kP7sBrpXKbJ7l4h6BWOlJjAQUqibVbsKotVWbzH6QnkTHYmuTMZXuUiaXVo7Ba02XbCxA/132', 1, '15209831990', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2019-03-06 02:33:16');

DROP TABLE IF EXISTS `SYS_MAIL_LOG`;
CREATE TABLE `SYS_MAIL_LOG` (
  `ID` VARCHAR(32) NOT NULL,
  `SENDER` VARCHAR(100) NOT NULL COMMENT '?????????',
  `RECEIVER` VARCHAR(4000) NOT NULL COMMENT '?????????',
  `SUBJECT` VARCHAR(500) NOT NULL COMMENT '????????????',
  `CONTENT` VARCHAR(4000) DEFAULT NULL COMMENT '????????????',
  `SEND_DATE` DATETIME DEFAULT NULL COMMENT '????????????',
  `TYPE` TINYINT(4) DEFAULT NULL COMMENT '0????????????????????? 1?????????????????????',
  `SEND_RESULT` TINYINT(4) DEFAULT NULL COMMENT '???????????? 0:???????????? 1:????????????',
  `CREATE_USER_ID` VARCHAR(32) DEFAULT NULL COMMENT '?????????ID',
  `CREATE_USER_ORG_NO` VARCHAR(32) DEFAULT NULL COMMENT '?????????????????????',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='??????????????????';
/*
 Navicat Premium Data Transfer

 Source Server Type    : MySQL
 Source Server Version : 50715
 Source Schema         : eo_api

 Target Server Type    : MySQL
 Target Server Version : 50715
 File Encoding         : 65001

 Date: 30/12/2019 11:19:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for eo_api
-- ----------------------------
DROP TABLE IF EXISTS `eo_api`;
CREATE TABLE `eo_api`  (
  `apiID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `apiName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `apiURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `apiProtocol` tinyint(1) UNSIGNED NOT NULL,
  `apiFailureMock` text CHARACTER SET utf8 COLLATE utf8_bin,
  `apiSuccessMock` text CHARACTER SET utf8 COLLATE utf8_bin,
  `apiRequestType` tinyint(1) UNSIGNED NOT NULL,
  `apiSuccessMockType` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `apiFailureMockType` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `apiStatus` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `apiUpdateTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `groupID` int(11) UNSIGNED NOT NULL,
  `projectID` int(11) UNSIGNED NOT NULL,
  `starred` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `removed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `removeTime` timestamp(0) DEFAULT NULL,
  `apiNoteType` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `apiNoteRaw` text CHARACTER SET utf8 COLLATE utf8_bin,
  `apiNote` text CHARACTER SET utf8 COLLATE utf8_bin,
  `apiRequestParamType` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `apiRequestRaw` text CHARACTER SET utf8 COLLATE utf8_bin,
  `updateUserID` int(11) NOT NULL DEFAULT 0,
  `mockRule` text CHARACTER SET utf8 COLLATE utf8_bin,
  `mockResult` text CHARACTER SET utf8 COLLATE utf8_bin,
  `mockConfig` text CHARACTER SET utf8 COLLATE utf8_bin,
  `apiSuccessStatusCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '200',
  `apiFailureStatusCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '200',
  `beforeInject` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `afterInject` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`apiID`, `groupID`, `apiURI`) USING BTREE,
  INDEX `groupID`(`groupID`) USING BTREE,
  INDEX `apiID`(`apiID`) USING BTREE,
  INDEX `projectID`(`projectID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_api_cache
-- ----------------------------
DROP TABLE IF EXISTS `eo_api_cache`;
CREATE TABLE `eo_api_cache`  (
  `cacheID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `projectID` int(10) UNSIGNED NOT NULL,
  `groupID` int(10) UNSIGNED NOT NULL,
  `apiID` int(10) UNSIGNED NOT NULL,
  `apiJson` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `starred` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `updateUserID` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cacheID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_api_env
-- ----------------------------
DROP TABLE IF EXISTS `eo_api_env`;
CREATE TABLE `eo_api_env`  (
  `envID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `envName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `projectID` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`envID`, `projectID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_api_env_front_uri
-- ----------------------------
DROP TABLE IF EXISTS `eo_api_env_front_uri`;
CREATE TABLE `eo_api_env_front_uri`  (
  `envID` int(10) UNSIGNED NOT NULL,
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uriID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `applyProtocol` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '-1',
  PRIMARY KEY (`uriID`, `envID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_api_env_header
-- ----------------------------
DROP TABLE IF EXISTS `eo_api_env_header`;
CREATE TABLE `eo_api_env_header`  (
  `headerID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `envID` int(11) NOT NULL,
  `applyProtocol` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `headerName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `headerValue` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`headerID`, `envID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_api_env_param
-- ----------------------------
DROP TABLE IF EXISTS `eo_api_env_param`;
CREATE TABLE `eo_api_env_param`  (
  `paramID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `envID` int(10) UNSIGNED NOT NULL,
  `paramKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `paramValue` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`paramID`, `envID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_api_env_param_additional
-- ----------------------------
DROP TABLE IF EXISTS `eo_api_env_param_additional`;
CREATE TABLE `eo_api_env_param_additional`  (
  `paramID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `envID` int(10) UNSIGNED NOT NULL,
  `paramKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `paramValue` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`paramID`, `envID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_api_group
-- ----------------------------
DROP TABLE IF EXISTS `eo_api_group`;
CREATE TABLE `eo_api_group`  (
  `groupID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `groupName` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `projectID` int(11) UNSIGNED NOT NULL,
  `parentGroupID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `isChild` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`groupID`, `projectID`) USING BTREE,
  INDEX `groupID`(`groupID`) USING BTREE,
  INDEX `projectID`(`projectID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_api_group_order
-- ----------------------------
DROP TABLE IF EXISTS `eo_api_group_order`;
CREATE TABLE `eo_api_group_order`  (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) NOT NULL,
  `orderList` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`orderID`, `projectID`) USING BTREE,
  UNIQUE INDEX `projectID`(`projectID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_api_header
-- ----------------------------
DROP TABLE IF EXISTS `eo_api_header`;
CREATE TABLE `eo_api_header`  (
  `headerID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `headerName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `headerValue` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apiID` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`headerID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_api_history
-- ----------------------------
DROP TABLE IF EXISTS `eo_api_history`;
CREATE TABLE `eo_api_history`  (
  `historyID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `projectID` int(10) UNSIGNED NOT NULL,
  `groupID` int(10) UNSIGNED NOT NULL,
  `apiID` int(10) UNSIGNED NOT NULL,
  `historyJson` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updateDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updateUserID` int(10) UNSIGNED NOT NULL,
  `updateTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isNow` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`historyID`, `apiID`, `updateTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_api_request_param
-- ----------------------------
DROP TABLE IF EXISTS `eo_api_request_param`;
CREATE TABLE `eo_api_request_param`  (
  `paramID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `paramName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `paramKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `paramValue` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `paramType` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `paramLimit` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `apiID` int(10) UNSIGNED NOT NULL,
  `paramNotNull` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`paramID`) USING BTREE,
  INDEX `apiID`(`apiID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_api_request_value
-- ----------------------------
DROP TABLE IF EXISTS `eo_api_request_value`;
CREATE TABLE `eo_api_request_value`  (
  `valueID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `valueDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `paramID` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`valueID`) USING BTREE,
  INDEX `paramID`(`paramID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_api_result_param
-- ----------------------------
DROP TABLE IF EXISTS `eo_api_result_param`;
CREATE TABLE `eo_api_result_param`  (
  `paramID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `paramName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `paramKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `apiID` int(11) UNSIGNED NOT NULL,
  `paramNotNull` tinyint(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`paramID`) USING BTREE,
  INDEX `apiID`(`apiID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 456 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_api_result_value
-- ----------------------------
DROP TABLE IF EXISTS `eo_api_result_value`;
CREATE TABLE `eo_api_result_value`  (
  `valueID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `valueDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `paramID` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`valueID`) USING BTREE,
  INDEX `resultParamID`(`paramID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 409 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_api_status_code_group_order
-- ----------------------------
DROP TABLE IF EXISTS `eo_api_status_code_group_order`;
CREATE TABLE `eo_api_status_code_group_order`  (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) NOT NULL,
  `orderList` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`orderID`, `projectID`) USING BTREE,
  UNIQUE INDEX `projectID`(`projectID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_api_test_history
-- ----------------------------
DROP TABLE IF EXISTS `eo_api_test_history`;
CREATE TABLE `eo_api_test_history`  (
  `testID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `apiID` int(10) UNSIGNED NOT NULL,
  `requestInfo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `resultInfo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `testTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `projectID` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`testID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 219 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_conn_database
-- ----------------------------
DROP TABLE IF EXISTS `eo_conn_database`;
CREATE TABLE `eo_conn_database`  (
  `connID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dbID` int(10) UNSIGNED NOT NULL,
  `userID` int(10) UNSIGNED NOT NULL,
  `userType` tinyint(1) NOT NULL DEFAULT 0,
  `inviteUserID` int(10) DEFAULT NULL,
  `partnerNickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`connID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_conn_project
-- ----------------------------
DROP TABLE IF EXISTS `eo_conn_project`;
CREATE TABLE `eo_conn_project`  (
  `connID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `projectID` int(11) UNSIGNED NOT NULL,
  `userID` int(11) UNSIGNED NOT NULL,
  `userType` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `inviteUserID` int(11) DEFAULT NULL,
  `partnerNickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`connID`, `projectID`, `userID`) USING BTREE,
  INDEX `projectID`(`projectID`) USING BTREE,
  INDEX `eo_conn_ibfk_2`(`userID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_database
-- ----------------------------
DROP TABLE IF EXISTS `eo_database`;
CREATE TABLE `eo_database`  (
  `dbID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dbName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dbVersion` float unsigned NOT NULL,
  `dbUpdateTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`dbID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_database_table
-- ----------------------------
DROP TABLE IF EXISTS `eo_database_table`;
CREATE TABLE `eo_database_table`  (
  `dbID` int(10) UNSIGNED NOT NULL,
  `tableID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tableName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tableDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`tableID`, `dbID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_database_table_field
-- ----------------------------
DROP TABLE IF EXISTS `eo_database_table_field`;
CREATE TABLE `eo_database_table_field`  (
  `fieldID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fieldName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fieldType` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fieldLength` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isNotNull` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `isPrimaryKey` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `fieldDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tableID` int(10) UNSIGNED NOT NULL,
  `defaultValue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`fieldID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_log_project_operation
-- ----------------------------
DROP TABLE IF EXISTS `eo_log_project_operation`;
CREATE TABLE `eo_log_project_operation`  (
  `opID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `opType` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `opUserID` int(10) UNSIGNED NOT NULL,
  `opDesc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `opTime` datetime(0) NOT NULL,
  `opProjectID` int(10) UNSIGNED NOT NULL,
  `opTarget` tinyint(3) UNSIGNED NOT NULL,
  `opTargetID` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`opID`, `opTargetID`, `opProjectID`, `opUserID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_message
-- ----------------------------
DROP TABLE IF EXISTS `eo_message`;
CREATE TABLE `eo_message`  (
  `msgID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `toUserID` int(10) UNSIGNED NOT NULL,
  `fromUserID` int(10) UNSIGNED NOT NULL,
  `msgSendTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `msgType` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isRead` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `otherMsg` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`msgID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_project
-- ----------------------------
DROP TABLE IF EXISTS `eo_project`;
CREATE TABLE `eo_project`  (
  `projectID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `projectType` tinyint(1) UNSIGNED NOT NULL,
  `projectName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `projectUpdateTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `projectVersion` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1.0',
  PRIMARY KEY (`projectID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_project_document
-- ----------------------------
DROP TABLE IF EXISTS `eo_project_document`;
CREATE TABLE `eo_project_document`  (
  `documentID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `groupID` int(10) UNSIGNED NOT NULL,
  `projectID` int(10) UNSIGNED NOT NULL,
  `contentType` tinyint(3) UNSIGNED NOT NULL,
  `contentRaw` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updateTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `userID` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`documentID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_project_document_group
-- ----------------------------
DROP TABLE IF EXISTS `eo_project_document_group`;
CREATE TABLE `eo_project_document_group`  (
  `groupID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `projectID` int(10) UNSIGNED NOT NULL,
  `groupName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parentGroupID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `isChild` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`groupID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_project_document_group_order
-- ----------------------------
DROP TABLE IF EXISTS `eo_project_document_group_order`;
CREATE TABLE `eo_project_document_group_order`  (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) NOT NULL,
  `orderList` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`orderID`, `projectID`) USING BTREE,
  UNIQUE INDEX `projectID`(`projectID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_project_environment
-- ----------------------------
DROP TABLE IF EXISTS `eo_project_environment`;
CREATE TABLE `eo_project_environment`  (
  `envID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `envName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `envURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `projectID` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`envID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_project_invite
-- ----------------------------
DROP TABLE IF EXISTS `eo_project_invite`;
CREATE TABLE `eo_project_invite`  (
  `projectID` int(11) UNSIGNED NOT NULL,
  `inviteCode` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updateTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`projectID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_project_status_code
-- ----------------------------
DROP TABLE IF EXISTS `eo_project_status_code`;
CREATE TABLE `eo_project_status_code`  (
  `codeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `codeDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `groupID` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`codeID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_project_status_code_group
-- ----------------------------
DROP TABLE IF EXISTS `eo_project_status_code_group`;
CREATE TABLE `eo_project_status_code_group`  (
  `groupID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `projectID` int(10) UNSIGNED NOT NULL,
  `groupName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parentGroupID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `isChild` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`groupID`, `projectID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_project_test_case
-- ----------------------------
DROP TABLE IF EXISTS `eo_project_test_case`;
CREATE TABLE `eo_project_test_case`  (
  `caseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `projectID` int(11) NOT NULL COMMENT '项目ID',
  `userID` int(11) NOT NULL COMMENT '用户ID',
  `caseName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用例名称',
  `caseDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用例描述',
  `createTime` datetime(0) NOT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NOT NULL COMMENT '更新时间',
  `groupID` int(11) NOT NULL COMMENT '分组ID',
  `caseType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0表示简单，1表示高级',
  `caseCode` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`caseID`, `projectID`, `userID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_project_test_case_group
-- ----------------------------
DROP TABLE IF EXISTS `eo_project_test_case_group`;
CREATE TABLE `eo_project_test_case_group`  (
  `groupID` int(11) NOT NULL AUTO_INCREMENT COMMENT '分组ID',
  `groupName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组名',
  `projectID` int(11) NOT NULL COMMENT '项目ID',
  `parentGroupID` int(11) NOT NULL DEFAULT 0 COMMENT '父分组',
  `isChild` tinyint(3) NOT NULL DEFAULT 0 COMMENT '是否子分组',
  PRIMARY KEY (`groupID`, `projectID`, `parentGroupID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_project_test_case_group_order
-- ----------------------------
DROP TABLE IF EXISTS `eo_project_test_case_group_order`;
CREATE TABLE `eo_project_test_case_group_order`  (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) NOT NULL,
  `orderList` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`orderID`, `projectID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_project_test_case_history
-- ----------------------------
DROP TABLE IF EXISTS `eo_project_test_case_history`;
CREATE TABLE `eo_project_test_case_history`  (
  `testID` int(11) NOT NULL AUTO_INCREMENT COMMENT '测试ID',
  `caseID` int(11) NOT NULL COMMENT '用例ID',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '测试结果',
  `testTime` datetime(0) DEFAULT NULL COMMENT '测试时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '0表示失败，1表示通过',
  PRIMARY KEY (`testID`, `caseID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_project_test_case_single
-- ----------------------------
DROP TABLE IF EXISTS `eo_project_test_case_single`;
CREATE TABLE `eo_project_test_case_single`  (
  `connID` int(11) NOT NULL AUTO_INCREMENT COMMENT '关联ID',
  `caseID` int(11) NOT NULL COMMENT '用例ID',
  `caseData` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `caseCode` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '用例代码',
  `statusCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `matchType` tinyint(4) DEFAULT NULL,
  `matchRule` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `apiName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接口名称',
  `apiURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接口路径',
  `apiRequestType` tinyint(4) DEFAULT 0 COMMENT '请求参数类型',
  `orderNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`connID`, `caseID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eo_user
-- ----------------------------
DROP TABLE IF EXISTS `eo_user`;
CREATE TABLE `eo_user`  (
  `userID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userName` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userPassword` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userNickName` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`userID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

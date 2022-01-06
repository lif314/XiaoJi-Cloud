-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: xxxxxxxxxxxx    Database: soa_device
-- ------------------------------------------------------
-- Server version	8.0.26

CREATE DATABASE  IF NOT EXISTS `soa_device` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `soa_device`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iot_category`
--

DROP TABLE IF EXISTS `iot_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iot_category` (
  `category_id` bigint NOT NULL AUTO_INCREMENT COMMENT '设备分类ID',
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备分类名称',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot_category`
--

LOCK TABLES `iot_category` WRITE;
/*!40000 ALTER TABLE `iot_category` DISABLE KEYS */;
INSERT INTO `iot_category` VALUES (1,'wifi通断器','0','','2021-12-06 01:00:04','','2021-12-06 01:05:08','智能开关，带温湿度传感器，支持手机和射频遥控控制。应用于传统家电设备的控制等。'),(2,'智能灯','0','','2021-12-06 01:01:39','','2021-12-06 01:05:32','智能七彩灯，支持雷达感应、报警，手机和射频遥控控制。应用于环境灯、感应灯和传统灯的控制等。'),(3,'智能门锁','0','','2021-12-06 01:02:34','','2021-12-06 01:04:22','支持手机和射频遥控控制。'),(4,'智能水阀','0','','2021-12-06 01:03:57','',NULL,'手机和射频遥控控制，应用于浇灌系统。'),(5,'其他','0','','2021-12-28 19:31:05','',NULL,'其他硬件设备的接入');
/*!40000 ALTER TABLE `iot_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iot_device`
--

DROP TABLE IF EXISTS `iot_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iot_device` (
  `device_id` bigint NOT NULL AUTO_INCREMENT COMMENT '设备ID',
  `device_num` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备编号',
  `category_id` bigint DEFAULT NULL COMMENT '设备分类',
  `device_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备名称',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `firmware_version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '固件版本',
  `owner_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '设备用户ID',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '未激活' COMMENT '设备状态：未激活，未绑定，已绑定',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`device_id`) USING BTREE,
  KEY `iot_device_category` (`category_id`) USING BTREE,
  CONSTRAINT `iot_device_category` FOREIGN KEY (`category_id`) REFERENCES `iot_category` (`category_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot_device`
--

LOCK TABLES `iot_device` WRITE;
/*!40000 ALTER TABLE `iot_device` DISABLE KEYS */;
INSERT INTO `iot_device` VALUES (1,'7CDFA1049ADA',5,'小济空调','小济空调就是好！','1.0','1','0','未激活','','2021-12-23 14:26:38','','2021-12-30 11:22:45'),(2,'7CDFA1049ADB',1,'智能开关-测试','暂无','1.0','1','0','未激活','','2021-12-23 14:26:38','','2021-12-15 02:47:52'),(3,'7CDFA1049ADC',1,'设备名称','remark','1.0','1','0','未激活','','2021-12-23 14:26:38','','2021-12-15 02:47:52'),(4,'863488052352472',4,'4G开关001','灯等等灯','1.0','1','0','未绑定','',NULL,'','2021-12-30 20:11:17');
/*!40000 ALTER TABLE `iot_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iot_device_group`
--

DROP TABLE IF EXISTS `iot_device_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iot_device_group` (
  `device_group_id` bigint NOT NULL AUTO_INCREMENT COMMENT '设备分组ID',
  `group_id` bigint NOT NULL COMMENT '分组ID',
  `device_id` bigint NOT NULL COMMENT '设备ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`device_group_id`) USING BTREE,
  KEY `iot_device_group_group_id` (`group_id`) USING BTREE,
  KEY `iot_device_group_device_id` (`device_id`) USING BTREE,
  CONSTRAINT `iot_device_group_device_id` FOREIGN KEY (`device_id`) REFERENCES `iot_device` (`device_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `iot_device_group_group_id` FOREIGN KEY (`group_id`) REFERENCES `iot_group` (`group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot_device_group`
--

LOCK TABLES `iot_device_group` WRITE;
/*!40000 ALTER TABLE `iot_device_group` DISABLE KEYS */;
INSERT INTO `iot_device_group` VALUES (1,1,1,'2021-12-11 23:25:49'),(2,2,1,'2021-12-11 23:25:49'),(6,1,2,'2021-12-11 23:25:49'),(7,2,2,'2021-12-11 23:25:49');
/*!40000 ALTER TABLE `iot_device_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iot_device_set`
--

DROP TABLE IF EXISTS `iot_device_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iot_device_set` (
  `device_set_id` bigint NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `device_id` bigint DEFAULT NULL COMMENT '设备ID',
  `device_num` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备编号',
  `is_alarm` tinyint(1) DEFAULT NULL COMMENT '是否启用报警',
  `is_radar` tinyint(1) DEFAULT NULL COMMENT '是否启用雷达感应',
  `is_host` tinyint(1) DEFAULT NULL COMMENT '是否托管',
  `is_reset` tinyint(1) DEFAULT NULL COMMENT '是否重启',
  `is_ap` tinyint(1) DEFAULT NULL COMMENT '是否打开AP',
  `is_smart_config` tinyint(1) DEFAULT NULL COMMENT '是否智能配网',
  `is_wifi_offline` tinyint(1) DEFAULT NULL COMMENT '是否离线模式',
  `is_open_certifi` tinyint(1) DEFAULT NULL COMMENT '是否使用证书',
  `is_rf_control` tinyint(1) DEFAULT NULL COMMENT '是否启用射频遥控',
  `is_rf_learn` tinyint(1) DEFAULT NULL COMMENT '是否遥控配对',
  `is_rf_clear` tinyint(1) DEFAULT NULL COMMENT '是否遥控清码',
  `rf_one_func` tinyint DEFAULT NULL COMMENT 'RF遥控第一个按键功能',
  `rf_two_func` tinyint DEFAULT NULL COMMENT 'RF遥控第二个按键功能',
  `rf_three_func` tinyint DEFAULT NULL COMMENT 'RF遥控第三个按键功能',
  `rf_four_func` tinyint DEFAULT NULL COMMENT 'RF遥控第四个按键功能',
  `owner_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '设备用户ID，用于记录配网后用户的变更',
  `network_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '配网地址',
  `network_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '配网IP',
  `radar_interval` smallint DEFAULT NULL COMMENT '雷达感应间隔，单位秒',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`device_set_id`) USING BTREE,
  KEY `iot_device_config` (`device_id`) USING BTREE,
  CONSTRAINT `iot_device_config` FOREIGN KEY (`device_id`) REFERENCES `iot_device` (`device_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot_device_set`
--

LOCK TABLES `iot_device_set` WRITE;
/*!40000 ALTER TABLE `iot_device_set` DISABLE KEYS */;
INSERT INTO `iot_device_set` VALUES (1,1,'7CDFA1049ADA',1,1,1,0,0,0,0,0,1,0,0,1,2,3,4,'1','内网','127.0.0.1',5,'0','','2021-12-26 20:25:10','',NULL,NULL),(2,2,'7CDFA1049ADB',0,0,1,0,0,0,0,0,1,0,0,1,2,3,4,'1','内网','127.0.0.1',5,'0','','2021-12-01 00:12:26','','2021-12-23 20:59:33',NULL),(3,4,'863488052352472',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','',NULL,'',NULL,NULL);
/*!40000 ALTER TABLE `iot_device_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iot_device_status`
--

DROP TABLE IF EXISTS `iot_device_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iot_device_status` (
  `device_status_id` bigint NOT NULL AUTO_INCREMENT COMMENT '设备状态ID',
  `device_id` bigint DEFAULT NULL COMMENT '设备ID',
  `device_num` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备编号',
  `relay_status` tinyint(1) DEFAULT NULL COMMENT '继电器状态:0-关，1-开',
  `light_status` tinyint(1) DEFAULT NULL COMMENT '灯状态:0-关，1-开',
  `is_online` tinyint(1) DEFAULT NULL COMMENT '设备是否在线',
  `rssi` tinyint DEFAULT NULL COMMENT 'wifi信号强度',
  `device_temperature` float(6,2) DEFAULT NULL COMMENT '设备温度',
  `air_temperature` float(6,2) DEFAULT NULL COMMENT '空气温度',
  `air_humidity` float(6,2) DEFAULT NULL COMMENT '空气湿度',
  `trigger_source` tinyint DEFAULT NULL COMMENT '触发源：0-无、1-按键、2.手机、3-浏览器、4-射频遥控、5-雷达、6-报警、7-定时',
  `brightness` tinyint unsigned DEFAULT NULL COMMENT '灯的亮度：0-100',
  `light_interval` int DEFAULT NULL COMMENT '渐变、动感模式闪烁间隔，单位秒',
  `light_mode` tinyint DEFAULT NULL COMMENT '灯模式：1-、2-、3-、4-、5-、6-',
  `fade_time` int DEFAULT NULL COMMENT '灯渐变时间',
  `red` tinyint unsigned DEFAULT NULL COMMENT '红灯值：0-255',
  `green` tinyint unsigned DEFAULT NULL COMMENT '绿灯值：0-255',
  `blue` tinyint unsigned DEFAULT NULL COMMENT '蓝灯值：0-255',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`device_status_id`) USING BTREE,
  KEY `iot_device_status` (`device_id`) USING BTREE,
  CONSTRAINT `iot_device_status` FOREIGN KEY (`device_id`) REFERENCES `iot_device` (`device_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2880 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot_device_status`
--

LOCK TABLES `iot_device_status` WRITE;
/*!40000 ALTER TABLE `iot_device_status` DISABLE KEYS */;
INSERT INTO `iot_device_status` VALUES (1,1,'7CDFA1049ADA',1,1,1,-80,36.52,0.00,0.00,0,100,432,0,259,255,254,241,'0','','2021-12-26 20:27:17','',NULL,NULL),(2,2,'7CDFA1049ADB',0,1,0,-46,23.78,0.00,0.00,0,100,100,0,100,255,255,255,'0','','2021-12-01 00:13:38','','2021-12-23 21:00:37',NULL),(2846,1,'7CDFA1049ADA',1,0,1,-80,36.52,0.00,0.00,0,100,432,0,259,255,254,241,'0','','2021-12-26 18:38:11','',NULL,NULL),(2847,1,'7CDFA1049ADA',1,1,1,-80,36.52,0.00,0.00,0,100,432,0,259,255,254,241,'0','','2021-11-26 18:38:12','',NULL,NULL),(2848,1,'7CDFA1049ADA',1,0,1,-80,36.52,0.00,0.00,0,100,432,0,259,255,254,241,'0','','2021-11-26 18:38:13','',NULL,NULL),(2849,1,'7CDFA1049ADA',1,1,1,-80,36.52,0.00,0.00,0,100,432,0,259,255,254,241,'0','','2021-11-26 18:38:17','',NULL,NULL),(2850,4,'863488052352472',1,1,1,-80,36.52,0.00,0.00,0,100,432,0,259,255,254,241,'0','','2021-11-26 18:38:17','',NULL,NULL),(2851,4,'863488052352472',0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-11-30 20:11:20','',NULL,NULL),(2852,4,'863488052352472',1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-11-30 20:11:22','',NULL,NULL),(2853,4,'863488052352472',1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-11-30 20:11:23','',NULL,NULL),(2854,4,'863488052352472',1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-11-30 20:14:13','',NULL,NULL),(2855,4,'863488052352472',0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:14:13','',NULL,NULL),(2856,4,'863488052352472',1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:19:29','',NULL,NULL),(2857,4,'863488052352472',0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:19:31','',NULL,NULL),(2858,4,'863488052352472',1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:20:02','',NULL,NULL),(2859,4,'863488052352472',0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:20:03','',NULL,NULL),(2860,4,'863488052352472',1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:23:34','',NULL,NULL),(2861,4,'863488052352472',0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:23:40','',NULL,NULL),(2862,4,'863488052352472',1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:24:37','',NULL,NULL),(2863,4,'863488052352472',0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:24:39','',NULL,NULL),(2864,4,'863488052352472',1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:24:41','',NULL,NULL),(2865,4,'863488052352472',0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:24:43','',NULL,NULL),(2866,4,'863488052352472',1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:24:47','',NULL,NULL),(2867,4,'863488052352472',0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:24:50','',NULL,NULL),(2868,4,'863488052352472',1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:24:51','',NULL,NULL),(2869,4,'863488052352472',1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:25:08','',NULL,NULL),(2870,4,'863488052352472',0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:25:10','',NULL,NULL),(2871,4,'863488052352472',1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:25:10','',NULL,NULL),(2872,4,'863488052352472',0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:25:11','',NULL,NULL),(2873,4,'863488052352472',1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:25:12','',NULL,NULL),(2874,4,'863488052352472',0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:25:13','',NULL,NULL),(2875,4,'863488052352472',1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:25:14','',NULL,NULL),(2876,4,'863488052352472',0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:25:14','',NULL,NULL),(2877,4,'863488052352472',1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:25:15','',NULL,NULL),(2878,4,'863488052352472',0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2021-08-31 20:25:15','',NULL,NULL),(2879,1,'2',1,1,1,1,34.00,12.00,34.00,2,12,212,2,23,1,NULL,NULL,'0','','2021-12-30 12:54:52','',NULL,NULL);
/*!40000 ALTER TABLE `iot_device_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iot_device_user_relation`
--

DROP TABLE IF EXISTS `iot_device_user_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iot_device_user_relation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `device_id` int NOT NULL,
  `device_num` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备备注',
  `gmt_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`,`device_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户-设备关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot_device_user_relation`
--

LOCK TABLES `iot_device_user_relation` WRITE;
/*!40000 ALTER TABLE `iot_device_user_relation` DISABLE KEYS */;
INSERT INTO `iot_device_user_relation` VALUES (8,115,4,'863488052352472','测试开关',NULL,'2021-08-28 13:35:23','2021-12-30 10:49:21'),(10,114,4,'863488052352472','小济神灯','灯等等灯','2021-08-30 10:57:14','2021-12-30 10:49:21'),(13,116,4,'863488052352472','小济神灯',NULL,'2021-08-31 20:24:31','2021-12-30 10:49:21');
/*!40000 ALTER TABLE `iot_device_user_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iot_group`
--

DROP TABLE IF EXISTS `iot_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iot_group` (
  `group_id` bigint NOT NULL AUTO_INCREMENT COMMENT '设备分组ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `group_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备分组名称',
  `group_order` smallint(5) unsigned zerofill DEFAULT '00000' COMMENT '分组的排序',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot_group`
--

LOCK TABLES `iot_group` WRITE;
/*!40000 ALTER TABLE `iot_group` DISABLE KEYS */;
INSERT INTO `iot_group` VALUES (1,114,'客厅',00001,'0','','2021-05-18 16:35:03','','2021-05-18 16:35:32','智能灯'),(2,114,'Room1',00002,'0','','2021-05-18 16:35:03','','2021-05-18 16:35:32','智能灯'),(3,114,'小济专属间',00003,'0','','2021-05-18 16:35:03','','2021-05-18 16:35:32','智能灯'),(4,114,'Room2',00004,'0','','2021-05-18 16:35:03','','2021-05-18 16:35:32','智能灯'),(5,114,'Room3',00005,'0','','2021-05-18 16:35:03','','2021-05-18 16:35:32','智能灯');
/*!40000 ALTER TABLE `iot_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','小济智能','00','xiaoji@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2021-12-29 15:26:48','admin','2021-12-29 15:26:48','',NULL,'管理员'),(2,105,'xiaoji','小济','00','tongji@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2021-12-29 15:26:48','admin','2021-12-29 15:26:48','',NULL,'测试员'),(100,NULL,'public','访客','00','','','0','','$2a$10$E8d4gZ3.QQzDE7LBfY7XpuuGX.LvWFcA982AAdAzk24u91bQ1nete','0','0','',NULL,'admin','2021-12-29 15:26:48','admin','2021-12-29 15:26:48',NULL),(101,NULL,'aaa','xxx','00','','','0','','$2a$10$f.KtWGpaUsdvl2E427/H4OnPi2dYx8HetxnBs1uasSNwCBBUDSwjO','0','0','',NULL,'admin','2021-12-29 15:26:48','',NULL,NULL),(114,NULL,'EB5312FB4A26','微信注册用户','00','','','0','','$2a$10$iWySi4cYQ.0DFSMFCzofbu1H13Dd03WW7h/0OZPzQcBd.7f1fWjV.','0','0','',NULL,'微信小程序','2021-12-29 15:26:48','',NULL,NULL),(115,NULL,'A1BB9722086A','微信注册用户','00','','','0','','$2a$10$rAoFt5nuPw/2CXhRsa/uoOjExW0XH3xM009kcWWo12rzFiSgIK.n2','0','0','',NULL,'微信小程序','2021-12-29 15:26:48','',NULL,NULL),(116,NULL,'6F1B3F33DD38','微信注册用户','00','','','0','','$2a$10$SUR7vd7YIiMkFBFSTKba7uTc5FdpAdwyMuzUsUpMjkgTC0NfiRpqK','0','0','',NULL,'微信小程序','2021-12-29 15:26:48','',NULL,NULL),(119,NULL,'llf','Lifer',NULL,NULL,NULL,NULL,NULL,'$2a$10$RlILLNNqnlLjVcSGZ2LSwOa2BBKMbHKCOKIruCQYNhxb98MfJKQt.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(120,NULL,'sgc','sgc',NULL,NULL,NULL,NULL,NULL,'$2a$10$Z6mhZtyG5x6TxoN4r5A3eesAXooqFfdzr0SZ9oAsRpYFTvkWp1SB.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_account_info`
--

DROP TABLE IF EXISTS `t_user_account_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user_account_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'sessionKey',
  `access_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'accessToken',
  `open_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `union_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号',
  `birthday` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生日',
  `status` int NOT NULL DEFAULT '1' COMMENT '用户状态：0-冻结，1-正常',
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '国家',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '城市',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `user_type` int NOT NULL DEFAULT '0' COMMENT '用户类型：0-未授权用户，1-消费者，2-商家',
  `admin_id` int DEFAULT NULL COMMENT '绑定的管理员编号',
  `last_login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gmt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `open_id` (`open_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=200030 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='小程序用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_account_info`
--

LOCK TABLES `t_user_account_info` WRITE;
/*!40000 ALTER TABLE `t_user_account_info` DISABLE KEYS */;
INSERT INTO `t_user_account_info` VALUES (200029,'wd4/hPuBQ+ummo/NOv1Rsw==','ced50c3733424484becfa6a68e4066fc','oRHbg4mTdANmQwDhuQAD8vBbkNG0',NULL,'新注册用户','https://c-ssl.duitang.com/uploads/item/201912/27/20191227145714_rtHRc.thumb.1000_0.jpeg',NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,'2021-08-26 17:02:10','127.0.0.1','2021-08-26 16:30:57','2021-08-26 17:02:08');
/*!40000 ALTER TABLE `t_user_account_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_login_log`
--

DROP TABLE IF EXISTS `t_user_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user_login_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户类型',
  `user_id` int NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `open_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP地址',
  `gmt_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1725 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_login_log`
--

LOCK TABLES `t_user_login_log` WRITE;
/*!40000 ALTER TABLE `t_user_login_log` DISABLE KEYS */;
INSERT INTO `t_user_login_log` VALUES (1718,'未授权用户',200029,'023mpv0w3w8VXW22mg2w34Vlyj3mpv01','oRHbg4mTdANmQwDhuQAD8vBbkNG0','127.0.0.1','2021-08-26 16:30:57',NULL),(1719,'未授权用户',200029,'083hBWkl269zD74Ioxol2Rqaaq0hBWkA','oRHbg4mTdANmQwDhuQAD8vBbkNG0','127.0.0.1','2021-08-26 16:56:12',NULL),(1720,'未授权用户',200029,'073d93000npdjM15qS100TtVyj3d930s','oRHbg4mTdANmQwDhuQAD8vBbkNG0','127.0.0.1','2021-08-26 16:59:18',NULL),(1721,'未授权用户',200029,'053NjS000cfoiM1siM300P1HhV1NjS0W','oRHbg4mTdANmQwDhuQAD8vBbkNG0','127.0.0.1','2021-08-26 16:59:42',NULL),(1722,'未授权用户',200029,'043nlS000U9niM1a6I0007YZCb3nlS0u','oRHbg4mTdANmQwDhuQAD8vBbkNG0','127.0.0.1','2021-08-26 17:00:07',NULL),(1723,'未授权用户',200029,'0039Zull2tOZC74R3Pnl2Hpg8l49Zul1','oRHbg4mTdANmQwDhuQAD8vBbkNG0','127.0.0.1','2021-08-26 17:00:51',NULL),(1724,'未授权用户',200029,'013pCmFa1E5TDB0fpIIa138qab2pCmFl','oRHbg4mTdANmQwDhuQAD8vBbkNG0','127.0.0.1','2021-08-26 17:02:08',NULL);
/*!40000 ALTER TABLE `t_user_login_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-03 20:29:21
